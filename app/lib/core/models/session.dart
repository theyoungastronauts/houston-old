import 'package:freezed_annotation/freezed_annotation.dart';

import '../../access/auth/models/token.dart';
import '../../access/me/models/me_user.dart';
import '../../access/user/models/user.dart';
import '../../content/post/models/post.dart';

part 'session.freezed.dart';

@freezed
class Session with _$Session {
  const Session._();

  factory Session({
    Token? token,
    MeUser? user,
    @Default(false) ready,
  }) = _Session;

  bool get isAuthenticated {
    return user != null;
  }

  List<int> get likes => user != null ? user!.likes : [];

  bool postIsLiked(Post post) {
    return likes.contains(post.id);
  }

  List<int> get following => user != null ? user!.following : [];
  List<int> get followers => user != null ? user!.followers : [];

  bool isFollowing(User user) {
    return following.contains(user.id);
  }

  bool isFollowedBy(User user) {
    return followers.contains(user.id);
  }
}
