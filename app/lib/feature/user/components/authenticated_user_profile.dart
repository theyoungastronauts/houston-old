import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:houston_app/core/components/base_component.dart';
import 'package:houston_app/feature/user/components/avatar.dart';
import 'package:houston_app/feature/user/models/authenticated_user.dart';

class AuthenticatedUserProfile extends BaseComponent {
  final AuthenticatedUser user;
  const AuthenticatedUserProfile(this.user, {Key? key}) : super(key: key);

  @override
  Widget body(BuildContext context, WidgetRef ref) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Avatar(
              user.asUser(),
              size: 100,
              interactive: false,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                user.name,
                style: Theme.of(context).textTheme.headline3,
              ),
            )
          ],
        ),
      ),
    );
  }
}
