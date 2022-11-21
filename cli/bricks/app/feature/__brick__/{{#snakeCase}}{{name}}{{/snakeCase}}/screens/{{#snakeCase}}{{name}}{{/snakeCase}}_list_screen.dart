import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:{{project}}/core/screens/base_screen.dart';
import 'package:{{project}}/{{#snakeCase}}{{module}}{{/snakeCase}}/{{#snakeCase}}{{name}}{{/snakeCase}}/components/{{#snakeCase}}{{name}}{{/snakeCase}}_list.dart';

class {{#pascalCase}}{{name}}{{/pascalCase}}ListScreen extends BaseScreen {
  const {{#pascalCase}}{{name}}{{/pascalCase}}ListScreen({Key? key})
      : super(key: key);

  @override
  AppBar? appBar(BuildContext context, WidgetRef ref) {
    return AppBar(
      title: const Text("{{#titleCase}}{{name}}{{/titleCase}} List"),
      actions: const [],
    );
  }

  @override
  Widget body(BuildContext context, WidgetRef ref) {
    return const {{#pascalCase}}{{name}}{{/pascalCase}}List();
  }
}
