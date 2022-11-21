import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:houston_app/core/providers/global_loading_provider.dart';
import 'package:houston_app/core/providers/session_provider.dart';
import 'package:houston_app/core/utils/validation.dart';
import 'package:houston_app/content/post/models/post.dart';
import 'package:houston_app/content/post/providers/post_detail_provider.dart';
import 'package:houston_app/content/post/providers/post_list_provider.dart';
import 'package:houston_app/content/post/services/post_service.dart';

class PostFormProvider extends StateNotifier<Post> {
  final Ref ref;

  final GlobalKey<FormState> formKey = GlobalKey();
  final TextEditingController titleController = TextEditingController();
  final TextEditingController bodyController = TextEditingController();

  PostFormProvider(this.ref, Post model) : super(model) {
    init();
  }

  void init() {
    load(state);
  }

  void changeImage(String url, {int index = -1}) {
    if (index == -1) {
      final newAssets = state.assets + [url];
      state = state.copyWith(assets: newAssets);
      return;
    }
    var newAssets = [...state.assets];
    newAssets[index] = url;
    state = state.copyWith(assets: newAssets);
  }

  void removeImage(int index) {
    var newAssets = [...state.assets];
    newAssets.removeAt(index);
    state = state.copyWith(assets: newAssets);
  }

  void load(Post post) {
    state = post;
    titleController.text = post.title;
    bodyController.text = post.body;
  }

  void updateModel() {
    state = state.copyWith(
      title: titleController.text,
      body: bodyController.text,
    );
  }

  String? titleValidator(String? value) => formValidatorNotEmpty(value, "Title");
  String? bodyValidator(String? value) => formValidatorNotEmpty(value, "Body");

  void clear() {
    state = Post.empty(ref.read(sessionProvider).user?.asUser());
    init();
  }

  Future<bool?> submit() async {
    if (!formKey.currentState!.validate()) {
      return null;
    }

    updateModel();

    ref.read(globalLoadingProvider.notifier).start();

    final post = await PostService().save(state);

    if (post != null) {
      state = post;
      ref.read(postListProvider.notifier).refresh();
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
