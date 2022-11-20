import 'package:cli/strings.dart';
import 'package:cli/utils.dart';
import 'package:dcli/dcli.dart';
import 'package:yaml/yaml.dart';

class BluePrint {
  final String name;
  final String module;
  final List<BlueprintProperty> properties;

  const BluePrint({
    required this.name,
    required this.module,
    required this.properties,
  });

  factory BluePrint.fromYaml(YamlMap data) {
    final properties = data['properties'].map<BlueprintProperty>((p) => BlueprintProperty.fromYaml(p)).toList();

    return BluePrint(
      name: data['name'],
      module: data['module'] ?? 'root',
      properties: properties,
    );
  }

  List<String> get modelImports {
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

  Map<String, dynamic> serialize() {
    return {
      'project': appName(),
      'name': name,
      'properties': properties.map<Map<String, dynamic>>((p) => p.serialize()).toList(),
      'modelImports': modelImports,
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
  final String? module;

  const BlueprintProperty({
    required this.name,
    required this.type,
    this.maxLength,
    required this.allowBlank,
    required this.allowNull,
    this.defaultValue,
    this.module,
  });

  factory BlueprintProperty.fromYaml(YamlMap data) {
    String? type = data['type'];

    // validate type
    if (type == null) {
      throw Exception(red("type required"));
    }

    String? module;

    if (type.contains('/')) {
      final parts = type.split('/');
      module = parts.first;
      type = type.split('/').last;
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

  List<Map<String, dynamic>> get _annotations {
    final List<Map<String, dynamic>> values = [];
    if (snakeCase(name) != camelCase(name)) {
      values.add({'name': snakeCase(name)});
    }

    if (defaultValue != null) {
      values.add({"defaultValue": defaultValue});
    }

    return values;
  }

  String _annotationValueToString(Map<String, dynamic> kv) {
    final v = kv[kv.keys.first];
    if (v.runtimeType == String) {
      return '${kv.keys.first}: "$v"';
    }
    return '${kv.keys.first}: $v';
  }

  String get _annotation {
    final values = _annotations;

    if (_annotations.isNotEmpty) {
      return '@JsonKey(${values.map((item) => _annotationValueToString(item)).toList().join(", ")}) ';
    }

    return '';
  }

  String get _variableType {
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
        "$_annotation${allowNull == true && defaultValue == null ? '' : 'required '}$_variableType${allowNull ? '?' : ''} ${camelCase(name)},";
    return value;
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
    };
  }
}
