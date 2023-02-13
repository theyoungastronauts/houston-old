import '../../../core/services/base_service.dart';
import '../../../core/models/paginated_response.dart';
import '../../../core/utils/logging.dart';
import '../../../core/utils/singletons.dart';
import '../models/{{#snakeCase}}{{name}}{{/snakeCase}}.dart';

class {{#pascalCase}}{{name}}{{/pascalCase}}Service extends BaseService {
  static const baseUrl = "/{{#paramCase}}{{name}}{{/paramCase}}";

  Future<{{#pascalCase}}{{name}}{{/pascalCase}}> retrieve(String uuid) async {
    try {
      final response = await getHttp('$baseUrl/$uuid');
      return {{#pascalCase}}{{name}}{{/pascalCase}}.fromJson(response);
    } catch (e) {
      rethrow;
    }
  }

  Future<PaginatedResponse<{{#pascalCase}}{{name}}{{/pascalCase}}>> _list({int page = 1, int limit = 10, String url = baseUrl, Map<String, dynamic> params = const {},}) async {
    try {
      final builtParams = {
        ...buildPage(page),
        ...buildLimit(limit),
        ...params,
      };

      final response = await getHttp(url, params: builtParams);

      List<{{#pascalCase}}{{name}}{{/pascalCase}}> results =
          response['results'].map<{{#pascalCase}}{{name}}{{/pascalCase}}>((item) => {{#pascalCase}}{{name}}{{/pascalCase}}.fromJson(item)).toList();

      return PaginatedResponse(
        count: response['count'],
        page: response['page'],
        num_pages: response['num_pages'],
        results: results,
      );
    } catch (e, stackTrace) {
      singleton<Log>().error("Problem fetching $url", e, stackTrace);
      return PaginatedResponse.empty();
    }
  }

  Future<PaginatedResponse<{{#pascalCase}}{{name}}{{/pascalCase}}>> list({int page = 1, int limit = 10,}) async {
    return await _list(page: page, limit: limit);
  }

  Future<{{#pascalCase}}{{name}}{{/pascalCase}}?> save({{#pascalCase}}{{name}}{{/pascalCase}} {{#camelCase}}{{name}}{{/camelCase}}) async {
    return {{#camelCase}}{{name}}{{/camelCase}}.exists ? _update({{#camelCase}}{{name}}{{/camelCase}}) : _create({{#camelCase}}{{name}}{{/camelCase}});
  }

  Future<{{#pascalCase}}{{name}}{{/pascalCase}}?> _create({{#pascalCase}}{{name}}{{/pascalCase}} {{#camelCase}}{{name}}{{/camelCase}}) async {
    final p = await postHttp(baseUrl, params: {{#camelCase}}{{name}}{{/camelCase}}.toJson());
    return {{#pascalCase}}{{name}}{{/pascalCase}}.fromJson(p);
  }

  Future<{{#pascalCase}}{{name}}{{/pascalCase}}?> _update({{#pascalCase}}{{name}}{{/pascalCase}} {{#camelCase}}{{name}}{{/camelCase}}) async {
    final p = await patchHttp("$baseUrl/${{#camelCase}}{{name}}{{/camelCase}}.uuid}", params: {{#camelCase}}{{name}}{{/camelCase}}.toJson());
    return {{#pascalCase}}{{name}}{{/pascalCase}}.fromJson(p);
  }

  Future<bool> delete({{#pascalCase}}{{name}}{{/pascalCase}} {{#camelCase}}{{name}}{{/camelCase}}) async {
    try {
      await deleteHttp("$baseUrl/${{#camelCase}}{{name}}{{/camelCase}}.uuid}");
      return true;
    } catch (e) {
      return false;
    }
  }

}
