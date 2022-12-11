import '../../../content/post/models/post.dart';
import '../../../core/services/base_service.dart';
import '../../user/models/user.dart';
import '../models/me_user.dart';

class MeService extends BaseService {
  static const basePath = '/user';

  Future<MeUser> retrieve() async {
    try {
      final response = await getHttp('$basePath/me');
      return MeUser.fromJson(response);
    } catch (e) {
      rethrow;
    }
  }

  Future<MeUser?> update(Map<String, dynamic> params) async {
    try {
      final response = await patchHttp('$basePath/me', params: params);
      return MeUser.fromJson(response);
    } catch (e) {
      return null;
    }
  }

  Future<bool> _action(
    String path, {
    Map<String, dynamic> params = const {},
  }) async {
    try {
      await postHttp(path, params: params);
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<bool> followUser(User user) async {
    return await _action('$basePath/${user.uuid}/follow');
  }

  Future<bool> unfollowUser(User user) async {
    return await _action('$basePath/${user.uuid}/unfollow');
  }

  Future<bool> bookmark(Post post) async {
    return await _action('/post/${post.uuid}/bookmark');
  }

  Future<bool> unbookmark(Post post) async {
    return await _action('/post/${post.uuid}/unbookmark');
  }

  Future<bool> like(Post post) async {
    return await _action('/post/${post.uuid}/like');
  }

  Future<bool> unlike(Post post) async {
    return await _action('/post/${post.uuid}/unlike');
  }
}
