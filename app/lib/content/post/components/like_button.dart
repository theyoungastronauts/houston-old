import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../access/me/providers/me_provider.dart';
import '../../../core/components/base_component.dart';
import '../../../core/providers/session_provider.dart';
import '../models/post.dart';

class LikePostButton extends BaseComponent {
  final Post post;

  const LikePostButton({
    Key? key,
    required this.post,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isLiked = ref.watch(sessionProvider).postIsLiked(post);

    return IconButton(
      onPressed: () {
        ref.read(meProvider.notifier).likePost(post, !isLiked);
      },
      icon: Icon(isLiked ? Icons.favorite : Icons.favorite_outline),
    );
  }
}
