import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/screens/base_screen.dart';
import '../../../core/utils/errors.dart';
import '../components/user_profile.dart';
import '../providers/user_detail_provider.dart';

class UserDetailScreen extends BaseScreen {
  final String uuid;
  const UserDetailScreen({
    Key? key,
    @PathParam('uuid') required this.uuid,
  }) : super(key: key);

  @override
  AppBar? appBar(BuildContext context, WidgetRef ref) {
    final data = ref.watch(userDetailProvider(uuid));
    return data.when(
      loading: () => AppBar(
        title: const Text("User"),
      ),
      data: (user) => AppBar(
        title: user != null ? Text(user.name) : appBarError(),
      ),
      error: (_, __) => appBarError(),
    );
  }

  @override
  Widget body(BuildContext context, WidgetRef ref) {
    final data = ref.watch(userDetailProvider(uuid));

    return data.when(
      data: (user) => user != null ? UserProfile(user) : contentError(),
      error: (_, __) => contentError(),
      loading: () => const Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
