import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../access/me/services/me_service.dart';
import '../../../core/providers/global_loading_provider.dart';
import '../models/post.dart';
import '../services/post_service.dart';
import 'post_list_provider.dart';

class LikesModel {
  final List<int> postLikes;

  const LikesModel({
    this.postLikes = const [],
  });

  LikesModel copyWith({
    List<int>? postLikes,
  }) {
    return LikesModel(
      postLikes: postLikes ?? this.postLikes,
    );
  }
}

class LikesProvider extends StateNotifier<LikesModel> {
  final Ref ref;
  Future<void> load() async {
    state = state.copyWith(postLikes: (await MeService().retrieve()).likes);
  }

  LikesProvider(this.ref, [LikesModel model = const LikesModel()]) : super(model) {
    load();
  }

  Future<void> likePost(Post post, [bool willLike = true]) async {
    if (willLike) {
      state = state.copyWith(postLikes: [...state.postLikes, post.id]);
    } else {
      state = state.copyWith(postLikes: [...state.postLikes]..removeWhere((id) => id == post.id));
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

final likesProvider = StateNotifierProvider<LikesProvider, LikesModel>(
  (ref) => LikesProvider(ref),
);
