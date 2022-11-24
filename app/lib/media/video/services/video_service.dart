import '../../../core/services/base_service.dart';
import '../../../core/models/paginated_response.dart';
import '../models/video.dart';
import '../../../core/utils/logging.dart';
import '../../../core/utils/singletons.dart';

class VideoService extends BaseService {
  static const baseUrl = "/video";

  Future<Video> retrieve(String uuid) async {
    try {
      final response = await getHttp('$baseUrl/$uuid');
      return Video.fromJson(response);
    } catch (e) {
      rethrow;
    }
  }

  Future<PaginatedResponse<Video>> _list({
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

      List<Video> results = response['results'].map<Video>((item) => Video.fromJson(item)).toList();

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

  Future<PaginatedResponse<Video>> list({
    int page = 1,
    int limit = 10,
  }) async {
    return await _list(page: page, limit: limit);
  }
}
