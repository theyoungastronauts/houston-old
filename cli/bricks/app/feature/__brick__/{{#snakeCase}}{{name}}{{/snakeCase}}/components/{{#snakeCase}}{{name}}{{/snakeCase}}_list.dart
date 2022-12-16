import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/components/base_component.dart';
import '../../../core/components/infinite_list.dart';
import '../components/{{#snakeCase}}{{name}}{{/snakeCase}}_card.dart';
import '../models/{{#snakeCase}}{{name}}{{/snakeCase}}.dart';
import '../providers/{{#snakeCase}}{{name}}{{/snakeCase}}_list_provider.dart';

class {{#pascalCase}}{{name}}{{/pascalCase}}List extends BaseComponent {
  const {{#pascalCase}}{{name}}{{/pascalCase}}List({Key? key}) : super(key: key);

  @override
  Widget body(BuildContext context, WidgetRef ref) {
    final listProvider = ref.watch({{#camelCase}}{{name}}{{/camelCase}}ListProvider.notifier);

    return InfiniteList<{{#pascalCase}}{{name}}{{/pascalCase}}>(
      pagingController: listProvider.pagingController,
      itemBuilder: (context, {{#camelCase}}{{name}}{{/camelCase}}, index) => {{#pascalCase}}{{name}}{{/pascalCase}}Card({{#camelCase}}{{name}}{{/camelCase}}),
      emptyText: "No {{#titleCase}}{{name}}{{/titleCase}}s",
      onRefresh: listProvider.refresh,
    );
  }
}