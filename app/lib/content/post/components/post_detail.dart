import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:houston_app/core/components/base_component.dart';
import 'package:houston_app/content/post/models/post.dart';
import 'package:houston_app/core/components/buttons.dart';
import 'package:houston_app/navigation/app_router.gr.dart';

class PostDetail extends BaseComponent {
  final Post post;
  const PostDetail(this.post, {Key? key}) : super(key: key);

  @override
  Widget body(BuildContext context, WidgetRef ref) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          post.title,
          style: Theme.of(context).textTheme.headline3,
        ),
        Text(
          "by ${post.owner.name}",
          style: Theme.of(context).textTheme.headline6,
        ),
        if (post.assets.isNotEmpty)
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: Wrap(
              children: post.assets
                  .map(
                    (url) => SizedBox(
                      width: 64,
                      height: 64,
                      child: CachedNetworkImage(
                        imageUrl: url,
                        width: 64,
                        height: 64,
                      ),
                    ),
                  )
                  .toList(),
            ),
          ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Text(
            post.body,
            style: Theme.of(context).textTheme.bodyLarge,
          ),
        ),
        AppButton(
          label: "Comment",
          onPressed: () {
            AutoRouter.of(context).push(PostCommentsScreenRoute(postUuid: post.uuid));
          },
        )
      ],
    );
  }
}
