import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/{{#snakeCase}}{{name}}{{/snakeCase}}.dart';
import '../services/{{#snakeCase}}{{name}}{{/snakeCase}}_service.dart';

final {{#camelCase}}{{name}}{{/camelCase}}DetailProvider =
    FutureProvider.family<{{#pascalCase}}{{name}}{{/pascalCase}}, String>((ref, String uuid) async {
  return {{#pascalCase}}{{name}}{{/pascalCase}}Service().retrieve(uuid);
});
