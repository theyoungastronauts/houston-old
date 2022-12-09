import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../access/me/providers/me_provider.dart';
import '../../../core/components/base_component.dart';
import '../../../core/providers/session_provider.dart';
import '../../../navigation/app_router.gr.dart';
import '../../comment/providers/comment_form_provider.dart';
import '../models/post.dart';
import '../providers/post_form_provider.dart';

class PostListContextMenu extends BaseComponent {
  final Post post;
  final Function? onDelete;
  const PostListContextMenu({
    Key? key,
    required this.post,
    this.onDelete,
  }) : super(key: key);

  void _edit(BuildContext context, WidgetRef ref) {
    ref.read(postFormProvider.notifier).load(post);
    AutoRouter.of(context).push(const PostEditScreenRoute());
  }

  void _view(BuildContext context) {
    AutoRouter.of(context).push(PostDetailScreenRoute(uuid: post.uuid));
  }

  void _comment(BuildContext context, WidgetRef ref) {
    ref.read(commentFormProvider(post.uuid).notifier).setFocus();
    AutoRouter.of(context).push(PostCommentsScreenRoute(postUuid: post.uuid));
  }

  void _share(BuildContext context, WidgetRef ref) {
    ref.read(postFormProvider.notifier).share(post);
  }

  void _like(BuildContext context, WidgetRef ref, bool willLike) {
    ref.read(meProvider.notifier).likePost(post, willLike);
  }

  void _delete(WidgetRef ref, BuildContext context) async {
    ref.read(postFormProvider.notifier).delete(post);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isLiked = ref.watch(sessionProvider).postIsLiked(post);

    return PopupMenuButton(
      padding: EdgeInsets.zero,
      icon: const Icon(Icons.more_vert),
      itemBuilder: (context) {
        return [
          PopupMenuItem(
            onTap: () {
              _view(context);
            },
            child: const Text('View'),
          ),
          PopupMenuItem(
            onTap: () {
              _comment(context, ref);
            },
            child: const Text('Comment'),
          ),
          PopupMenuItem(
            child: const Text('Share'),
            onTap: () async {
              _share(context, ref);
            },
          ),
          isLiked
              ? PopupMenuItem(
                  child: const Text('Unlike'),
                  onTap: () async {
                    _like(context, ref, false);
                  },
                )
              : PopupMenuItem(
                  child: const Text('Like'),
                  onTap: () async {
                    _like(context, ref, true);
                  },
                ),
          if (post.isOwner(ref))
            PopupMenuItem(
              onTap: () {
                _edit(context, ref);
              },
              child: const Text('Edit'),
            ),
          if (post.isOwner(ref))
            PopupMenuItem(
              textStyle: TextStyle(color: Theme.of(context).colorScheme.error),
              child: const Text('Delete'),
              onTap: () {
                _delete(ref, context);
              },
            ),
        ];
      },
    );
  }
}
