import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/components/base_component.dart';
import '../../../core/components/buttons.dart';
import '../../../core/theme/theme.dart';
import '../../../core/utils/toast.dart';
import '../providers/post_form_provider.dart';

class PostFormActions extends BaseComponent {
  const PostFormActions({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final provider = ref.read(postFormProvider.notifier);
    final post = ref.watch(postFormProvider);

    return Container(
      constraints: const BoxConstraints(minHeight: 30, maxHeight: 100),
      color: Colors.black38,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            AppButton(
              label: "Discard",
              type: AppButtonType.Text,
              onPressed: () async {
                final confirmed = await provider.discard();
                if (confirmed) {
                  Navigator.of(context).pop();
                }
              },
            ),
            Row(
              children: [
                if (post.exists)
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: AppButton(
                      label: 'Delete',
                      variant: AppColorVariant.danger,
                      onPressed: () {
                        provider.delete(post, onDelete: () {
                          AutoRouter.of(context).popUntilRoot();
                        });
                      },
                    ),
                  ),
                if (!post.exists || !post.isPublished)
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 4),
                    child: AppButton(
                      label: "Save Draft",
                      variant: AppColorVariant.light,
                      onPressed: () async {
                        final success = await provider.submit(shouldPublish: false);

                        if (success == true) {
                          Navigator.of(context).pop();
                          Toast.message("Saved as draft!");
                        } else {
                          Toast.error();
                        }
                      },
                    ),
                  ),
                if (post.isPublished)
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 4),
                    child: AppButton(
                      label: 'Unpublish',
                      variant: AppColorVariant.secondary,
                      onPressed: () async {
                        final success = await provider.submit(shouldPublish: false);

                        if (success == true) {
                          Toast.message("Post Unpublished");
                          Navigator.of(context).pop();
                        }
                      },
                    ),
                  ),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4),
                  child: AppButton(
                    label: post.isPublished ? "Save Changes" : 'Publish',
                    variant: AppColorVariant.primary,
                    onPressed: () async {
                      final message = post.isPublished ? "Post Updated" : "Post Published";
                      final success = await provider.submit(shouldPublish: true);

                      if (success == true) {
                        Toast.message(message);
                        Navigator.of(context).pop();
                      }
                    },
                  ),
                ),

                // Padding(
                //   padding: const EdgeInsets.symmetric(horizontal: 4),
                //   child: AppButton(
                //     label: post.canUnpublish ? 'Unpublish' : 'Publish',
                //     variant: post.canUnpublish ? AppColorVariant.light : AppColorVariant.primary,
                //     onPressed: () async {
                //       final success = await provider.submit(shouldPublish: !post.canUnpublish);

                //       if (success == true) {
                //         Toast.message(post.canUnpublish ? "Post Unpublished" : "Post Published!");
                //         Navigator.of(context).pop();
                //       }
                //     },
                //   ),
                // ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
