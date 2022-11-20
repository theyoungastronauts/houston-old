import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:houston_app/core/screens/base_screen.dart';
import 'package:houston_app/feature/post/components/post_form.dart';
import 'package:houston_app/feature/post/providers/post_form_provider.dart';

class PostEditScreen extends BaseScreen {
  const PostEditScreen({Key? key})
      : super(
          key: key,
          verticalPadding: 0,
          horizontalPadding: 0,
        );

  @override
  AppBar? appBar(BuildContext context, WidgetRef ref) {
    final post = ref.watch(postFormProvider);
    return AppBar(
      title: Text(
        post.exists
            ? "Editing ${post.title}"
            : post.title.isEmpty
                ? "New Post"
                : post.title,
      ),
    );
  }

  @override
  Widget body(BuildContext context, WidgetRef ref) {
    return const PostForm();
  }
}
