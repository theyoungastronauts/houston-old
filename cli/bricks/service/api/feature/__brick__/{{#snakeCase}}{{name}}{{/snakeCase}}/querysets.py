from {{#snakeCase}}{{module}}{{/snakeCase}}.models import {{#pascalCase}}{{name}}{{/pascalCase}}

ALL_{{#upperCase}}{{namePlural}}{{/upperCase}}_QUERYSET = {{#pascalCase}}{{name}}{{/pascalCase}}.objects.all()
