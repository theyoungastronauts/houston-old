import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/components/base_component.dart';
import '../../../core/components/infinite_grid.dart';
import '../../../core/components/infinite_list.dart';
import '../../../core/providers/list_mode_provider.dart';
import '../models/post.dart';
import '../providers/post_list_provider.dart';
import 'post_card.dart';
import 'post_list_tile.dart';

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
            itemBuilder: (context, post, index) => PostCard(
              post,
              width: 300,
            ),
            emptyText: "No Posts",
            onRefresh: listProvider.refresh,
            itemWidth: 300,
          );
  }
}
