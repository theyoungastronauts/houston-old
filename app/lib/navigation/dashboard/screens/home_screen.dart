import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../content/post/components/post_list.dart';
import '../../../content/post/providers/post_list_provider.dart';
import '../../../core/components/list_mode_toggle.dart';
import '../../../core/screens/base_screen.dart';

class HomeScreen extends BaseScreen {
  const HomeScreen({Key? key}) : super(key: key);
  @override
  AppBar? appBar(BuildContext context, WidgetRef ref) {
    return AppBar(
      title: const Text("Liked Posts"),
      centerTitle: true,
      actions: const [
        ListModeToggle(providerFamily: "post"),
      ],
    );
  }

  @override
  Widget body(BuildContext context, WidgetRef ref) {
    return const Center(
      child: PostList(type: PostListType.likes),
    );
  }
}
