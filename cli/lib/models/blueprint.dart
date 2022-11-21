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

    return BluePrint(
      name: data['name'],
      module: data['module'] ?? 'root',
      properties: properties,
    );
  }

  List<String> get appModelImports {
    final List<String> importStrings = [];
    for (final p in properties) {
      if (!PRIMITIVE_TYPES.contains(p.type)) {
        if (p.module != null && p.module != 'root') {
          importStrings.add("import 'package:${appName()}/feature/${snakeCase(p.module!)}/${snakeCase(p.type)}/models/${snakeCase(p.type)}.dart';");
        } else {
          importStrings.add("import 'package:${appName()}/feature/${snakeCase(p.type)}/models/${snakeCase(p.type)}.dart';");
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
          if (p.module != null) {
            importStrings.add("from ${snakeCase(p.module!)}.models import ${pascalCase(p.type)}");
          }
        }
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
      'serviceModelImports': serviceModelImports,
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
];

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
      allowBlank: data['allowBlank'] ?? true,
      allowNull: data['allowNull'] ?? true,
      defaultValue: data['defaultValue'],
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
        return 'String';
      case "bool":
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
        return 'models.URLField';
      case "bool":
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
    if (PRIMITIVE_TYPES.contains(type)) {
      return '${snakeCase(name)} = $_serviceVariableType(_("${titleCase(name)}"))';
    }

    return '''${snakeCase(name)} = models.ForeignKey(
      '${snakeCase(module!)}.${pascalCase(type)}', 
      verbose_name=_("${titleCase(name)}"),
      on_delete=models.CASCADE,
    )''';
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
