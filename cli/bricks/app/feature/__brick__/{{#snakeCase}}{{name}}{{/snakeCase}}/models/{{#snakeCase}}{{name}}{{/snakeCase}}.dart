import 'package:freezed_annotation/freezed_annotation.dart';
{{#appModelImports}}{{{.}}}
{{/appModelImports}}
part '{{#snakeCase}}{{name}}{{/snakeCase}}.freezed.dart';
part '{{#snakeCase}}{{name}}{{/snakeCase}}.g.dart';

@freezed
class {{#pascalCase}}{{name}}{{/pascalCase}} with _${{#pascalCase}}{{name}}{{/pascalCase}} {
  const {{#pascalCase}}{{name}}{{/pascalCase}}._();

  factory {{#pascalCase}}{{name}}{{/pascalCase}}({
    required int id,
    required String uuid,
    {{#properties}}{{{appModelEntry}}}
    {{/properties}}
  }) = _{{#pascalCase}}{{name}}{{/pascalCase}};

  factory {{#pascalCase}}{{name}}{{/pascalCase}}.fromJson(Map<String, dynamic> json) => _${{#pascalCase}}{{name}}{{/pascalCase}}FromJson(json);
  
}

