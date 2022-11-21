import 'package:houston_app/core/services/base_service.dart';
import 'package:houston_app/core/models/paginated_response.dart';
import 'package:houston_app/core/utils/logging.dart';
import 'package:houston_app/core/utils/singletons.dart';
import 'package:houston_app/content/post/models/post.dart';

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

  Future<PaginatedResponse<Post>> _list({
    int page = 1,
    int limit = 10,
    String url = baseUrl,
    Map<String, dynamic> params = const {},
  }) async {
    try {
      final _params = {
        ...buildPage(page),
        ...buildLimit(limit),
        ...params,
      };

      final response = await getHttp(url, params: _params);

      List<Post> results = response['results'].map<Post>((item) => Post.fromJson(item)).toList();

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

  Future<PaginatedResponse<Post>> list({
    int page = 1,
    int limit = 10,
  }) async {
    return await _list(page: page, limit: limit);
  }

  Future<Post?> save(Post post) async {
    return post.exists ? _update(post) : _create(post);
  }

  Future<Post?> _create(Post post) async {
    final p = await postHttp(baseUrl, params: post.toJson());
    return Post.fromJson(p);
  }

  Future<Post?> _update(Post post) async {
    final p = await patchHttp("$baseUrl/${post.uuid}", params: post.toJson());
    return Post.fromJson(p);
  }
}
