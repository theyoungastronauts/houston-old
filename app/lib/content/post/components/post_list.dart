import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:houston_app/content/post/components/post_list_tile.dart';
import 'package:houston_app/core/components/base_component.dart';
import 'package:houston_app/core/components/infinite_grid.dart';
import 'package:houston_app/content/post/components/post_card.dart';
import 'package:houston_app/content/post/models/post.dart';
import 'package:houston_app/content/post/providers/post_list_provider.dart';
import 'package:houston_app/core/components/infinite_list.dart';
import 'package:houston_app/core/providers/list_mode_provider.dart';

class PostList extends BaseComponent {
  final PostListType type;
  const PostList({
    Key? key,
    required this.type,
  }) : super(key: key);

  @override
  Widget body(BuildContext context, WidgetRef ref) {
    final listProvider = ref.watch(postListProvider(type).notifier);
    final listMode = ref.watch(listModeProvider('post'));

    return listMode == ListMode.list
        ? InfiniteList<Post>(
            pagingController: listProvider.pagingController,
            itemBuilder: (context, post, index) => PostListTile(post),
            emptyText: "No Posts",
            onRefresh: listProvider.refresh,
          )
        : InfiniteGrid<Post>(
            pagingController: listProvider.pagingController,
            itemBuilder: (context, post, index) => PostCard(post),
            emptyText: "No Posts",
            onRefresh: listProvider.refresh,
            itemWidth: 300,
          );
  }
}
