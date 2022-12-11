import 'package:freezed_annotation/freezed_annotation.dart';
import 'comment.dart';

part 'new_comment.freezed.dart';

@freezed
class NewComment with _$NewComment {
  const NewComment._();

  factory NewComment({
    required String postUuid,
    required String body,
    Comment? parent,
  }) = _NewComment;
}
