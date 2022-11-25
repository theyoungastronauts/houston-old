import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/components/base_component.dart';
import '../../../core/components/buttons.dart';
import '../../../navigation/app_router.gr.dart';
import '../models/user.dart';
import 'avatar.dart';

class UserProfile extends BaseComponent {
  final User user;
  const UserProfile(this.user, {Key? key}) : super(key: key);

  @override
  @override
  Widget body(BuildContext context, WidgetRef ref) {
    final isMe = user.isMe(ref);

    return Center(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Avatar(
              user,
              size: 100,
              interactive: false,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                user.name,
                style: Theme.of(context).textTheme.headline3,
              ),
            ),
            if (isMe)
              AppButton(
                label: "Setting",
                type: AppButtonType.Text,
                onPressed: () {
                  AutoRouter.of(context).push(const SettingsScreenRoute());
                },
              )
          ],
        ),
      ),
    );
  }
}
