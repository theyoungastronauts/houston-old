import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:{{project}}/{{#snakeCase}}{{module}}{{/snakeCase}}/{{#snakeCase}}{{name}}{{/snakeCase}}/models/{{#snakeCase}}{{name}}{{/snakeCase}}.dart';
import 'package:{{project}}/{{#snakeCase}}{{module}}{{/snakeCase}}/{{#snakeCase}}{{name}}{{/snakeCase}}/services/{{#snakeCase}}{{name}}{{/snakeCase}}_service.dart';

final {{#camelCase}}{{name}}{{/camelCase}}DetailProvider =
    FutureProvider.family<{{#pascalCase}}{{name}}{{/pascalCase}}, String>((ref, String uuid) async {
  return {{#pascalCase}}{{name}}{{/pascalCase}}Service().retrieve(uuid);
});
