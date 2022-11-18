import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:houston_app/core/components/buttons.dart';
import 'package:houston_app/core/screens/base_screen.dart';
import 'package:houston_app/core/components/empty_placeholder.dart';
import 'package:houston_app/feature/navigation/app_router.gr.dart';
import 'package:houston_app/feature/post/components/post_detail.dart';
import 'package:houston_app/feature/post/providers/post_detail_provider.dart';
import 'package:houston_app/feature/post/providers/post_form_provider.dart';
import 'package:houston_app/feature/post/screens/post_edit_screen.dart';

class PostDetailScreen extends BaseScreen {
  final String uuid;
  const PostDetailScreen({
    Key? key,
    @PathParam('uuid') required this.uuid,
  }) : super(key: key);

  @override
  AppBar? appBar(BuildContext context, WidgetRef ref) {
    final data = ref.watch(postDetailProvider(uuid));

    return data.when(
      loading: () => AppBar(
        title: const Text("Post"),
      ),
      data: (post) => AppBar(
        title: Text(post.title),
        actions: [
          AppButton(
            label: "Edit",
            type: AppButtonType.Text,
            onPressed: () {
              ref.read(postFormProvider.notifier).load(post);
              AutoRouter.of(context).push(const PostCreateScreenRoute());
            },
          )
        ],
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
      data: (post) => PostDetail(post),
      error: (_, __) => const EmptyPlaceholder(title: "Error"),
      loading: () => const Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
