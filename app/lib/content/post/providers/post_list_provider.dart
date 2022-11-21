import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:houston_app/content/post/models/post.dart';
import 'package:houston_app/content/post/services/post_service.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class PostListProvider extends StateNotifier<List<Post>> {
  final PagingController<int, Post> pagingController = PagingController(firstPageKey: 1);

  PostListProvider([List<Post> initialItems = const []]) : super(initialItems) {
    pagingController.addPageRequestListener((page) {
      _fetchPage(page);
    });
  }

  Future<void> _fetchPage(int page) async {
    try {
      final data = await PostService().list(page: page);

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

final postListProvider = StateNotifierProvider<PostListProvider, List<Post>>(
  (ref) => PostListProvider(),
);
