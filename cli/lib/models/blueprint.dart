import 'package:cli/constants.dart';
import 'package:cli/models/blueprint_property.dart';
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
