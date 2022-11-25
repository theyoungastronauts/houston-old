import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/components/badges.dart';
import '../../../core/screens/base_screen.dart';
import '../../../core/theme/theme.dart';
import '../components/post_form.dart';
import '../components/post_form_actions.dart';
import '../providers/post_form_provider.dart';

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
      leading: BackButton(
        onPressed: () async {
          final confirmed = await provider.discard();
          if (confirmed) {
            Navigator.of(context).pop();
          }
        },
      ),
      title: Text(
        post.exists
            ? "Editing ${post.title}"
            : post.title.isEmpty
                ? "New Post"
                : post.title,
      ),
      actions: [
        if (post.isDraft)
          const Padding(
            padding: EdgeInsets.only(right: 8.0),
            child: Center(
                child: AppBadge(
              label: "Draft",
              variant: AppColorVariant.info,
            )),
          )
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
