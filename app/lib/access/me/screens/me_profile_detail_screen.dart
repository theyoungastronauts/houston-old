import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/components/empty_placeholder.dart';
import '../../../core/providers/session_provider.dart';
import '../../../core/screens/base_screen.dart';
import '../../../navigation/app_router.gr.dart';
import '../../user/components/user_profile.dart';

class MeProfileDetailScreen extends BaseScreen {
  const MeProfileDetailScreen({
    Key? key,
  }) : super(key: key);

  @override
  AppBar? appBar(BuildContext context, WidgetRef ref) {
    return AppBar(
      title: const Text("My Profile"),
      actions: [
        IconButton(
          onPressed: () {
            AutoRouter.of(context).push(const SettingsScreenRoute());
          },
          icon: const Icon(
            Icons.settings,
          ),
        )
      ],
    );
  }

  @override
  Widget body(BuildContext context, WidgetRef ref) {
    final user = ref.watch(sessionProvider).user;

    if (user == null) {
      return const EmptyPlaceholder(title: "You are not logged in.");
    }

    return UserProfile(user.asUser());
  }
}
