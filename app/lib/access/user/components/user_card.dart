import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../navigation/app_router.gr.dart';
import '../models/user.dart';
import '../../../core/components/base_component.dart';
import 'avatar.dart';

class UserCard extends BaseComponent {
  final User user;
  const UserCard(this.user, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Card(
      child: InkWell(
        onTap: () {
          AutoRouter.of(context).push(UserDetailScreenRoute(uuid: user.uuid));
        },
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Avatar(
                user,
                interactive: false,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(user.name),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
