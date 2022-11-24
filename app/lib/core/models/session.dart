import '../../access/auth/models/token.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import '../../access/me/models/me_user.dart';

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
}
