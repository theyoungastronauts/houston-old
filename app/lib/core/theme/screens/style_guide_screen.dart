import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:houston_app/core/components/buttons.dart';
import 'package:houston_app/core/screens/base_screen.dart';
import 'package:houston_app/core/theme/components/theme_chooser.dart';
import 'package:houston_app/core/theme/theme.dart';

class StyleGuideScreen extends BaseScreen {
  const StyleGuideScreen({Key? key}) : super(key: key);

  @override
  AppBar? appBar(BuildContext context, WidgetRef ref) {
    return AppBar(
      title: const Text("Style Guide"),
      actions: const [Center(child: ThemeChooser())],
    );
  }

  @override
  Widget body(BuildContext context, WidgetRef ref) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    final List<IconData> _icons = [
      Icons.favorite,
      Icons.favorite_outline,
      Icons.bookmark,
      Icons.bookmark_outline,
      Icons.delete,
      Icons.play_arrow_rounded,
      Icons.pause_rounded,
      Icons.shuffle_rounded,
      Icons.shuffle_on_rounded,
      Icons.repeat_rounded,
      Icons.repeat_one_rounded,
      Icons.repeat_on_rounded,
      Icons.playlist_play_rounded,
      Icons.playlist_add,
      Icons.skip_previous_rounded,
      Icons.skip_next_rounded,
      Icons.volume_mute,
      Icons.more_horiz,
      Icons.more_vert,
      Icons.chevron_left,
      Icons.chevron_right,
      Icons.keyboard_arrow_down_rounded,
      Icons.keyboard_arrow_up_rounded,
      Icons.close,
      Icons.email,
      Icons.phone,
      Icons.place,
      Icons.check,
      Icons.warning,
      Icons.error,
      Icons.notification_important,
      Icons.add,
      Icons.waves,
      Icons.sort,
      Icons.filter_list,
      Icons.person,
    ];

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const _Heading("Color Pallet"),
          Wrap(
            spacing: 8.0,
            children: [
              _Color(color: colorScheme.primary, name: "Primary"),
              _Color(color: colorScheme.secondary, name: "Secondary"),
              _Color(color: colorScheme.info, name: "Info"),
              _Color(color: colorScheme.danger, name: "Danger"),
              _Color(color: colorScheme.success, name: "Success"),
              _Color(color: colorScheme.warning, name: "Warning"),
              _Color(color: colorScheme.light, name: "Light", foregroundColor: Colors.black),
              _Color(color: colorScheme.dark, name: "Dark"),
            ],
          ),
          const _Heading("Headings"),
          Text("Heading 1", style: textTheme.headline1),
          Text("Heading 2", style: textTheme.headline2),
          Text("Heading 3", style: textTheme.headline3),
          Text("Heading 4", style: textTheme.headline4),
          Text("Heading 5", style: textTheme.headline5),
          Text("Heading 6", style: textTheme.headline6),
          Text("Subtitle 1", style: textTheme.subtitle1),
          Text("Subtitle 2", style: textTheme.subtitle2),
          const _Heading("Buttons"),
          Wrap(
            children: [
              AppButton(
                label: "Elevated Primary",
                onPressed: () {},
              ),
              const _Spacer(horizontal: true),
              AppButton(
                label: "Outlined Primary",
                onPressed: () {},
                type: AppButtonType.Outlined,
              ),
              const _Spacer(horizontal: true),
              AppButton(
                label: "Text Primary",
                onPressed: () {},
                type: AppButtonType.Text,
              ),
            ],
          ),
          const _Spacer(),
          Wrap(
            children: [
              AppButton(
                label: "Elevated Secondary",
                onPressed: () {},
                variant: AppColorVariant.secondary,
              ),
              const _Spacer(horizontal: true),
              AppButton(
                label: "Outlined Secondary",
                onPressed: () {},
                type: AppButtonType.Outlined,
                variant: AppColorVariant.secondary,
              ),
              const _Spacer(horizontal: true),
              AppButton(
                label: "Text Secondary",
                onPressed: () {},
                type: AppButtonType.Text,
                variant: AppColorVariant.secondary,
              ),
            ],
          ),
          const _Spacer(),
          Wrap(
            children: [
              AppButton(
                label: "Elevated Danger",
                onPressed: () {},
                variant: AppColorVariant.danger,
              ),
              const _Spacer(horizontal: true),
              AppButton(
                label: "Outlined Danger",
                onPressed: () {},
                type: AppButtonType.Outlined,
                variant: AppColorVariant.danger,
              ),
              const _Spacer(horizontal: true),
              AppButton(
                label: "Text Danger",
                onPressed: () {},
                type: AppButtonType.Text,
                variant: AppColorVariant.danger,
              ),
            ],
          ),
          const _Spacer(),
          Wrap(
            children: [
              AppButton(
                label: "Icon",
                onPressed: () {},
                icon: Icons.favorite,
              ),
              const _Spacer(horizontal: true),
              AppButton(
                label: "Processing",
                onPressed: () {},
                processing: true,
                variant: AppColorVariant.secondary,
                type: AppButtonType.Outlined,
              ),
              const _Spacer(horizontal: true),
              const AppButton(
                label: "Disabled",
              ),
            ],
          ),
          const _Heading("Text"),
          Text(
            "Body Text 1: Vivamus suscipit tortor eget felis porttitor volutpat. Vivamus magna justo, lacinia eget consectetur sed, convallis at tellus. Vivamus suscipit tortor eget felis porttitor volutpat. Mauris blandit aliquet elit, eget tincidunt nibh pulvinar a. Vivamus suscipit tortor eget felis porttitor volutpat.",
            style: textTheme.bodyText1,
          ),
          const _Spacer(),
          Text(
            "Body Text 2: Vivamus suscipit tortor eget felis porttitor volutpat. Vivamus magna justo, lacinia eget consectetur sed, convallis at tellus. Vivamus suscipit tortor eget felis porttitor volutpat. Mauris blandit aliquet elit, eget tincidunt nibh pulvinar a. Vivamus suscipit tortor eget felis porttitor volutpat.",
            style: textTheme.bodyText2,
          ),
          const _Spacer(),
          Text(
            "Caption: Vivamus suscipit tortor eget felis porttitor volutpat. Vivamus magna justo, lacinia eget consectetur sed, convallis at tellus. Vivamus suscipit tortor eget felis porttitor volutpat. Mauris blandit aliquet elit, eget tincidunt nibh pulvinar a. Vivamus suscipit tortor eget felis porttitor volutpat.",
            style: textTheme.caption,
          ),
          const _Heading("List Tiles"),
          ListTile(
            title: const Text("List Tile"),
            subtitle: const Text("Default list tile..."),
            leading: const Icon(Icons.inbox),
            trailing: const Icon(Icons.chevron_right),
            onTap: () {},
          ),
          ListTile(
            dense: true,
            title: const Text("Dense List Tile"),
            subtitle: const Text("Dense list tile..."),
            leading: const Icon(Icons.inbox),
            trailing: const Icon(Icons.chevron_right),
            onTap: () {},
          ),
          const _Heading("Icons"),
          Wrap(children: _icons.map((icon) => _Icon(icon)).toList())
        ],
      ),
    );
  }
}

class _Color extends StatelessWidget {
  const _Color({
    Key? key,
    required this.color,
    required this.name,
    this.foregroundColor = Colors.white,
  }) : super(key: key);

  final Color color;
  final Color foregroundColor;
  final String name;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: color,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          name,
          style: TextStyle(color: foregroundColor),
        ),
      ),
    );
  }
}

class _Heading extends StatelessWidget {
  final String label;
  const _Heading(this.label, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Container(
        color: Theme.of(context).colorScheme.background,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            label,
            style: const TextStyle(fontSize: 20),
          ),
        ),
      ),
    );
  }
}

class _Spacer extends StatelessWidget {
  final bool horizontal;
  const _Spacer({Key? key, this.horizontal = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return horizontal ? const SizedBox(width: 12.0) : const SizedBox(height: 12.0);
  }
}

class _Icon extends StatelessWidget {
  final IconData icon;
  const _Icon(
    this.icon, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Icon(icon),
    );
  }
}
