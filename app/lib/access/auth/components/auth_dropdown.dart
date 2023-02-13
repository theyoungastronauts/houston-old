import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/components/base_component.dart';
import '../../../core/providers/session_provider.dart';
import '../../../navigation/app_router.gr.dart';
import '../../../core/theme/theme.dart';
import '../../user/components/avatar.dart';

class AuthDropdown extends BaseComponent {
  final Function() onProfilePressed;
  const AuthDropdown({
    Key? key,
    required this.onProfilePressed,
  }) : super(key: key);

  @override
  Widget body(BuildContext context, WidgetRef ref) {
    final user = ref.watch(sessionProvider).user;
    if (user != null) {
      return SizedBox(
        height: 32,
        child: PopupMenuButton(
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Avatar(
                user.asUser(),
                size: 24,
                interactive: false,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Text(
                  user.name,
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ),
            ],
          ),
          itemBuilder: (context) {
            return <PopupMenuEntry>[
              PopupMenuItem(
                onTap: onProfilePressed,
                child: const Text("My Profile"),
              ),
              PopupMenuItem(
                child: const Text("Settings"),
                onTap: () {
                  AutoRouter.of(context).push(const SettingsScreenRoute());
                },
              ),
              const PopupMenuDivider(),
              PopupMenuItem(
                child: Text(
                  "Logout",
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.danger,
                  ),
                ),
                onTap: () {
                  ref.read(sessionProvider.notifier).logout();
                },
              ),
            ];
          },
        ),
      );
    }

    return const SizedBox.shrink();
  }
}
