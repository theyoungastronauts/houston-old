import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:timeago/timeago.dart' as timeago;

import '../../../access/user/models/user.dart';
import '../../../core/providers/session_provider.dart';
import '../../post/models/post.dart';

part 'comment.freezed.dart';
part 'comment.g.dart';

@freezed
class Comment with _$Comment {
  const Comment._();

  factory Comment({
    required String uuid,
    required String body,
    required User owner,
    List<Comment>? children,
    @JsonKey(name: 'created_at') required DateTime createdAt,
  }) = _Comment;

  factory Comment.fromJson(Map<String, dynamic> json) => _$CommentFromJson(json);

  String get createdAtLabel {
    return timeago.format(createdAt);
  }

  bool canDelete(WidgetRef ref, {required Post post, Comment? parent}) {
    final user = ref.watch(sessionProvider).user;
    if (user == null) {
      return false;
    }

    if (owner.uuid == user.uuid) {
      return true;
    }

    if (parent != null && parent.owner.uuid == user.uuid) {
      return true;
    }

    if (post.owner.uuid == user.uuid) {
      return true;
    }

    return false;
  }
}
