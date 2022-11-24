import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:houston_app/content/post/models/post.dart';
import 'package:houston_app/content/post/providers/post_detail_provider.dart';
import 'package:houston_app/core/components/base_component.dart';
import 'package:houston_app/core/components/infinite_list.dart';
import 'package:houston_app/content/comment/components/comment_card.dart';
import 'package:houston_app/content/comment/models/comment.dart';
import 'package:houston_app/content/comment/providers/comment_list_provider.dart';

class CommentList extends BaseComponent {
  final Post post;

  const CommentList({Key? key, required this.post}) : super(key: key);

  @override
  Widget body(BuildContext context, WidgetRef ref) {
    final listProvider = ref.watch(commentListProvider(post.uuid).notifier);

    return InfiniteList<Comment>(
      pagingController: listProvider.pagingController,
      itemBuilder: (context, comment, index) => CommentCard(
        comment,
        post: post,
      ),
      emptyText: "No Comments",
      onRefresh: listProvider.refresh,
    );
  }
}
