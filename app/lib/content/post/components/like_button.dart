import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/components/base_component.dart';
import '../models/post.dart';
import '../providers/likes_provider.dart';

class LikePostButton extends BaseComponent {
  const LikePostButton({
    Key? key,
    required this.post,
  }) : super(key: key);

  final Post post;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final provider = ref.watch(likesProvider.notifier);
    final isLiked = ref.watch(likesProvider).postLikes.contains(post.id);
    return IconButton(
      onPressed: () {
        provider.likePost(post, !isLiked);
      },
      icon: Icon(isLiked ? Icons.favorite : Icons.favorite_outline),
    );
  }
}
