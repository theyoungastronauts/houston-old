import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/components/buttons.dart';
import '../../../core/components/list_mode_toggle.dart';
import '../../../core/providers/session_provider.dart';
import '../../../core/screens/base_screen.dart';
import '../../../navigation/app_router.gr.dart';
import '../components/post_list.dart';
import '../providers/post_list_provider.dart';
import '../utils.dart';

class PostListScreen extends BaseScreen {
  const PostListScreen({Key? key}) : super(key: key);

  @override
  AppBar? appBar(BuildContext context, WidgetRef ref) {
    return AppBar(
      title: const Text("Posts"),
      centerTitle: true,
      actions: [
        if (ref.watch(sessionProvider).isAuthenticated)
          AppButton(
            label: "My Posts",
            type: AppButtonType.Text,
            onPressed: () {
              AutoRouter.of(context).push(const MePostListScreenRoute());
            },
          ),
        const ListModeToggle(providerFamily: "post"),
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
      type: PostListType.all,
    );
  }
}
