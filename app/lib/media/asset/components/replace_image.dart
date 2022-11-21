import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:houston_app/core/components/base_stateful_component.dart';
import 'package:houston_app/core/components/bottom_sheet_container.dart';
import 'package:houston_app/core/components/buttons.dart';
import 'package:houston_app/core/providers/global_loading_provider.dart';
import 'package:houston_app/core/utils/image.dart';
import 'package:houston_app/core/utils/logging.dart';
import 'package:houston_app/core/utils/screen.dart';
import 'package:houston_app/core/utils/singletons.dart';
import 'package:houston_app/core/utils/toast.dart';
import 'package:houston_app/media/asset/constants.dart';
import 'package:houston_app/media/asset/models/asset.dart';
import 'package:houston_app/media/asset/services/asset_service.dart';
import 'package:houston_app/core/theme/theme.dart';

class ReplaceImage extends BaseStatefulComponent {
  final String? initialUrl;
  final String? title;
  final Function(String?) onChange;
  final bool withUnsplash;
  final bool withLabels;
  final AppSizeVariant size;
  final String fallbackUrl;

  const ReplaceImage({
    Key? key,
    this.initialUrl,
    this.title,
    required this.onChange,
    this.withUnsplash = true,
    this.withLabels = true,
    this.size = AppSizeVariant.md,
    this.fallbackUrl = DEFAULT_IMAGE_URL,
  }) : super(key: key);

  @override
  _ReplaceImageState createState() => _ReplaceImageState();
}

class _ReplaceImageState extends BaseComponentState<ReplaceImage> {
  String? _url;

  bool _isHovering = false;

  // bool get isBitpack {
  //   if (_url == null || _url!.isEmpty) {
  //     return false;
  //   }

  //   if (_url!.contains(Env.mediaBaseUrl)) {
  //     return true;
  //   }

  //   return false;
  // }

  @override
  void initState() {
    super.initState();
    _url = widget.initialUrl ?? widget.fallbackUrl;
  }

  bool get _usingFallback {
    return _url == widget.fallbackUrl;
  }

  void _finalize(Asset? asset) {
    widget.onChange(asset != null ? asset.url : "");
    setState(() {
      _url = asset != null ? asset.url : widget.fallbackUrl;
    });
  }

  Future<void> _handleLocalFile() async {
    ref.read(globalLoadingProvider.notifier).start();

    try {
      final asset = await AssetService().chooseImage();

      if (asset == null) {
        ref.read(globalLoadingProvider.notifier).complete();

        return;
      }

      _finalize(asset);

      ref.read(globalLoadingProvider.notifier).complete();
    } catch (e, stackTrace) {
      singleton<Log>().error("_handleLocalFile Error", e, stackTrace);
      Toast.error();
      ref.read(globalLoadingProvider.notifier).complete();
    }
  }

  Future<void> _chooseImage() async {
    return await _handleLocalFile();
  }

  Future<void> _onPressed() async {
    if (!_usingFallback) {
      return await _showActionsModal();
    }

    return await _chooseImage();
  }

  _showActionsModal() async {
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
                      imageUrl: ImageUrlBuilder.resize(_url!, width: 512),
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
              widget.onChange("");
              setState(() {
                _url = widget.fallbackUrl;
              });
              Navigator.of(context).pop();
            },
          ),
        ]);
      },
    );
  }

  double get _size {
    switch (widget.size) {
      case AppSizeVariant.xs:
        return 16.0;
      case AppSizeVariant.sm:
        return 32.0;
      case AppSizeVariant.md:
        return 64.0;
      case AppSizeVariant.lg:
        return 128.0;
      case AppSizeVariant.xl:
        return 256.0;
    }
  }

  void _onHover(bool val) {
    setState(() {
      _isHovering = val;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (widget.withLabels) {
      return Padding(
        padding: const EdgeInsets.only(top: 8.0),
        child: InkWell(
          onTap: _onPressed,
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 8),
                child: CachedNetworkImage(
                  imageUrl: _usingFallback ? _url! : ImageUrlBuilder.resize(_url!, width: _size),
                  width: _size,
                  height: _size,
                  fit: BoxFit.cover,
                ),
              ),
              if (ScreenUtils.atLeast(context, ScreenSize.md))
                Expanded(
                  child: Text(widget.title ?? "Image"),
                ),
              const Padding(
                padding: EdgeInsets.only(right: 8),
                child: Icon(Icons.upload),
              )
            ],
          ),
        ),
      );
    }
    return InkWell(
        onTap: _onPressed,
        onHover: _onHover,
        child: SizedBox(
          width: _size,
          height: _size,
          child: Stack(
            children: [
              CachedNetworkImage(
                imageUrl: _usingFallback ? _url! : ImageUrlBuilder.resize(_url!, width: _size),
                width: _size,
                height: _size,
                fit: BoxFit.cover,
              ),
              AnimatedOpacity(
                opacity: _isHovering ? 1 : 0,
                duration: const Duration(milliseconds: 100),
                child: const Center(
                  child: Icon(Icons.upload),
                ),
              )
            ],
          ),
        ));
  }
}
