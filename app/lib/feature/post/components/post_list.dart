import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:houston_app/core/components/base_component.dart';
import 'package:houston_app/core/components/infinite_list.dart';
import 'package:houston_app/feature/post/components/post_card.dart';
import 'package:houston_app/feature/post/models/post.dart';
import 'package:houston_app/feature/post/providers/post_list_provider.dart';

class PostList extends BaseComponent {
  const PostList({Key? key}) : super(key: key);

  @override
  Widget body(BuildContext context, WidgetRef ref) {
    final listProvider = ref.watch(postListProvider.notifier);

    return InfiniteList<Post>(
      pagingController: listProvider.pagingController,
      itemBuilder: (context, post, index) => PostCard(post),
      emptyText: "No Posts",
      onRefresh: listProvider.refresh,
    );
  }
}