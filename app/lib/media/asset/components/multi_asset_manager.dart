import 'package:flutter/material.dart';
import 'package:houston_app/media/asset/components/replace_asset.dart';

class MultiAssetManager extends StatelessWidget {
  final List<String> assets;
  final Function(String) onAdd;
  final Function(int, String) onUpdate;
  final Function(int) onRemove;

  const MultiAssetManager({
    Key? key,
    required this.assets,
    required this.onAdd,
    required this.onUpdate,
    required this.onRemove,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [...assets, null].asMap().entries.map(
        (entry) {
          final i = entry.key;
          final forAdd = entry.value == null;

          return ReplaceAsset(
            key: Key("$i${entry.value}"),
            initialUrl: entry.value,
            title: forAdd ? "Add Image" : 'Image #${i + 1}',
            onRemove: () {
              if (!forAdd) {
                onRemove(i);
              }
            },
            onChange: (url) {
              forAdd ? onAdd(url) : onUpdate(i, url);
            },
          );
        },
      ).toList(),
    );
  }
}
