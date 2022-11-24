import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:houston_app/content/post/components/post_form_actions.dart';
import 'package:houston_app/core/components/buttons.dart';
import 'package:houston_app/core/screens/base_screen.dart';
import 'package:houston_app/content/post/components/post_form.dart';
import 'package:houston_app/content/post/providers/post_form_provider.dart';
import 'package:houston_app/core/theme/theme.dart';

class PostEditScreen extends BaseScreen {
  const PostEditScreen({Key? key})
      : super(
          key: key,
          verticalPadding: 0,
          horizontalPadding: 0,
        );

  @override
  AppBar? appBar(BuildContext context, WidgetRef ref) {
    final provider = ref.read(postFormProvider.notifier);
    final post = ref.watch(postFormProvider);
    return AppBar(
      title: Text(
        post.exists
            ? "Editing ${post.title}"
            : post.title.isEmpty
                ? "New Post"
                : post.title,
      ),
      actions: [
        post.exists
            ? Padding(
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
              )
            : const SizedBox.shrink()
      ],
    );
  }

  @override
  Widget? bottomNavigationBar(BuildContext context, WidgetRef ref) {
    return const PostFormActions();
  }

  @override
  Widget body(BuildContext context, WidgetRef ref) {
    return const PostForm();
  }
}
