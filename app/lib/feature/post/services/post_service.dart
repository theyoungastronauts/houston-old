import 'package:houston_app/core/services/base_service.dart';
import 'package:houston_app/core/models/paginated_response.dart';
import 'package:houston_app/feature/post/models/post.dart';

class PostService extends BaseService {
  static const baseUrl = "/post";

  Future<Post> retrieve(String uuid) async {
    try {
      final response = await getHttp('$baseUrl/$uuid');
      return Post.fromJson(response);
    } catch (e) {
      rethrow;
    }
  }

  Future<PaginatedResponse<Post>> _list({int page = 1, int limit = 10, String url = baseUrl, Map<String, dynamic> params = const {},}) async {
    try {
      final _params = {
        ...buildPage(page),
        ...buildLimit(limit),
        ...params,
      };

      final response = await getHttp(url, params: _params);

      List<Post> results =
          response['results'].map<Post>((item) => Post.fromJson(item)).toList();

      return PaginatedResponse(
        count: response['count'],
        page: response['page'],
        num_pages: response['num_pages'],
        results: results,
      );
    } catch (e) {
      return PaginatedResponse.empty();
    }
  }

  Future<PaginatedResponse<Post>> list({int page = 1, int limit = 10,}) async {
    return await _list(page: page, limit: limit);
  }

}
