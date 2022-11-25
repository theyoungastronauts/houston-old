import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/components/base_component.dart';
import '../../../core/components/buttons.dart';
import '../../../navigation/app_router.gr.dart';
import '../models/post.dart';
import 'post_thumbnail.dart';

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
              spacing: 8.0,
              children: post.assets
                  .asMap()
                  .entries
                  .map((entry) => SizedBox(
                        width: 128,
                        height: 128,
                        child: PostThumbnail(
                          post,
                          assetIndex: entry.key,
                        ),
                      ))
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
