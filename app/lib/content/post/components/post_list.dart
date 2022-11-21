import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:houston_app/core/components/base_component.dart';
import 'package:houston_app/core/components/infinite_grid.dart';
import 'package:houston_app/content/post/components/post_card.dart';
import 'package:houston_app/content/post/models/post.dart';
import 'package:houston_app/content/post/providers/post_list_provider.dart';

class PostList extends BaseComponent {
  const PostList({Key? key}) : super(key: key);

  @override
  Widget body(BuildContext context, WidgetRef ref) {
    final listProvider = ref.watch(postListProvider.notifier);

    return InfiniteGrid<Post>(
      pagingController: listProvider.pagingController,
      itemBuilder: (context, post, index) => PostCard(post),
      emptyText: "No Posts",
      onRefresh: listProvider.refresh,
      itemWidth: 300,
    );
    //TODO: implement grid/list toggle
    // return InfiniteList<Post>(
    //   pagingController: listProvider.pagingController,
    //   itemBuilder: (context, post, index) => PostCard(post),
    //   emptyText: "No Posts",
    //   onRefresh: listProvider.refresh,
    // );
  }
}