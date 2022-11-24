import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:houston_app/content/post/providers/post_list_provider.dart';
import 'package:houston_app/content/post/screens/me_post_list_screen.dart';
import 'package:houston_app/core/components/buttons.dart';
import 'package:houston_app/core/components/list_mode_toggle.dart';
import 'package:houston_app/core/providers/session_provider.dart';
import 'package:houston_app/core/screens/base_screen.dart';
import 'package:houston_app/navigation/app_router.gr.dart';
import 'package:houston_app/content/post/components/post_list.dart';

class PostListScreen extends BaseScreen {
  const PostListScreen({Key? key}) : super(key: key);

  @override
  AppBar? appBar(BuildContext context, WidgetRef ref) {
    return AppBar(
      title: const Text("Posts"),
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
    return FloatingActionButton(
      onPressed: () {
        AutoRouter.of(context).push(const PostEditScreenRoute());
      },
      child: const Icon(Icons.add),
    );
  }

  @override
  Widget body(BuildContext context, WidgetRef ref) {
    return const PostList(
      type: PostListType.all,
    );
  }
}
