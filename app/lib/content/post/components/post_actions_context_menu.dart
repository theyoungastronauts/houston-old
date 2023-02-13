import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/components/base_component.dart';
import '../../../core/utils/toast.dart';
import '../models/post.dart';
import '../providers/post_form_provider.dart';

class PostActionsContextMenu extends BaseComponent {
  final Post post;
  const PostActionsContextMenu({
    Key? key,
    required this.post,
  }) : super(key: key);

  Future<void> _saveDraft(BuildContext context, WidgetRef ref) async {
    final success = await ref.read(postFormProvider.notifier).submit(shouldPublish: false);
    if (success == true) {
      Navigator.of(context).pop();
      Toast.message("Saved as draft!");
    } else {
      Toast.error();
    }
  }

  void _delete(WidgetRef ref, BuildContext context) async {
    ref.read(postFormProvider.notifier).delete(post, onDelete: () {
      AutoRouter.of(context).popUntilRoot();
    });
  }

  void _unpublish(WidgetRef ref, BuildContext context) async {
    final success = await ref.read(postFormProvider.notifier).submit(shouldPublish: false);
    if (success == true) {
      Toast.message("Post Unpublished");
      Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return PopupMenuButton(
      padding: EdgeInsets.zero,
      icon: const Icon(Icons.more_horiz),
      itemBuilder: (context) {
        return [
          if (!post.exists || !post.isPublished)
            PopupMenuItem(
              child: const Text('Save Draft'),
              onTap: () async {
                _saveDraft(context, ref);
              },
            ),
          if (post.isPublished)
            PopupMenuItem(
              // textStyle: TextStyle(color: Theme.of(context).colorScheme.),
              child: const Text('Unpublish'),
              onTap: () {
                _unpublish(ref, context);
              },
            ),
          if (post.exists)
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
