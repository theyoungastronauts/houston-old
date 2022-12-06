import 'dart:core';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../access/me/services/me_service.dart';
import '../../../core/providers/global_loading_provider.dart';
import '../models/post.dart';
import '../services/post_service.dart';
import 'post_list_provider.dart';

class LikesProvider extends StateNotifier<List<int>> {
  final Ref ref;
  Future<void> load() async {
    state = (await MeService().retrieve()).likes;
  }

  LikesProvider(this.ref, [List<int> initialItems = const []]) : super(initialItems) {
    load();
  }

  Future<void> likePost(Post post, [bool willLike = true]) async {
    if (willLike) {
      state = [...state, post.id];
    } else {
      state = [...state]..removeWhere((id) => id == post.id);
    }
    ref.read(globalLoadingProvider.notifier).start();

    if (willLike) {
      PostService().like(post, willLike: true).then((_) {
        ref.read(postListProvider(PostListType.likes).notifier).refresh();
      });
    } else {
      PostService().like(post, willLike: false).then((_) {
        ref.read(postListProvider(PostListType.likes).notifier).refresh();
      });
    }
    ref.read(globalLoadingProvider.notifier).complete();
  }
}

final likesProvider = StateNotifierProvider<LikesProvider, List<int>>(
  (ref) => LikesProvider(ref),
);
