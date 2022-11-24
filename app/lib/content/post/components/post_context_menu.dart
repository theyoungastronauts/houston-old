import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:houston_app/content/post/models/post.dart';
import 'package:houston_app/content/post/services/post_service.dart';
import 'package:houston_app/navigation/app_router.gr.dart';

import '../../../core/components/base_component.dart';
import '../../../core/utils/dialogs.dart';
import '../../../core/utils/env.dart';
import '../../../core/utils/toast.dart';
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

  void _delete(WidgetRef ref, BuildContext context) async {
    final confirmed = await ConfirmDialog.show(
      title: 'Delete Post',
      body: 'Delete the post ${post.id}',
      destructive: true,
      confirmText: 'Delete',
      cancelText: 'Cancel',
    );

    if (confirmed) {
      //TODO: Implement the delete feature
      // final success = await PostService()

      // ref.read(playlistListProvider(playlist.owner.id).notifier).refresh();
      bool success = confirmed;
      if (success) {
        Toast.message('Post deleted');
        if (onDelete != null) {
          onDelete!();
        }
      } else {
        Toast.error();
      }
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return PopupMenuButton(
      padding: EdgeInsets.zero,
      icon: const Icon(Icons.more_vert),
      itemBuilder: (context) {
        return [
          PopupMenuItem(
            onTap: () {
              _view(context);
            },
            child: Text('View'),
          ),
          PopupMenuItem(
            child: Text('Share'),
            onTap: () async {
              final uuid = post.uuid;
              final url = "${Env.appBaseUrl}/#/share/p/$uuid";
              PromptModal.show(
                  title: 'Share this link',
                  labelText: 'Url',
                  initialValue: url,
                  cancelText: "",
                  confirmText: 'Close',
                  readOnly: true,
                  withCopy: true);

              // withCopy: true,
              // hasShare: true,
              // sharingType: SharingType.playlist);
              // ref.read(sharedPlaylistListProvider.notifier).refresh();
            },
          ),
          PopupMenuItem(
            onTap: () {
              _edit(context, ref);
            },
            child: const Text('Edit'),
          ),
          PopupMenuItem(
            textStyle: TextStyle(color: Theme.of(context).colorScheme.error),
            child: Text('Delete'),
            onTap: () {
              _delete(ref, context);
            },
          ),
        ];
      },
    );
  }
}
