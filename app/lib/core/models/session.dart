import 'package:houston_app/feature/auth/models/token.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:houston_app/feature/user/models/authenticated_user.dart';
import 'package:houston_app/feature/user/models/user.dart';

part 'session.freezed.dart';

@freezed
class Session with _$Session {
  const Session._();

  factory Session({
    Token? token,
    AuthenticatedUser? user,
    @Default(false) ready,
  }) = _Session;
}