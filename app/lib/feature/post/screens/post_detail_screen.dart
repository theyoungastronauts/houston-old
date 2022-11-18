import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:houston_app/core/screens/base_screen.dart';
import 'package:houston_app/core/components/empty_placeholder.dart';
import 'package:houston_app/feature/post/providers/post_detail_provider.dart';

class PostDetailScreen extends BaseScreen {
  final String uuid;
  const PostDetailScreen({
    Key? key,
    @PathParam('uuid') required this.uuid,
  }) : super(
          key: key
        );

  @override
  AppBar? appBar(BuildContext context, WidgetRef ref) {
    final post = ref.watch(postDetailProvider(uuid));

    return post.when(
      loading: () => AppBar(
        title: const Text("Post"),
      ),
      data: (post) => AppBar(
        title: Text(post.uuid),
      ),
      error: (_, __) => AppBar(
        title: const Text("Error"),
      ),
    );
  }

  @override
  Widget body(BuildContext context, WidgetRef ref) {
    final _post = ref.watch(postDetailProvider(uuid));

    return _post.when(
      data: (post) => Text(post.uuid),
      error: (_, __) => const EmptyPlaceholder(title: "Error"),
      loading: () => const Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
