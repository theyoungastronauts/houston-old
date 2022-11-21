import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:houston_app/core/components/base_component.dart';
import 'package:houston_app/core/components/infinite_list.dart';
import 'package:houston_app/access/user/components/user_card.dart';
import 'package:houston_app/access/user/models/user.dart';
import 'package:houston_app/access/user/providers/user_list_provider.dart';

class UserList extends BaseComponent {
  const UserList({Key? key}) : super(key: key);

  @override
  Widget body(BuildContext context, WidgetRef ref) {
    final listProvider = ref.watch(userListProvider.notifier);

    return InfiniteList<User>(
      pagingController: listProvider.pagingController,
      itemBuilder: (context, user, index) => UserCard(user),
      emptyText: "No Users",
      onRefresh: listProvider.refresh,
    );
  }
}
