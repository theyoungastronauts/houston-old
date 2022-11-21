import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:houston_app/feature/video/models/video.dart';
import 'package:houston_app/feature/video/services/video_service.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class VideoListProvider extends StateNotifier<List<Video>> {
  final PagingController<int, Video> pagingController =
      PagingController(firstPageKey: 1);

  VideoListProvider([List<Video> initialItems = const []]) : super(initialItems) {
    pagingController.addPageRequestListener((page) {
      _fetchPage(page);
    });
  }

  Future<void> _fetchPage(int page) async {
    try {
      final data = await VideoService().list(page: page);

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

final videoListProvider = StateNotifierProvider<VideoListProvider, List<Video>>(
  (ref) => VideoListProvider(),
);
