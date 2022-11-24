import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/components/base_component.dart';
import '../../app_router.gr.dart';
import '../../../core/theme/components/theme_chooser.dart';
import '../../../core/theme/theme.dart';

class MainDrawer extends BaseComponent {
  const MainDrawer({Key? key}) : super(key: key);
  @override
  Widget body(BuildContext context, WidgetRef ref) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.drawerBackground,
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Houston",
                style: Theme.of(context).textTheme.headline3,
              ),
              const Divider(),
              TextButton.icon(
                onPressed: () {
                  Navigator.of(context).pop();
                  AutoRouter.of(context).push(const StyleGuideScreenRoute());
                },
                icon: const Icon(Icons.color_lens),
                label: const Text("Style Guide"),
              ),
              const ThemeChooser(),
            ],
          ),
        ),
      ),
    );
  }
}
