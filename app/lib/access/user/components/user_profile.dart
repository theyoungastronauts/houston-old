import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/components/base_component.dart';
import '../../../core/components/buttons.dart';
import '../../../navigation/app_router.gr.dart';
import '../../me/providers/me_provider.dart';
import '../models/user.dart';
import 'avatar.dart';

class UserProfile extends BaseComponent {
  final User user;
  const UserProfile(this.user, {Key? key}) : super(key: key);

  @override
  @override
  Widget body(BuildContext context, WidgetRef ref) {
    final isMe = user.isMe(ref);
    final meData = ref.read(meProvider);

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
            if (user.bio.isNotEmpty)
              ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 500),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    user.bio,
                    style: Theme.of(context).textTheme.bodyText2,
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            if (isMe)
              AppButton(
                label: "Setting",
                type: AppButtonType.Text,
                onPressed: () {
                  AutoRouter.of(context).push(const SettingsScreenRoute());
                },
              ),
            if (!isMe)
              AppButton(
                label: "Follow",
                type: AppButtonType.Elevated,
                onPressed: () {
                  print('Following ${user.name}');
                },
              ),
          ],
        ),
      ),
    );
  }
}
