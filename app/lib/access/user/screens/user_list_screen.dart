import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:houston_app/core/screens/base_screen.dart';
import 'package:houston_app/access/user/components/user_list.dart';

class UserListScreen extends BaseScreen {
  const UserListScreen({Key? key})
      : super(
          key: key,
          includeMainDrawer: true,
        );

  @override
  AppBar? appBar(BuildContext context, WidgetRef ref) {
    return AppBar(
      title: const Text("User List"),
      actions: const [],
    );
  }

  @override
  Widget body(BuildContext context, WidgetRef ref) {
    return const UserList();
  }
}
