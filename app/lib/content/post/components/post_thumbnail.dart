import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../core/utils/dialogs.dart';
import '../models/post.dart';

class PostThumbnail extends StatelessWidget {
  final Post post;
  final bool interactive;
  final int assetIndex;

  const PostThumbnail(
    this.post, {
    Key? key,
    this.interactive = true,
    this.assetIndex = 0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      final width = constraints.maxWidth;
      final height = constraints.maxHeight;

      return InkWell(
        onTap: interactive
            ? () {
                ImagePreviewDialog.show(post.assets[assetIndex]);
              }
            : null,
        child: SizedBox(
          width: width,
          height: height,
          child: CachedNetworkImage(
            imageUrl: post.thumbnail(assetIndex: assetIndex, width: width, height: height),
            width: width,
            height: height,
            fit: BoxFit.cover,
          ),
        ),
      );
    });
  }
}
