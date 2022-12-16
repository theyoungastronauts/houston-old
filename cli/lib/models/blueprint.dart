import 'package:cli/strings.dart';
import 'package:cli/utils.dart';
import 'package:dcli/dcli.dart';
import 'package:yaml/yaml.dart';
import 'package:collection/collection.dart';

class BluePrint {
  final String name;
  final String module;
  final List<BlueprintProperty> properties;
  late String namePlural;
  late String label;
  late String labelPlural;

  BluePrint({
    required this.name,
    required this.module,
    required this.properties,
    String? namePlural,
    String? label,
    String? labelPlural,
  }) {
    this.namePlural = namePlural ?? "${name}s";
    this.label = label ?? titleCase(name);
    this.labelPlural = labelPlural ?? "${titleCase(name)}s";
  }

  factory BluePrint.fromYaml(YamlMap data) {
    final properties = data['properties'].map<BlueprintProperty>((p) => BlueprintProperty.fromYaml(p)).toList();

    if (data['module'] == null) {
      throw Exception(red("Module Name required"));
    }

    return BluePrint(
      name: data['name'],
      module: data['module'],
      properties: properties,
    );
  }

  List<String> get appModelImports {
    final List<String> importStrings = [];
    for (final p in properties) {
      if (!PRIMITIVE_TYPES.contains(p.type)) {
        if (p.module == module) {
          importStrings.add("import '../${snakeCase(p.type)}/models/${snakeCase(p.type)}.dart';");
        } else {
          importStrings.add("import '../../../${snakeCase(p.module)}/${snakeCase(p.type)}/models/${snakeCase(p.type)}.dart';");
        }
      }
    }

    return importStrings;
  }

  List<String> get serviceModelImports {
    final List<String> importStrings = [];
    for (final p in properties) {
      if (!PRIMITIVE_TYPES.contains(p.type)) {
        if (p.type == "user") {
          importStrings.add("from django.contrib.auth import get_user_model");
        } else {
          importStrings.add("from ${snakeCase(p.module)}.models import ${pascalCase(p.type)}");
        }
      }

      if (p.type == "bitpack_image" || p.type == "bitpack_file") {
        importStrings.add("from django.core.validators import RegexValidator");
        importStrings.add("from django.conf import settings");
      }
    }

    return importStrings;
  }

  bool get shouldRegisterUser {
    return properties.firstWhereOrNull((p) => p.module == 'access' && p.type == 'user') != null;
  }

  Map<String, dynamic> serialize() {
    return {
      'project': appName(),
      'module': module,
      'name': name,
      'namePlural': namePlural,
      'label': label,
      'labelPlural': labelPlural,
      'properties': properties.map<Map<String, dynamic>>((p) => p.serialize()).toList(),
      'appModelImports': appModelImports,
      'serviceModelImports': serviceModelImports.toSet().toList()..sort(),
      'shouldRegisterUser': shouldRegisterUser,
    };
  }
}

// ignore: constant_identifier_names
const PRIMITIVE_TYPES = [
  'char',
  'text',
  'url',
  'boolean',
  'int',
  'double',
  'bitpack_image',
  'bitpack_file',
];

class Kwarg {
  final String key;
  final dynamic value;

  const Kwarg(this.key, this.value);
}

class BlueprintProperty {
  final String name;
  final String type;
  final int? maxLength;
  final dynamic defaultValue;
  final bool allowBlank;
  final bool allowNull;
  final String module;

  const BlueprintProperty({
    required this.name,
    required this.type,
    this.maxLength,
    required this.allowBlank,
    required this.allowNull,
    this.defaultValue,
    required this.module,
  });

  factory BlueprintProperty.fromYaml(YamlMap data) {
    String? type = data['type'];

    // validate type
    if (type == null) {
      throw Exception(red("type required"));
    }

    String module = 'root';

    if (type.contains('.')) {
      final parts = type.split('.');
      module = parts.first;
      type = type.split('.').last;
    }

    // if (!PROPERTY_TYPES.contains(data['type'])) {
    //   throw Exception(red("Invalid Property Type `$type`"));
    // }

    return BlueprintProperty(
      name: data['name'],
      type: type.toString().toLowerCase(),
      maxLength: data['max_length'],
      allowBlank: data['blank'] ?? true,
      allowNull: data['null'] ?? true,
      defaultValue: data['default'],
      module: module,
    );
  }

  List<Map<String, dynamic>> get _appAnnotations {
    final List<Map<String, dynamic>> values = [];
    if (snakeCase(name) != camelCase(name)) {
      values.add({'name': snakeCase(name)});
    }

    if (defaultValue != null) {
      values.add({"defaultValue": defaultValue});
    }

    return values;
  }

  String _appAnnotationValueToString(Map<String, dynamic> kv) {
    final v = kv[kv.keys.first];
    if (v.runtimeType == String) {
      return '${kv.keys.first}: "$v"';
    }
    return '${kv.keys.first}: $v';
  }

  String get _appAnnotation {
    final values = _appAnnotations;

    if (_appAnnotations.isNotEmpty) {
      return '@JsonKey(${values.map((item) => _appAnnotationValueToString(item)).toList().join(", ")}) ';
    }

    return '';
  }

  String get _appVariableType {
    switch (type) {
      case "char":
      case "text":
      case "url":
      case "bitpack_image":
      case "bitpack_file":
        return 'String';
      case "boolean":
        return 'bool';
      case "int":
        return 'int';
      case "double":
        return 'double';
      default:
        return pascalCase(type);
    }
  }

  String get appModelEntry {
    final value =
        "$_appAnnotation${allowNull == true && defaultValue == null ? '' : 'required '}$_appVariableType${allowNull ? '?' : ''} ${camelCase(name)},";
    return value;
  }

  String get _serviceVariableType {
    switch (type) {
      case "char":
        return 'models.CharField';
      case "text":
        return 'models.TextField';
      case "url":
      case "bitpack_image":
      case "bitpack_file":
        return 'models.URLField';
      case "boolean":
        return 'models.BooleanField';
      case "int":
        return 'models.IntegerField';
      case "double":
        return 'models.DecimalField';
      default:
        return "models.ForeignKey";
    }
  }

  String get serviceModelEntry {
    List<String> args = [];
    List<Kwarg> kwargs = [];

    if (PRIMITIVE_TYPES.contains(type)) {
      args.add('_("${titleCase(name)}")');
    } else {
      args.add('"${snakeCase(module)}.${pascalCase(type)}"');
      kwargs.add(Kwarg('verbose_name', '_("${titleCase(name)}")'));
      kwargs.add(Kwarg('on_delete', 'models.CASCADE'));
    }

    if (type == "double" || type == "decimal") {
      kwargs.add(Kwarg('decimal_places', 2)); //TODO: get from blueprint
      kwargs.add(Kwarg('max_digits', 12)); //TODO: get from blueprint
    }

    if (type == 'char') {
      kwargs.add(Kwarg('max_length', maxLength ?? 255));
    }

    if (type == "bitpack_image") {
      kwargs.add(Kwarg('validators', '[RegexValidator(settings.BITPACK_IMAGE_URL_RE)]'));
    }
    if (type == "bitpack_file") {
      kwargs.add(Kwarg('validators', '[RegexValidator(settings.BITPACK_FILE_URL_RE)]'));
    }

    if (defaultValue != null) {
      final defaultValueString = defaultValue.toString();
      String? value;

      if (defaultValueString == "true") {
        value = "True";
      } else if (defaultValueString == "false") {
        value = "False";
      } else if (int.tryParse(defaultValueString) != null || double.tryParse(defaultValueString) != null) {
        value = defaultValueString;
      } else {
        value = '"$defaultValueString"';
      }

      kwargs.add(Kwarg('default', value));
    }

    final kwargsString = kwargs.map((p) => "${p.key}=${p.value},").toList().join(' ');
    String params = args.join(", ");

    params = '$params, $kwargsString';

    if (PRIMITIVE_TYPES.contains(type)) {
      return '''${snakeCase(name)} = $_serviceVariableType($params)''';
    }

    return '''${snakeCase(name)} = models.ForeignKey($params)''';
  }

  Map<String, dynamic> serialize() {
    return {
      'name': name,
      'type': type,
      'maxLength': maxLength,
      'default': defaultValue,
      'allowBlank': allowBlank,
      'allowNull': allowNull,
      'appModelEntry': appModelEntry,
      'serviceModelEntry': serviceModelEntry,
    };
  }
}
