import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/components/list_mode_toggle.dart';
import '../../../core/screens/base_screen.dart';
import '../components/post_list.dart';
import '../providers/post_list_provider.dart';
import '../utils.dart';

class MePostListScreen extends BaseScreen {
  const MePostListScreen({Key? key}) : super(key: key);

  @override
  AppBar? appBar(BuildContext context, WidgetRef ref) {
    return AppBar(
      title: const Text("My Posts"),
      actions: const [
        ListModeToggle(providerFamily: "post"),
      ],
    );
  }

  @override
  FloatingActionButton? floatingActionButton(BuildContext context, WidgetRef ref) {
    return postCreateFloatingActionButton(context, ref);
  }

  @override
  Widget body(BuildContext context, WidgetRef ref) {
    return const PostList(
      type: PostListType.me,
    );
  }
}
