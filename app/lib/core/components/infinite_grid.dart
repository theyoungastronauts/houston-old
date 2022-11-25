import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

import 'empty_placeholder.dart';

class InfiniteGrid<T> extends StatelessWidget {
  final PagingController<int, T> pagingController;

  final Widget Function(BuildContext context, T item, int index) itemBuilder;
  final Function onRefresh;
  final String emptyText;
  final double itemWidth;
  final double aspectRatio;
  final double widthOffset;

  const InfiniteGrid({
    Key? key,
    required this.pagingController,
    required this.itemBuilder,
    required this.emptyText,
    required this.onRefresh,
    this.itemWidth = double.infinity,
    this.aspectRatio = 1.0,
    this.widthOffset = 0.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final numberOfColumns = itemWidth == double.infinity ? 1 : ((MediaQuery.of(context).size.width - widthOffset) / itemWidth).floor();

    return RefreshIndicator(
      onRefresh: () => Future.sync(() => onRefresh()),
      child: PagedGridView<int, T>(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: numberOfColumns,
          childAspectRatio: aspectRatio,
          crossAxisSpacing: 8.0,
          mainAxisSpacing: 8.0,
        ),
        pagingController: pagingController,
        builderDelegate: PagedChildBuilderDelegate<T>(
          itemBuilder: itemBuilder,
          noItemsFoundIndicatorBuilder: (_) => EmptyPlaceholder(title: emptyText),
        ),
      ),
    );
  }
}
