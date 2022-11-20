import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:{{project}}/feature/{{#snakeCase}}{{name}}{{/snakeCase}}/models/{{#snakeCase}}{{name}}{{/snakeCase}}.dart';
import 'package:{{project}}/feature/{{#snakeCase}}{{name}}{{/snakeCase}}/services/{{#snakeCase}}{{name}}{{/snakeCase}}_service.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class {{#pascalCase}}{{name}}{{/pascalCase}}ListProvider extends StateNotifier<List<{{#pascalCase}}{{name}}{{/pascalCase}}>> {
  final PagingController<int, {{#pascalCase}}{{name}}{{/pascalCase}}> pagingController =
      PagingController(firstPageKey: 1);

  {{#pascalCase}}{{name}}{{/pascalCase}}ListProvider([List<{{#pascalCase}}{{name}}{{/pascalCase}}> initialItems = const []]) : super(initialItems) {
    pagingController.addPageRequestListener((page) {
      _fetchPage(page);
    });
  }

  Future<void> _fetchPage(int page) async {
    try {
      final data = await {{#pascalCase}}{{name}}{{/pascalCase}}Service().list(page: page);

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

final {{#camelCase}}{{name}}{{/camelCase}}ListProvider = StateNotifierProvider<{{#pascalCase}}{{name}}{{/pascalCase}}ListProvider, List<{{#pascalCase}}{{name}}{{/pascalCase}}>>(
  (ref) => {{#pascalCase}}{{name}}{{/pascalCase}}ListProvider(),
);
