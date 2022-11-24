import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import '../../../core/components/bottom_sheet_container.dart';
import '../../../core/components/buttons.dart';
import '../../../core/components/centered_loader.dart';
import '../../../core/utils/image.dart';
import '../../../core/utils/logging.dart';
import '../../../core/utils/singletons.dart';
import '../../../core/utils/toast.dart';
import '../models/asset.dart';
import '../services/asset_service.dart';

class ReplaceAsset extends StatefulWidget {
  final String? initialUrl;
  final String? title;
  final Function(String) onChange;
  final Function() onRemove;

  const ReplaceAsset({
    Key? key,
    this.initialUrl,
    this.title,
    required this.onChange,
    required this.onRemove,
  }) : super(key: key);

  @override
  State<ReplaceAsset> createState() => _ReplaceAssetState();
}

class _ReplaceAssetState extends State<ReplaceAsset> {
  String? url;
  bool isProcessing = false;

  @override
  void initState() {
    super.initState();
    url = widget.initialUrl;
  }

  void _finalize(Asset? asset) {
    if (asset?.url != null) {
      widget.onChange(asset!.url);
    }
    setState(() {
      url = asset?.url;
    });
  }

  Future<void> _handleLocalFile() async {
    try {
      setState(() {
        isProcessing = true;
      });

      final asset = await AssetService().chooseImage();
      if (asset == null) {
        setState(() {
          isProcessing = false;
        });
        return;
      }

      _finalize(asset);

      setState(() {
        isProcessing = false;
      });
    } catch (e, stackTrace) {
      singleton<Log>().error("_handleLocalFile Error", e, stackTrace);
      Toast.error();
      setState(() {
        isProcessing = false;
      });
    }
  }

  Future<void> _chooseImage() async {
    return await _handleLocalFile();
  }

  Future<void> _onPressed() async {
    if (url != null) {
      return await _showActionsModal();
    }

    return await _chooseImage();
  }

  Future<void> _showActionsModal() async {
    await showModalBottomSheet(
      context: context,
      builder: (context) {
        return BottomSheetContainer(title: widget.title, children: [
          ListTile(
            title: const Text("Replace"),
            leading: const Icon(Icons.replay),
            trailing: const Icon(Icons.chevron_right),
            onTap: () async {
              await _chooseImage();
              Navigator.of(context).pop();
            },
          ),
          ListTile(
            title: const Text("Preview"),
            leading: const Icon(Icons.preview),
            trailing: const Icon(Icons.chevron_right),
            onTap: () {
              Navigator.of(context).pop();
              showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    content: CachedNetworkImage(
                      imageUrl: ImageUrlBuilder.resize(url!, width: 512),
                    ),
                    actions: [
                      AppButton(
                        label: "Close",
                        type: AppButtonType.Text,
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      )
                    ],
                  );
                },
              );
            },
          ),
          ListTile(
            title: const Text("Remove"),
            leading: const Icon(Icons.delete),
            trailing: const Icon(Icons.chevron_right),
            onTap: () {
              widget.onRemove();
              setState(() {
                url = null;
              });
              Navigator.of(context).pop();
            },
          ),
        ]);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: SizedBox(
        width: 32,
        height: 32,
        child: Builder(
          builder: (context) {
            if (isProcessing) {
              return const CenteredLoader();
            }

            return url != null
                ? CachedNetworkImage(
                    imageUrl: ImageUrlBuilder.resize(url!, width: 32),
                    width: 32,
                    height: 32,
                    fit: BoxFit.cover,
                  )
                : const Center(child: Icon(Icons.photo));
          },
        ),
      ),
      title: Text(widget.title ?? "Image"),
      trailing: const Icon(Icons.upload),
      onTap: _onPressed,
    );
  }
}
