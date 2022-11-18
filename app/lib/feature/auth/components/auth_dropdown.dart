import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:houston_app/core/components/base_component.dart';
import 'package:houston_app/core/providers/session_provider.dart';
import 'package:houston_app/feature/user/components/avatar.dart';

class AuthDropdown extends BaseComponent {
  const AuthDropdown({Key? key}) : super(key: key);

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
                  style: Theme.of(context).textTheme.caption,
                ),
              ),
            ],
          ),
          itemBuilder: (context) {
            return [
              PopupMenuItem(
                child: const Text("My Profile"),
                onTap: () {},
              ),
            ];
          },
        ),
      );
    }

    return SizedBox();
  }
}
