import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:{{project}}/core/screens/base_screen.dart';
import 'package:{{project}}/core/components/empty_placeholder.dart';
import 'package:{{project}}/feature/{{#snakeCase}}{{name}}{{/snakeCase}}/providers/{{#snakeCase}}{{name}}{{/snakeCase}}_detail_provider.dart';

class {{#pascalCase}}{{name}}{{/pascalCase}}DetailScreen extends BaseScreen {
  final String uuid;
  const {{#pascalCase}}{{name}}{{/pascalCase}}DetailScreen({
    Key? key,
    @PathParam('uuid') required this.uuid,
  }) : super(
          key: key
        );

  @override
  AppBar? appBar(BuildContext context, WidgetRef ref) {
    final {{#camelCase}}{{name}}{{/camelCase}} = ref.watch({{#camelCase}}{{name}}{{/camelCase}}DetailProvider(uuid));

    return {{#camelCase}}{{name}}{{/camelCase}}.when(
      loading: () => AppBar(
        title: const Text("{{#titleCase}}{{name}}{{/titleCase}}"),
      ),
      data: ({{#camelCase}}{{name}}{{/camelCase}}) => AppBar(
        title: Text({{#camelCase}}{{name}}{{/camelCase}}.uuid),
      ),
      error: (_, __) => AppBar(
        title: const Text("Error"),
      ),
    );
  }

  @override
  Widget body(BuildContext context, WidgetRef ref) {
    final _{{#camelCase}}{{name}}{{/camelCase}} = ref.watch({{#camelCase}}{{name}}{{/camelCase}}DetailProvider(uuid));

    return _{{#camelCase}}{{name}}{{/camelCase}}.when(
      data: ({{#camelCase}}{{name}}{{/camelCase}}) => Text({{#camelCase}}{{name}}{{/camelCase}}.uuid),
      error: (_, __) => const EmptyPlaceholder(title: "Error"),
      loading: () => const Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
