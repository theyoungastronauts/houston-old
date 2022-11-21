import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:houston_app/core/components/base_component.dart';
import 'package:houston_app/access/me/models/me_user.dart';
import 'package:houston_app/access/user/components/avatar.dart';

class MeProfile extends BaseComponent {
  final MeUser user;
  const MeProfile(this.user, {Key? key}) : super(key: key);

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
