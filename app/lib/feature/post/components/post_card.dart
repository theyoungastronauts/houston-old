import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:houston_app/feature/navigation/app_router.gr.dart';
import 'package:houston_app/feature/post/models/post.dart';
import 'package:houston_app/core/components/base_component.dart';
import 'package:houston_app/feature/user/components/avatar.dart';

class PostCard extends BaseComponent {
  final Post post;
  final double width;
  const PostCard(
    this.post, {
    Key? key,
    this.width = 300,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ConstrainedBox(
      constraints: BoxConstraints(maxWidth: width, maxHeight: width),
      child: Card(
        clipBehavior: Clip.antiAlias,
        child: InkWell(
          onTap: () {
            AutoRouter.of(context).push(PostDetailScreenRoute(uuid: post.uuid));
          },
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                color: Theme.of(context).colorScheme.background,
                child: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Row(
                    children: [
                      Avatar(
                        post.owner,
                        size: 24,
                      ),
                      const SizedBox(width: 6),
                      Text(
                        post.owner.name,
                        style: Theme.of(context).textTheme.caption,
                      )
                    ],
                  ),
                ),
              ),
              Expanded(child: PostThumbnail(post)),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      post.title,
                      style: Theme.of(context).textTheme.headline5,
                    ),
                    Text(post.excerpt()),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

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
