import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:houston_app/core/components/base_component.dart';
import 'package:houston_app/core/providers/session_provider.dart';
import 'package:houston_app/feature/navigation/app_router.gr.dart';
import 'package:houston_app/feature/settings/providers/settings_form_provider.dart';
import 'package:houston_app/feature/theme/components/theme_chooser.dart';
import 'package:houston_app/feature/theme/theme.dart';

class SettingsForm extends BaseComponent {
  const SettingsForm({Key? key}) : super(key: key);

  @override
  Widget body(BuildContext context, WidgetRef ref) {
    final provider = ref.read(settingsFormProvider.notifier);
    // final model = ref.watch(settingsFormProvider);

    return Form(
      key: provider.formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const ThemeChooser(
                  inListTile: true,
                ),
                ListTile(
                  leading: const Icon(Icons.person),
                  title: const Text("Edit Profile"),
                  trailing: const Icon(Icons.chevron_right),
                  onTap: () {
                    AutoRouter.of(context).push(const MeProfileEditScreenRoute());
                  },
                ),
                const Divider(),
                ListTile(
                  textColor: Theme.of(context).colorScheme.danger,
                  iconColor: Theme.of(context).colorScheme.danger,
                  leading: const Icon(Icons.logout),
                  title: const Text("Logout"),
                  trailing: const Icon(Icons.chevron_right),
                  onTap: () {
                    ref.read(sessionProvider.notifier).logout();
                  },
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
