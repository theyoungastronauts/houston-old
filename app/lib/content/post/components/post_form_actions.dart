import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:houston_app/content/post/providers/post_form_provider.dart';
import 'package:houston_app/core/components/base_component.dart';
import 'package:houston_app/core/components/buttons.dart';
import 'package:houston_app/core/utils/toast.dart';

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
                provider.clear().then((pop) {
                  if (pop) {
                    AutoRouter.of(context).pop();
                  }
                });
              },
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
            )
          ],
        ),
      ),
    );
  }
}
