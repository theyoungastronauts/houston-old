import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../core/providers/session_provider.dart';
import '../../../core/utils/strings.dart';

part 'user.freezed.dart';
part 'user.g.dart';

@freezed
class User with _$User {
  const User._();

  factory User({
    required String uuid,
    required int id,
    @Default("") String name,
    @Default("") String image,
    @Default("") String bio,
    @Default([]) List<int> following,
    @Default([]) List<int> followers,
    @JsonKey(name: "created_at") required DateTime createdAt,
  }) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  factory User.empty() => User(
        uuid: "",
        name: "",
        id: -12,
        createdAt: DateTime.now(),
      );

  String get initials {
    return getInitials(name);
  }

  bool isMe(WidgetRef ref) {
    final user = ref.read(sessionProvider).user;
    if (user == null) {
      return false;
    }

    return user.uuid == uuid;
  }
}
