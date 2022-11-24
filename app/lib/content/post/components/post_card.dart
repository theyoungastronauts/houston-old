import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'post_context_menu.dart';
import 'post_thumbnail.dart';
import '../../../navigation/app_router.gr.dart';
import '../models/post.dart';
import '../../../core/components/base_component.dart';
import '../../../access/user/components/avatar.dart';

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
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
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
                      PostListContextMenu(post: post)
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
