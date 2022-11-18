import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:houston_app/core/components/base_component.dart';
import 'package:houston_app/feature/theme/providers/theme_provider.dart';

class ThemeChooser extends BaseComponent {
  const ThemeChooser({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final provider = ref.read(themeProvider.notifier);
    final model = ref.watch(themeProvider);

    return DropdownButton<ThemeMode>(
      focusColor: Colors.transparent,
      underline: const SizedBox.shrink(),
      value: model,
      onChanged: (value) {
        switch (value) {
          case ThemeMode.dark:
            provider.setDark();
            break;
          case ThemeMode.light:
            provider.setLight();
            break;
          case ThemeMode.system:
            provider.setSystem();
            break;
          default:
            break;
        }
      },
      items: const [
        DropdownMenuItem(
          value: ThemeMode.system,
          child: Text('System Theme'),
        ),
        DropdownMenuItem(
          value: ThemeMode.light,
          child: Text('Light Theme'),
        ),
        DropdownMenuItem(
          value: ThemeMode.dark,
          child: Text('Dark Theme'),
        )
      ],
    );
  }
}
