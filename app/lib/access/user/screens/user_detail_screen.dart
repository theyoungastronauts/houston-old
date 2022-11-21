import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:houston_app/core/components/empty_placeholder.dart';
import 'package:houston_app/core/screens/base_screen.dart';
import 'package:houston_app/access/user/providers/user_detail_provider.dart';

class UserDetailScreen extends BaseScreen {
  final String uuid;
  const UserDetailScreen({
    Key? key,
    @PathParam('uuid') required this.uuid,
  }) : super(key: key);

  @override
  AppBar? appBar(BuildContext context, WidgetRef ref) {
    final user = ref.watch(userDetailProvider(uuid));

    return user.when(
      loading: () => AppBar(
        title: const Text("User"),
      ),
      data: (user) => AppBar(
        title: Text(user.uuid),
      ),
      error: (_, __) => AppBar(
        title: const Text("Error"),
      ),
    );
  }

  @override
  Widget body(BuildContext context, WidgetRef ref) {
    final _user = ref.watch(userDetailProvider(uuid));

    return _user.when(
      data: (user) => Text(user.uuid),
      error: (_, __) => const EmptyPlaceholder(title: "Error"),
      loading: () => const Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
