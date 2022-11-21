import 'package:houston_app/core/models/paginated_response.dart';
import 'package:houston_app/core/services/base_service.dart';
import 'package:houston_app/access/user/models/user.dart';

class UserService extends BaseService {
  static const baseUrl = "/user";

  Future<User> retrieve(String uuid) async {
    try {
      final response = await getHttp('$baseUrl/$uuid');
      return User.fromJson(response);
    } catch (e) {
      rethrow;
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
