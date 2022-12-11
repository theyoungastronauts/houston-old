import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../components/base_component.dart';
import '../providers/theme_provider.dart';

class ThemeChooser extends BaseComponent {
  final bool inListTile;
  const ThemeChooser({
    Key? key,
    this.inListTile = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final provider = ref.read(themeProvider.notifier);
    final model = ref.watch(themeProvider);

    return _Container(
      inListTile: inListTile,
      child: DropdownButton<ThemeMode>(
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
      ),
    );
  }
}

class _Container extends StatelessWidget {
  final bool inListTile;
  final Widget child;
  const _Container({
    Key? key,
    required this.inListTile,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (inListTile) {
      return ListTile(
        leading: const Icon(Icons.color_lens),
        title: const Text("Theme"),
        trailing: child,
      );
    }
    return Container();
  }
}
