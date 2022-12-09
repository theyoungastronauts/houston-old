import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/components/base_component.dart';
import '../../../core/components/buttons.dart';
import '../../../core/providers/session_provider.dart';
import '../../../navigation/app_router.gr.dart';
import '../../me/providers/me_provider.dart';
import '../models/user.dart';
import '../providers/user_list_provider.dart';
import 'avatar.dart';

class UserProfile extends BaseComponent {
  final User user;
  const UserProfile(this.user, {Key? key}) : super(key: key);

  @override
  @override
  Widget body(BuildContext context, WidgetRef ref) {
    final isMe = user.isMe(ref);
    final isFollowing = ref.watch(sessionProvider).isFollowing(user);

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
            FollowerCount(user),
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
                label: isFollowing ? 'Unfollow' : 'Follow',
                type: AppButtonType.Elevated,
                onPressed: () {
                  ref.read(meProvider.notifier).follow(user, willFollow: !isFollowing);
                },
              ),
          ],
        ),
      ),
    );
  }
}

class FollowerCount extends BaseComponent {
  final User user;
  const FollowerCount(
    this.user, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isMe = user.isMe(ref);
    return ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: 500),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          InkWell(
            onTap: user.isMe(ref)
                ? () {
                    AutoRouter.of(context).push(UserListScreenRoute(type: UserListType.followers));
                  }
                : null,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    user.followers.length.toString(),
                    style: Theme.of(context).textTheme.headline1,
                    textAlign: TextAlign.center,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Followers',
                    style: Theme.of(context).textTheme.bodyLarge,
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ),
          InkWell(
            onTap: user.isMe(ref)
                ? () {
                    AutoRouter.of(context).push(UserListScreenRoute(type: UserListType.following));
                  }
                : null,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    user.following.length.toString(),
                    style: Theme.of(context).textTheme.headline1,
                    textAlign: TextAlign.center,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Following',
                    style: Theme.of(context).textTheme.bodyLarge,
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
