import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/screens/base_screen.dart';
import '../components/user_list.dart';
import '../providers/user_list_provider.dart';

class UserListScreen extends BaseScreen {
  const UserListScreen(this.type, {Key? key})
      : super(
          key: key,
        );
  final UserListType type;

  @override
  AppBar? appBar(BuildContext context, WidgetRef ref) {
    return AppBar(
      title: Text(type == UserListType.followers ? 'Followers' : 'Following'),
      actions: const [],
    );
  }

  @override
  Widget body(BuildContext context, WidgetRef ref) {
    return UserList(type);
  }
}
