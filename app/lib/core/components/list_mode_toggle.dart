import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'base_component.dart';
import '../providers/list_mode_provider.dart';

class ListModeToggle extends BaseComponent {
  final String providerFamily;

  const ListModeToggle({
    required this.providerFamily,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final provider = ref.read(listModeProvider(providerFamily).notifier);
    final mode = ref.watch(listModeProvider(providerFamily));

    return IconButton(
      onPressed: mode == ListMode.list ? provider.grid : provider.list,
      icon: mode == ListMode.list ? const Icon(Icons.grid_view) : const Icon(Icons.list),
    );
  }
}
