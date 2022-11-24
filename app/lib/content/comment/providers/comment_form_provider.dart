import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:houston_app/content/comment/models/comment.dart';
import 'package:houston_app/content/comment/models/new_comment.dart';
import 'package:houston_app/content/comment/providers/comment_list_provider.dart';
import 'package:houston_app/content/comment/services/comment_service.dart';
import 'package:houston_app/core/utils/toast.dart';
import 'package:houston_app/core/utils/validation.dart';

class CommentFormProvider extends StateNotifier<NewComment> {
  final Ref ref;
  late final String postUuid;

  final GlobalKey<FormState> formKey = GlobalKey();
  final TextEditingController bodyController = TextEditingController();
  final FocusNode focusNode = FocusNode();

  CommentFormProvider(this.ref, NewComment model) : super(model) {
    postUuid = model.postUuid;
  }

  String? bodyValidator(String? value) => formValidatorNotEmpty(value, "Body");

  void setParent(Comment? comment, [String? mention]) {
    state = state.copyWith(parent: comment);

    if (mention != null) {
      bodyController.text = "@$mention ${bodyController.text}";
    }
  }

  void updateModel() {
    state = state.copyWith(
      body: bodyController.text,
    );
  }

  void clear() {
    state = NewComment(postUuid: postUuid, body: '', parent: null);
    bodyController.clear();
  }

  Future<void> submit() async {
    if (!formKey.currentState!.validate()) {
      return;
    }

    final comment = await CommentService().create(state);
    if (comment == null) {
      Toast.error();
      return;
    }

    clear();
    ref.read(commentListProvider(postUuid).notifier).refresh();
  }

  Future<bool> delete(Comment comment) async {
    final success = await CommentService().delete(comment);
    if (success) {
      ref.read(commentListProvider(postUuid).notifier).refresh();
      return true;
    }
    return false;
  }
}

final commentFormProvider = StateNotifierProvider.family<CommentFormProvider, NewComment, String>((ref, postUuid) {
  return CommentFormProvider(ref, NewComment(postUuid: postUuid, body: ''));
});
