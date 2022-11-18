import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:houston_app/feature/user/models/user.dart';

part 'authenticated_user.freezed.dart';
part 'authenticated_user.g.dart';

@freezed
class AuthenticatedUser with _$AuthenticatedUser {
  const AuthenticatedUser._();

  factory AuthenticatedUser({
    required int id,
    required String uuid,
    @Default("") String name,
    @Default("") String image,
    @JsonKey(name: "created_at") required DateTime createdAt,
  }) = _AuthenticatedUser;

  factory AuthenticatedUser.fromJson(Map<String, dynamic> json) => _$AuthenticatedUserFromJson(json);

  User asUser() {
    return User(
      id: id,
      uuid: uuid,
      createdAt: createdAt,
      image: image,
      name: name,
    );
  }
}
