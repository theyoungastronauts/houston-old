import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:houston_app/core/screens/base_screen.dart';
import 'package:houston_app/feature/post/components/post_list.dart';

class PostListScreen extends BaseScreen {
  const PostListScreen({Key? key})
      : super(key: key);

  @override
  AppBar? appBar(BuildContext context, WidgetRef ref) {
    return AppBar(
      title: const Text("Post List"),
      actions: const [],
    );
  }

  @override
  Widget body(BuildContext context, WidgetRef ref) {
    return const PostList();
  }
}
