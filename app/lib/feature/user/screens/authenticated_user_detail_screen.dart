import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:houston_app/core/components/empty_placeholder.dart';
import 'package:houston_app/core/screens/base_screen.dart';
import 'package:houston_app/feature/user/components/authenticated_user_profile.dart';
import 'package:houston_app/feature/user/providers/authenticated_user_detail_provider.dart';

class AuthenticatedUserDetailScreen extends BaseScreen {
  const AuthenticatedUserDetailScreen({
    Key? key,
  }) : super(key: key);

  @override
  AppBar? appBar(BuildContext context, WidgetRef ref) {
    final data = ref.watch(meProvider);
    return data.when(
      loading: () => AppBar(
        title: const Text("User"),
      ),
      data: (user) => AppBar(
        title: const Text("My Profile"),
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.settings,
              ))
        ],
      ),
      error: (_, __) => AppBar(
        title: const Text("Error"),
      ),
    );
  }

  @override
  Widget body(BuildContext context, WidgetRef ref) {
    final data = ref.watch(meProvider);

    return data.when(
      data: (user) => user != null ? AuthenticatedUserProfile(user) : const EmptyPlaceholder(title: "You are not logged in."),
      error: (_, __) => const EmptyPlaceholder(title: "Error"),
      loading: () => const Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
