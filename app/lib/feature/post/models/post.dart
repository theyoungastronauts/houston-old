import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:houston_app/core/utils/strings.dart';
import 'package:houston_app/feature/user/models/user.dart';

part 'post.freezed.dart';
part 'post.g.dart';

@freezed
class Post with _$Post {
  const Post._();

  factory Post({
    required int id,
    required String uuid,
    required String title,
    required User owner,
    @Default("") String body,
    @JsonKey(name: 'num_assets') @Default(0) int numAssets,
    @Default([]) List<String> assets,
    @JsonKey(name: "created_at") required DateTime createdAt,
  }) = _Post;

  factory Post.fromJson(Map<String, dynamic> json) => _$PostFromJson(json);

  factory Post.empty([User? owner]) => Post(
        id: 0,
        uuid: "",
        title: "",
        owner: owner ?? User.empty(),
        createdAt: DateTime.now(),
      );

  String thumbnail({double width = 300, double height = 300}) {
    if (assets.isNotEmpty) {
      return assets.first;
    }

    return "https://placekitten.com/${width.round()}/${height.round()}";
  }

  String excerpt({int length = 64, String ommission = "..."}) {
    return truncate(body, length: length, omission: ommission);
  }

  bool get exists {
    return id > 0;
  }
}
