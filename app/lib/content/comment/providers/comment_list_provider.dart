import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:houston_app/content/comment/models/comment.dart';
import 'package:houston_app/content/comment/services/comment_service.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class CommentListProvider extends StateNotifier<List<Comment>> {
  final String postUuid;
  final PagingController<int, Comment> pagingController = PagingController(firstPageKey: 1);

  CommentListProvider(this.postUuid, [List<Comment> initialItems = const []]) : super(initialItems) {
    pagingController.addPageRequestListener((page) {
      _fetchPage(page);
    });
  }

  Future<void> _fetchPage(int page) async {
    try {
      final data = await CommentService().list(postUuid, page: page);

      if (data.page >= data.num_pages) {
        pagingController.appendLastPage(data.results);
      } else {
        pagingController.appendPage(data.results, data.page + 1);
      }

      state = [...state, ...data.results];
    } catch (error) {
      pagingController.error = error;
    }
  }

  void refresh() {
    state = [];
    pagingController.refresh();
  }
}

final commentListProvider = StateNotifierProvider.family<CommentListProvider, List<Comment>, String>(
  (ref, postUuid) => CommentListProvider(postUuid),
);
