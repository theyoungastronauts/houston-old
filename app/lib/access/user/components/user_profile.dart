import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../content/post/providers/following_provider.dart';
import '../../../core/components/base_component.dart';
import '../../../core/components/buttons.dart';
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
    final provider = ref.read(followingProvider.notifier);
    final followingData = ref.watch(followingProvider);

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
            if (isMe) const FollowerCount(),
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
                label: followingData.following.contains(user.id) ? 'Unfollow' : 'Follow',
                type: AppButtonType.Elevated,
                onPressed: () {
                  if (followingData.following.contains(user.id)) {
                    provider.follow(user, willFollow: false);
                  } else {
                    provider.follow(
                      user,
                    );
                  }
                },
              ),
          ],
        ),
      ),
    );
  }
}

class FollowerCount extends BaseComponent {
  const FollowerCount({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final followingData = ref.watch(followingProvider);

    return ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: 500),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          InkWell(
            onTap: () {
              AutoRouter.of(context).push(UserListScreenRoute(type: UserListType.followers));
            },
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    followingData.followers.length.toString(),
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
            onTap: () {
              AutoRouter.of(context).push(UserListScreenRoute(type: UserListType.following));
            },
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    followingData.following.length.toString(),
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
