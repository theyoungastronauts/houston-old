import 'dart:core';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../access/me/services/me_service.dart';
import '../../../core/providers/global_loading_provider.dart';
import '../models/post.dart';
import '../services/post_service.dart';

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
      PostService().like(post, willLike: true);
    } else {
      PostService().like(post, willLike: false);
    }
    ref.read(globalLoadingProvider.notifier).complete();
  }

  void init() {}
}

final likesProvider = StateNotifierProvider<LikesProvider, List<int>>(
  (ref) => LikesProvider(ref),
);
