import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:houston_app/core/utils/strings.dart';

part 'user.freezed.dart';
part 'user.g.dart';

@freezed
class User with _$User {
  const User._();

  factory User({
    required int id,
    required String uuid,
    @Default("") String name,
    @Default("") String image,
    @JsonKey(name: "created_at") required DateTime createdAt,
  }) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  String get initials {
    return getInitials(name);
  }
}
