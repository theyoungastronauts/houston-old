import 'package:houston_app/core/services/base_service.dart';
import 'package:houston_app/access/me/models/me_user.dart';
import 'package:houston_app/content/post/models/post.dart';
import 'package:houston_app/access/user/models/user.dart';

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
    return await _action('$basePath/${user.id}/follow');
  }

  Future<bool> unfollowUser(User user) async {
    return await _action('$basePath/${user.id}/unfollow');
  }

  Future<bool> bookmark(Post post) async {
    return await _action('/post/${post.id}/bookmark');
  }

  Future<bool> unbookmark(Post post) async {
    return await _action('/post/${post.id}/unbookmark');
  }

  Future<bool> like(Post post) async {
    return await _action('/post/${post.id}/like');
  }

  Future<bool> unlike(Post post) async {
    return await _action('/post/${post.id}/unlike');
  }
}
