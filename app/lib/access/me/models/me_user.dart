import 'package:freezed_annotation/freezed_annotation.dart';

import '../../user/models/user.dart';

part 'me_user.freezed.dart';
part 'me_user.g.dart';

@freezed
class MeUser with _$MeUser {
  const MeUser._();

  factory MeUser({
    required String uuid,
    @Default("") String name,
    @Default("") String image,
    @Default("") String bio,
    @JsonKey(name: "liked_posts") required List<int> likes,
    @JsonKey(name: "created_at") required DateTime createdAt,
  }) = _MeUser;

  factory MeUser.fromJson(Map<String, dynamic> json) => _$MeUserFromJson(json);

  User asUser() {
    return User(uuid: uuid, createdAt: createdAt, image: image, name: name);
  }
}
