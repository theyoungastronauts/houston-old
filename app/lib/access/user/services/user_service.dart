import '../../../core/models/paginated_response.dart';
import '../../../core/services/base_service.dart';
import '../models/user.dart';

class UserService extends BaseService {
  static const baseUrl = "/user";

  Future<User?> retrieve(String uuid) async {
    try {
      final response = await getHttp('$baseUrl/$uuid');
      return User.fromJson(response);
    } catch (e) {
      return null;
    }
  }

  Future<bool> follow(User user, {bool willFollow = true}) async {
    try {
      final url = '$baseUrl/${user.uuid}/${willFollow ? "follow" : "unfollow"}';
      await postHttp(url);
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<bool> unfollow(User user) async {
    try {
      await postHttp('$baseUrl/${user.uuid}/unfollow');
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<PaginatedResponse<User>> _list({
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

      List<User> results = response['results'].map<User>((item) => User.fromJson(item)).toList();

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

  Future<PaginatedResponse<User>> list({
    int page = 1,
    int limit = 10,
  }) async {
    return await _list(page: page, limit: limit);
  }
}
