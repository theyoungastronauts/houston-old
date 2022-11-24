import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'post_context_menu.dart';
import 'post_thumbnail.dart';
import '../models/post.dart';
import '../../../core/components/base_component.dart';
import '../../../navigation/app_router.gr.dart';

class PostListTile extends BaseComponent {
  final Post post;
  const PostListTile(this.post, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListTile(
      title: Text(post.title),
      subtitle: Text(post.owner.name),
      leading: SizedBox(width: 32, height: 32, child: PostThumbnail(post)),
      trailing: PostListContextMenu(
        post: post,
      ),
      onTap: () {
        AutoRouter.of(context).push(PostDetailScreenRoute(uuid: post.uuid));
      },
    );
  }
}
