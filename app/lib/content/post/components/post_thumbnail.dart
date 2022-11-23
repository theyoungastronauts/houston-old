import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:houston_app/content/post/models/post.dart';

class PostThumbnail extends StatelessWidget {
  const PostThumbnail(
    this.post, {
    Key? key,
  }) : super(key: key);

  final Post post;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      final w = constraints.maxWidth;
      final h = constraints.maxHeight;

      return SizedBox(
        width: w,
        height: h,
        child: CachedNetworkImage(
          imageUrl: post.thumbnail(width: w, height: h),
          width: w,
          height: h,
          fit: BoxFit.contain,
        ),
      );
    });
  }
}
