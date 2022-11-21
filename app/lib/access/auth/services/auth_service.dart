import 'package:houston_app/core/services/base_service.dart';
import 'package:houston_app/core/utils/logging.dart';
import 'package:houston_app/core/utils/singletons.dart';
import 'package:houston_app/access/auth/models/login_result.dart';
import 'package:houston_app/access/auth/models/token.dart';
import 'package:houston_app/access/user/models/user.dart';

class AuthService extends BaseService {
  static const basePath = '/auth';

  Future<LoginResult?> login({
    required String email,
    String? otpCode,
    String? password,
  }) async {
    if (otpCode == null && password == null) {
      return null;
    }

    final Map<String, dynamic> params = {
      'email': email,
      ...otpCode != null ? {'otp': otpCode} : {},
      ...password != null ? {'password': password} : {},
    };

    try {
      final response = await postHttp('$basePath/token', params: params, auth: false);

      if (response.keys.contains("is_2fa_enabled") && response['is_2fa_enabled'] == true) {
        return const LoginResult(twoFa: true);
      }

      final token = Token.fromJson(response);
      return LoginResult(token: token);
    } catch (e) {
      return null;
    }
  }

  Future<bool> validateLoginCredentials({
    required String email,
    required String password,
  }) async {
    final Map<String, dynamic> params = {
      'email': email,
      'password': password,
    };

    try {
      await postHttp('$basePath/token', params: params, auth: false);
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<User?> register({
    required String email,
    required String username,
    required String password,
    required String language,
  }) async {
    final params = {
      'email': email,
      'password': password,
      'username': username,
      'language': language,
    };

    try {
      final data = await postHttp('$basePath/register', params: params, auth: false);

      return User.fromJson(data);
    } catch (e) {
      return null;
    }
  }

  Future<Token?> refresh(String refreshToken) async {
    final params = {
      'refresh': refreshToken,
    };

    try {
      final response = await postHttp('$basePath/token/refresh', params: params, auth: false);
      return Token.fromJson(response);
    } catch (e) {
      return null;
    }
  }

  Future<bool> emailAvailable(String email) async {
    try {
      final data = await getHttp('$basePath/email-validate', params: {'email': email}, auth: false);
      if (data.containsKey('email')) {
        return false;
      }
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<bool> usernameAvailable(String username) async {
    try {
      final data = await getHttp('$basePath/username-validate', params: {'username': username}, auth: false);
      if (data.containsKey('username')) {
        return false;
      }
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<bool> requestPasswordReset({String? email, String? username}) async {
    if (email == null && username == null) {
      return false;
    }

    try {
      final params = email != null ? {'email': email} : {'username': username};
      await postHttp('$basePath/password-reset', params: params, auth: false);
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<bool> changePassword({
    required String oldPassword,
    required String newPassword,
  }) async {
    try {
      final params = {
        'old_password': oldPassword,
        'new_password': newPassword,
      };

      await postHttp('$basePath/password/change', params: params);
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<bool> changeEmail({
    required String email,
  }) async {
    try {
      final params = {
        'email': email,
      };

      await postHttp('$basePath/email/change', params: params);
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<bool> completeEmailChange({
    required String token,
  }) async {
    final params = {
      'token': token,
    };
    try {
      await postHttp('$basePath/email/change/complete/', params: params);
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<bool> changePhoneNumber({
    required String phoneNumber,
  }) async {
    try {
      final params = {
        'phone_number': phoneNumber,
      };

      await postHttp('$basePath/phone-number/change', params: params);
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<LoginResult?> socialLogin(String token, String backend) async {
    try {
      final params = {'token': token};
      final data = await postHttp('$basePath/token/exchange/$backend', params: params);
      return LoginResult(token: Token.fromJson(data));
    } catch (e, st) {
      singleton<Log>().error("socialLogin Error", e, st);
      return null;
    }
  }

  Future<bool> validateRecoverAccountPayload(String uuid, String token) async {
    try {
      await postHttp(
        '$basePath/password-reset/validate',
        params: {
          'uuid': uuid,
          'token': token,
        },
        auth: false,
      );

      return true;
    } catch (e) {
      return false;
    }
  }

  Future<bool> recoverAccount(String uuid, String token, String password) async {
    try {
      await postHttp(
        '$basePath/password-reset/confirm',
        params: {
          'uuid': uuid,
          'token': token,
          'password': password,
        },
        auth: false,
      );

      return true;
    } catch (e) {
      return false;
    }
  }

  Future<bool> confirmAccount(String uuid, String token) async {
    try {
      await postHttp(
        '$basePath/email-confirmation/confirm',
        params: {
          'uuid': uuid,
          'token': token,
        },
        auth: false,
      );

      return true;
    } catch (e) {
      return false;
    }
  }
}
