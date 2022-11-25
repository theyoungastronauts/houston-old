import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/theme/theme.dart';
import '../providers/post_form_provider.dart';
import '../../../core/components/base_component.dart';
import '../../../core/components/buttons.dart';
import '../../../core/utils/toast.dart';

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
              onPressed: () {
                provider.discard().then((pop) {
                  if (pop) {
                    AutoRouter.of(context).pop();
                  }
                });
              },
            ),
            Row(
              children: [
                !post.exists
                    ? Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 4),
                        child: AppButton(
                          label: "Save as draft",
                          variant: AppColorVariant.light,
                          onPressed: () async {
                            final success = await provider.submit(isDraft: true);

                            if (success == null) {
                              return;
                            }

                            if (success) {
                              AutoRouter.of(context).pop();
                              Toast.message("Saved as draft!");
                            } else {
                              Toast.error();
                            }
                          },
                        ),
                      )
                    : Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 4),
                        child: AppButton(
                          label: post.isPublished ? 'Unpublish' : 'Publish',
                          variant: AppColorVariant.light,
                          onPressed: () async {
                            final success = await provider.submit(isDraft: post.isPublished);

                            if (success == null) {
                              return;
                            }

                            if (success) {
                              AutoRouter.of(context).pop();
                              post.isPublished ? Toast.message("Post Unpublished!") : Toast.message("Post Published!");
                            } else {
                              Toast.error();
                            }
                          },
                        ),
                      ),
                AppButton(
                  label: post.exists ? "Save" : "Publish",
                  onPressed: () async {
                    final success = await provider.submit();

                    if (success == null) {
                      return;
                    }

                    if (success) {
                      AutoRouter.of(context).pop();
                      Toast.message("Published!");
                    } else {
                      Toast.error();
                    }
                  },
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
