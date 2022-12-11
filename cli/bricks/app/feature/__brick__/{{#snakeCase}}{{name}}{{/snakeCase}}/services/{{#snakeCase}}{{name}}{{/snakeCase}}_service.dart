import 'package:{{project}}/core/services/base_service.dart';
import 'package:{{project}}/core/models/paginated_response.dart';
import 'package:{{project}}/{{#snakeCase}}{{module}}{{/snakeCase}}/{{#snakeCase}}{{name}}{{/snakeCase}}/models/{{#snakeCase}}{{name}}{{/snakeCase}}.dart';
import 'package:{{project}}/core/utils/logging.dart';
import 'package:{{project}}/core/utils/singletons.dart';

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
      final _params = {
        ...buildPage(page),
        ...buildLimit(limit),
        ...params,
      };

      final response = await getHttp(url, params: _params);

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

}
