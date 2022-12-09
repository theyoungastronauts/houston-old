import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/components/base_component.dart';
import '../../../core/components/buttons.dart';
import '../../../core/providers/session_provider.dart';
import '../../me/providers/me_provider.dart';
import '../models/user.dart';

class FollowButton extends BaseComponent {
  final User user;

  const FollowButton(
    this.user, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isFollowing = ref.watch(sessionProvider).isFollowing(user);

    return AppButton(
      label: isFollowing ? 'Unfollow' : 'Follow',
      type: AppButtonType.Elevated,
      onPressed: () {
        ref.read(meProvider.notifier).follow(user, willFollow: !isFollowing);
      },
    );
  }
}
