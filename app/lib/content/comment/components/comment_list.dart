import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../post/models/post.dart';
import '../../../core/components/base_component.dart';
import '../../../core/components/infinite_list.dart';
import 'comment_card.dart';
import '../models/comment.dart';
import '../providers/comment_list_provider.dart';

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
