import '../../../core/models/paginated_response.dart';
import '../../../core/services/base_service.dart';
import '../../../core/utils/logging.dart';
import '../../../core/utils/singletons.dart';
import '../models/comment.dart';
import '../models/new_comment.dart';

class CommentService extends BaseService {
  Future<PaginatedResponse<Comment>> _list(
    String postUuid, {
    int page = 1,
    int limit = 10,
    Map<String, dynamic> params = const {},
  }) async {
    final url = "/post/$postUuid/comment/";
    try {
      final builtParams = {
        ...buildPage(page),
        ...buildLimit(limit),
        ...params,
      };

      final response = await getHttp(url, params: builtParams);

      List<Comment> results = response['results'].map<Comment>((item) => Comment.fromJson(item)).toList();

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

  Future<PaginatedResponse<Comment>> list(
    String postUuid, {
    int page = 1,
    int limit = 10,
  }) async {
    return await _list(postUuid, page: page, limit: limit);
  }

  Future<Comment?> create(NewComment comment) async {
    final Map<String, dynamic> params = {
      'body': comment.body,
      ...comment.parent != null ? {'parent': comment.parent!.uuid} : {}
    };

    try {
      final data = await postHttp("/post/${comment.postUuid}/comment/", params: params);
      return Comment.fromJson(data);
    } catch (e, st) {
      singleton<Log>().error("Comment Create Error", e, st);
      return null;
    }
  }

  Future<bool> delete(Comment comment) async {
    try {
      await deleteHttp("/comment/${comment.uuid}");
      return true;
    } catch (e, st) {
      singleton<Log>().error("Comment Delete Error", e, st);
      return false;
    }
  }
}
