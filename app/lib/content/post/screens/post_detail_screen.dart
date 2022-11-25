import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/components/buttons.dart';
import '../../../core/screens/base_screen.dart';
import '../../../core/utils/errors.dart';
import '../../../navigation/app_router.gr.dart';
import '../components/post_detail.dart';
import '../providers/post_detail_provider.dart';
import '../providers/post_form_provider.dart';

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
        data: (post) => post != null
            ? AppBar(
                title: Text("${post.title}${post.isDraft ? ' [Draft]' : ''}"),
                actions: [
                  if (post.isOwner(ref))
                    AppButton(
                      label: "Edit",
                      type: AppButtonType.Text,
                      onPressed: () {
                        ref.read(postFormProvider.notifier).load(post);
                        AutoRouter.of(context).push(const PostEditScreenRoute());
                      },
                    )
                ],
              )
            : appBarError(),
        error: (_, __) => appBarError());
  }

  @override
  Widget body(BuildContext context, WidgetRef ref) {
    final _post = ref.watch(postDetailProvider(uuid));

    return _post.when(
      data: (post) => post != null ? PostDetail(post) : contentError(),
      error: (_, __) => contentError(),
      loading: () => const Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
