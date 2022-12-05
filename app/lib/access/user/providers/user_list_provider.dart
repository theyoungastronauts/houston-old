import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/models/paginated_response.dart';
import '../models/user.dart';
import '../services/user_service.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

enum UserListType { following, followers }

class UserListProvider extends StateNotifier<List<User>> {
  final PagingController<int, User> pagingController = PagingController(firstPageKey: 1);
  final UserListType type;

  UserListProvider(this.type, [List<User> initialItems = const []]) : super(initialItems) {
    pagingController.addPageRequestListener((page) {
      _fetchPage(page);
    });
  }

  Future<void> _fetchPage(int page) async {
    try {
      late PaginatedResponse<User> data;
      switch (type) {
        case UserListType.followers:
          data = await UserService().followers(page: page);
          break;
        case UserListType.following:
          data = await UserService().following(page: page);
          break;
        default:
          data = await UserService().list(page: page);
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

final userListProvider = StateNotifierProvider.family<UserListProvider, List<User>, UserListType>(
  (ref, family) => UserListProvider(family),
);
