from api import filters
from {{#snakeCase}}{{module}}{{/snakeCase}}.models import {{#pascalCase}}{{name}}{{/pascalCase}}

class {{#pascalCase}}{{name}}{{/pascalCase}}Filter(filters.FilterSet):

    class Meta:
        model = {{#pascalCase}}{{name}}{{/pascalCase}}
        fields = []
