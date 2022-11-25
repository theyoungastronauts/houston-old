import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../access/user/models/user.dart';
import '../../../core/providers/session_provider.dart';
import '../../../core/utils/image.dart';
import '../../../core/utils/strings.dart';

part 'post.freezed.dart';
part 'post.g.dart';

@freezed
class Post with _$Post {
  const Post._();

  factory Post({
    required String uuid,
    required String title,
    required User owner,
    @Default("") String body,
    @JsonKey(name: 'num_assets') @Default(0) int numAssets,
    @Default([]) List<String> assets,
    @JsonKey(name: "created_at") required DateTime createdAt,
    @JsonKey(name: 'is_published') required bool isPublished,
  }) = _Post;

  factory Post.fromJson(Map<String, dynamic> json) => _$PostFromJson(json);

  factory Post.empty([User? owner]) => Post(
        uuid: "",
        title: "",
        owner: owner ?? User.empty(),
        createdAt: DateTime.now(),
        isPublished: false,
      );

  String thumbnail({double width = 300, double height = 300}) {
    if (assets.isNotEmpty) {
      return ImageUrlBuilder.resize(assets.first, width: width, height: height);
    }

    return "https://placekitten.com/${width.round()}/${height.round()}";
  }

  String excerpt({int length = 64, String ommission = "..."}) {
    return truncate(body, length: length, omission: ommission);
  }

  bool get exists {
    return uuid.isNotEmpty;
  }

  bool get isDraft {
    return exists && !isPublished;
  }

  bool get canUnpublish {
    return exists && isPublished;
  }

  bool isOwner(WidgetRef ref) {
    final user = ref.read(sessionProvider).user;
    if (user == null) {
      return false;
    }

    return user.id == owner.id;
  }
}
