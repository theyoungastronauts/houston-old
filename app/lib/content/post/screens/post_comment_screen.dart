import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../comment/components/comment_form.dart';
import '../../comment/components/comment_list.dart';
import '../providers/post_detail_provider.dart';
import '../../../core/components/centered_loader.dart';
import '../../../core/screens/base_screen.dart';

class PostCommentsScreen extends BaseScreen {
  final String postUuid;
  const PostCommentsScreen({
    Key? key,
    @PathParam('uuid') required this.postUuid,
  }) : super(key: key);

  @override
  AppBar? appBar(BuildContext context, WidgetRef ref) {
    final post = ref.watch(postDetailProvider(postUuid));

    return post.when(
      loading: () => AppBar(),
      error: (_, __) => AppBar(
        title: const Text("Error"),
      ),
      data: (post) {
        return AppBar(
          title: Text("Comments on ${post.title}"),
        );
      },
    );
  }

  @override
  Widget body(BuildContext context, WidgetRef ref) {
    final post = ref.watch(postDetailProvider(postUuid));

    return post.when(
      loading: () => const CenteredLoader(),
      error: (_, __) => const Text("Error"),
      data: (post) {
        return CommentList(post: post);
      },
    );
  }

  @override
  Widget? bottomNavigationBar(BuildContext context, WidgetRef ref) {
    return CommentForm(postUuid);
  }
}
