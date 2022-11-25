import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/providers/global_loading_provider.dart';
import '../../../core/providers/session_provider.dart';
import '../../../core/utils/dialogs.dart';
import '../../../core/utils/validation.dart';
import '../models/post.dart';
import 'post_detail_provider.dart';
import 'post_list_provider.dart';
import '../services/post_service.dart';
import 'package:share_plus/share_plus.dart';

import '../../../core/utils/env.dart';
import '../../../core/utils/toast.dart';

class PostFormProvider extends StateNotifier<Post> {
  final Ref ref;

  final GlobalKey<FormState> formKey = GlobalKey();
  final TextEditingController titleController = TextEditingController();
  final TextEditingController bodyController = TextEditingController();
  bool changesMade = false;

  PostFormProvider(this.ref, Post model) : super(model) {
    init();
  }

  void init() {
    load(state);
  }

  void addAsset(String url) {
    changesMade = true;

    state = state.copyWith(assets: [...state.assets, url]);
  }

  void updateAsset(int index, String url) {
    changesMade = true;

    state = state.copyWith(
      assets: [...state.assets]
        ..removeAt(index)
        ..insert(index, url),
    );
  }

  void removeAsset(int index) {
    changesMade = true;
    state = state.copyWith(assets: [...state.assets]..removeAt(index));
  }

  void load(Post post) {
    state = post;
    changesMade = false;
    titleController.text = post.title;
    bodyController.text = post.body;
  }

  void updateModel({bool isDraft = false}) {
    changesMade = true;
    state = state.copyWith(title: titleController.text, body: bodyController.text, isPublished: !isDraft);
  }

  String? titleValidator(String? value) => formValidatorNotEmpty(value, "Title");
  String? bodyValidator(String? value) => formValidatorNotEmpty(value, "Body");

  Future<bool> discard() async {
    if (changesMade) {
      final confirmed = await ConfirmDialog.show(title: 'Sure you want to discard the changes you\'ve made?');
      if (confirmed) {
        clear();
        return true;
      } else {
        return false;
      }
    }
    clear();
    return true;
  }

  void clear() {
    state = Post.empty(ref.read(sessionProvider).user?.asUser());
    init();
  }

  Future<void> share(Post post) async {
    final uuid = post.uuid;
    final url = "${Env.appBaseUrl}/#/share/p/$uuid";

    await Share.share(url, subject: 'Share the link to this post');
  }

  Future<void> delete(Post post, {Function? onDelete}) async {
    final confirmed = await ConfirmDialog.show(title: 'Are you sure you want to delete this post?', destructive: true);
    ref.read(globalLoadingProvider.notifier).start();

    if (confirmed != null && confirmed) {
      final success = await PostService().delete(post);
      ref.read(postListProvider(PostListType.all).notifier).refresh();
      ref.read(postListProvider(PostListType.me).notifier).refresh();
      if (success) {
        Toast.message('Post deleted');
        if (onDelete != null) onDelete.call();
      } else {
        Toast.error();
      }
    }
    ref.read(globalLoadingProvider.notifier).complete();
  }

  Future<bool?> submit({bool isDraft = false}) async {
    if (!formKey.currentState!.validate()) {
      return null;
    }

    updateModel(isDraft: isDraft);

    ref.read(globalLoadingProvider.notifier).start();

    final post = await PostService().save(state);

    if (post != null) {
      state = post;
      ref.read(postListProvider(PostListType.all).notifier).refresh();
      ref.read(postListProvider(PostListType.me).notifier).refresh();
      ref.invalidate(postDetailProvider(post.uuid));
      clear();
      ref.read(globalLoadingProvider.notifier).complete();
      return true;
    }

    ref.read(globalLoadingProvider.notifier).complete();
    return false;
  }
}

final postFormProvider = StateNotifierProvider<PostFormProvider, Post>((ref) {
  return PostFormProvider(
    ref,
    Post.empty(ref.read(sessionProvider).user?.asUser()),
  );
});
