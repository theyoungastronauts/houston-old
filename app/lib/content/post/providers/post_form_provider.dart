import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:share_plus/share_plus.dart';

import '../../../core/providers/global_loading_provider.dart';
import '../../../core/providers/session_provider.dart';
import '../../../core/utils/dialogs.dart';
import '../../../core/utils/env.dart';
import '../../../core/utils/toast.dart';
import '../../../core/utils/validation.dart';
import '../models/post.dart';
import '../services/post_service.dart';
import 'post_detail_provider.dart';
import 'post_list_provider.dart';

class PostFormProvider extends StateNotifier<Post> {
  final Ref ref;

  final GlobalKey<FormState> formKey = GlobalKey();
  final TextEditingController titleController = TextEditingController();
  final TextEditingController bodyController = TextEditingController();
  bool changesMade = false;

  PostFormProvider(this.ref, Post model) : super(model) {
    load(state);
    _addListeners();
  }

  void _addListeners() {
    titleController.addListener(() {
      changesMade = true;
      state = state.copyWith(title: titleController.text);
    });

    bodyController.addListener(() {
      changesMade = true;
      state = state.copyWith(body: bodyController.text);
    });
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

  void load(Post post) async {
    state = post;
    changesMade = false;
    titleController.text = state.title;
    bodyController.text = state.body;
  }

  String? titleValidator(String? value) => formValidatorNotEmpty(value, "Title");
  String? bodyValidator(String? value) => formValidatorNotEmpty(value, "Body");

  Future<bool> discard() async {
    if (changesMade) {
      final confirmed = await ConfirmDialog.show(title: "Are you sure you want to discard all unsaved changes?");

      if (confirmed != true) {
        return false;
      }
    }
    clear();
    return true;
  }

  void clear() {
    state = Post.empty(ref.read(sessionProvider).user?.asUser());
    titleController.text = '';
    bodyController.text = '';
  }

  Future<void> share(Post post) async {
    final uuid = post.uuid;
    final url = "${Env.appBaseUrl}/#/share/p/$uuid";

    await Share.share(url, subject: 'Share the link to this post');
  }

  Future<void> delete(Post post, {Function? onDelete}) async {
    final confirmed = await ConfirmDialog.show(
      title: 'Are you sure you want to delete this post?',
      destructive: true,
    );
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

  Future<bool?> submit({bool shouldPublish = false}) async {
    if (shouldPublish && !formKey.currentState!.validate()) {
      return null;
    }

    state = state.copyWith(isPublished: shouldPublish);

    if (!shouldPublish) {
      if (state.title.isEmpty) {
        state = state.copyWith(title: "Untitled");
      }
    }

    ref.read(globalLoadingProvider.notifier).start();

    final post = await PostService().save(state);

    if (post != null) {
      state = post;
      ref.read(postListProvider(PostListType.all).notifier).refresh();
      ref.read(postListProvider(PostListType.me).notifier).refresh();
      ref.invalidate(postDetailProvider(post.uuid));
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
