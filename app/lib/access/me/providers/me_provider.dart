import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../content/post/models/post.dart';
import '../../../content/post/providers/post_detail_provider.dart';
import '../../../content/post/providers/post_list_provider.dart';
import '../../../content/post/services/post_service.dart';
import '../../../core/providers/session_provider.dart';
import '../../../core/utils/toast.dart';
import '../../user/models/user.dart';
import '../../user/providers/user_detail_provider.dart';
import '../../user/providers/user_list_provider.dart';
import '../../user/services/user_service.dart';
import '../models/me_user.dart';

class MeProvider extends StateNotifier<MeUser?> {
  final Ref ref;

  MeProvider(this.ref, MeUser? model) : super(model);

  load(MeUser? model) {
    state = model;
  }

  Future<bool> follow(User user, {bool willFollow = true}) async {
    if (state == null) {
      return false;
    }

    final me = state!;

    final following = [...me.following];

    final updatedUser = willFollow
        ? me.copyWith(following: [...following, user.id])
        : me.copyWith(
            following: [...following]..removeWhere((id) => id == user.id),
          );

    ref.read(sessionProvider.notifier).setMe(updatedUser);

    final success = await UserService().follow(user, willFollow: willFollow);

    if (!success) {
      ref.read(sessionProvider.notifier).setMe(me.copyWith(following: following));
      Toast.error();
      return false;
    }

    ref.read(userListProvider(UserListType.following).notifier).refresh();
    ref.invalidate(userDetailProvider(user.uuid));
    return true;
  }

  Future<bool> likePost(Post post, [bool willLike = true]) async {
    if (state == null) {
      return false;
    }

    final me = state!;

    final likes = [...me.likes];

    final updatedUser = willLike
        ? me.copyWith(likes: [...likes, post.id])
        : me.copyWith(
            likes: [...likes]..removeWhere((id) => id == post.id),
          );

    ref.read(sessionProvider.notifier).setMe(updatedUser);
    final success = await PostService().like(post, willLike: willLike);

    if (!success) {
      ref.read(sessionProvider.notifier).setMe(me.copyWith(likes: likes));
      Toast.error();
      return false;
    }

    ref.read(postListProvider(PostListType.likes).notifier).refresh();
    ref.invalidate(postDetailProvider(post.uuid));

    return true;
  }
}

final meProvider = StateNotifierProvider<MeProvider, MeUser?>(
  (ref) => MeProvider(ref, ref.read(sessionProvider).user),
);
