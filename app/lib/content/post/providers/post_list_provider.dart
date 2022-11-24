import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:houston_app/content/post/models/post.dart';
import 'package:houston_app/content/post/services/post_service.dart';
import 'package:houston_app/core/models/paginated_response.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

enum PostListType {
  all,
  me,
}

class PostListProvider extends StateNotifier<List<Post>> {
  final PagingController<int, Post> pagingController = PagingController(firstPageKey: 1);
  final PostListType type;

  PostListProvider(this.type, [List<Post> initialItems = const []]) : super(initialItems) {
    pagingController.addPageRequestListener((page) {
      _fetchPage(page);
    });
  }

  Future<void> _fetchPage(int page) async {
    try {
      late PaginatedResponse<Post> data;

      switch (type) {
        case PostListType.me:
          data = await PostService().me(page: page);
          break;
        case PostListType.all:
          data = await PostService().list(page: page);
          break;
      }

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

final postListProvider = StateNotifierProvider.family<PostListProvider, List<Post>, PostListType>(
  (ref, type) => PostListProvider(type),
);
