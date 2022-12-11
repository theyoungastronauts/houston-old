import 'token.dart';

class LoginResult {
  final Token? token;
  final bool twoFa;

  const LoginResult({this.token, this.twoFa = false});
}
