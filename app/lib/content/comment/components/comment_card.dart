import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../access/user/components/avatar.dart';
import '../../../core/components/base_component.dart';
import '../../../core/utils/toast.dart';
import '../../post/models/post.dart';
import '../models/comment.dart';
import '../providers/comment_form_provider.dart';

class CommentCard extends BaseComponent {
  final Comment comment;
  final Post post;
  final Comment? parent;

  const CommentCard(
    this.comment, {
    Key? key,
    required this.post,
    this.parent,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Avatar(comment.owner),
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      comment.owner.name,
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                    Text(comment.body, style: Theme.of(context).textTheme.bodyMedium),
                    RichText(
                      text: TextSpan(
                        style: Theme.of(context).textTheme.caption,
                        children: [
                          TextSpan(text: comment.createdAtLabel),
                          const TextSpan(text: " | "),
                          TextSpan(
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                final provider = ref.read(commentFormProvider(post.uuid).notifier);

                                if (parent != null) {
                                  provider.setParent(parent, comment.owner.name);
                                } else {
                                  provider.setParent(comment);
                                }
                                provider.focusNode.requestFocus();
                              },
                            text: "Reply",
                            style: const TextStyle(
                              decoration: TextDecoration.underline,
                            ),
                          ),
                          if (comment.canDelete(ref, post: post)) ...[
                            const TextSpan(text: " | "),
                            TextSpan(
                              recognizer: TapGestureRecognizer()
                                ..onTap = () async {
                                  final provider = ref.read(commentFormProvider(post.uuid).notifier);

                                  final success = await provider.delete(comment);

                                  if (success) {
                                    Toast.message("Comment deleted");
                                  } else {
                                    Toast.error();
                                  }
                                },
                              text: "Delete",
                              style: const TextStyle(
                                decoration: TextDecoration.underline,
                              ),
                            ),
                          ],
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        if (comment.children != null)
          ...comment.children!
              .map((c) => Row(
                    children: [
                      const Icon(
                        Icons.chevron_right,
                        color: Colors.white38,
                      ),
                      Expanded(
                        child: CommentCard(
                          c,
                          post: post,
                          parent: comment,
                        ),
                      ),
                    ],
                  ))
              .toList()
      ],
    );
  }
}
