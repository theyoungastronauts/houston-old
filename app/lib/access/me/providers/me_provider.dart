import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../content/post/models/post.dart';
import '../../../content/post/providers/post_list_provider.dart';
import '../../../content/post/services/post_service.dart';
import '../../../core/providers/session_provider.dart';
import '../../../core/utils/toast.dart';
import '../../user/models/user.dart';
import '../../user/providers/user_list_provider.dart';
import '../../user/services/user_service.dart';

class MeProvider extends StateNotifier<bool> {
  final Ref ref;

  MeProvider(this.ref) : super(true);

  Future<bool> follow(User user, {bool willFollow = true}) async {
    final me = ref.read(sessionProvider).user;
    if (me == null) {
      return false;
    }

    final success = await UserService().follow(user, willFollow: willFollow);
    if (success) {
      ref.read(userListProvider(UserListType.following).notifier).refresh();
      return true;
    }
    return false;
  }

  Future<bool> likePost(Post post, [bool willLike = true]) async {
    final me = ref.read(sessionProvider).user;

    if (me == null) {
      return false;
    }

    final likes = [...me.likes];

    final updatedUser = willLike ? me.copyWith(likes: [...likes, post.id]) : me.copyWith(likes: [...likes]..removeWhere((id) => id == post.id));
    ref.read(sessionProvider.notifier).setMe(updatedUser);
    final success = await PostService().like(post, willLike: willLike);

    if (!success) {
      ref.read(sessionProvider.notifier).setMe(me.copyWith(likes: likes));
      Toast.error();
      return false;
    }

    ref.read(postListProvider(PostListType.likes).notifier).refresh();
    return true;
  }
}

final meProvider = StateNotifierProvider<MeProvider, bool>(
  (ref) => MeProvider(ref),
);
