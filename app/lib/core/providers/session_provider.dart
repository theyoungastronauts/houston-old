import 'dart:async';
import 'dart:convert';

import 'package:auto_route/auto_route.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../app.dart';
import '../models/session.dart';
import '../utils/dialogs.dart';
import '../utils/singletons.dart';
import '../utils/storage.dart';
import '../../access/auth/models/token.dart';
import '../../access/auth/services/auth_service.dart';
import '../../access/me/models/me_user.dart';
import '../../access/me/services/me_service.dart';
import '../../navigation/app_router.gr.dart';

class SessionProvider extends StateNotifier<Session> {
  final Ref ref;
  Timer? refreshTimer;

  SessionProvider(this.ref, Session model) : super(model) {
    init();
  }

  Future<void> init() async {
    final tokenString = singleton<Storage>().getString(Storage.AUTH_TOKEN_KEY);

    if (tokenString != null) {
      final token = Token.fromJson(jsonDecode(tokenString));

      if (token.accessTokenIsExpired()) {
        if (!token.refreshTokenIsExpired()) {
          final refreshedToken = await refreshToken(token);
          if (refreshedToken != null) {
            await setToken(refreshedToken);
            state = state.copyWith(ready: true);
            singleton<AppRouter>().replace(const DashboardContainerRoute());
            return;
          }
        }
      } else {
        await setToken(token);
        state = state.copyWith(ready: true);
        singleton<AppRouter>().replace(const DashboardContainerRoute());

        return;
      }
    }

    state = state.copyWith(ready: true);
  }

  Future<void> setToken(Token token) async {
    singleton<Storage>().setString(Storage.AUTH_TOKEN_KEY, token.toJson());

    final user = await MeService().retrieve();

    state = state.copyWith(
      token: token,
      user: user,
      ready: true,
    );

    int secondsUntilExpiry = token.secondsUntilExpiry();

    if (refreshTimer != null) {
      refreshTimer!.cancel();
    }

    refreshTimer = Timer(Duration(seconds: secondsUntilExpiry), () async {
      final refreshedToken = await refreshToken(token);
      if (refreshedToken != null) {
        setToken(refreshedToken);
      }
    });
  }

  void setMe(MeUser me) {
    state = state.copyWith(user: me);
  }

  Future<Token?> refreshToken(Token token) async {
    return await AuthService().refresh(token.refresh);
  }

  Future<void> logout([bool withConfirm = false]) async {
    if (withConfirm) {
      bool confirmed = await ConfirmDialog.show(
        title: "Logout",
        body: "Are you sure you want to logout?",
        destructive: true,
        confirmText: "Logout",
        cancelText: "Cancel",
      );

      if (confirmed != true) {
        return;
      }
    }

    state = state.copyWith(
      ready: true,
      user: null,
      token: null,
    );

    state = Session();

    await singleton<Storage>().clear();
    await init();

    final context = rootNavigatorKey.currentContext!;
    AutoRouter.of(context).popUntilRoot();
    AutoRouter.of(context).replace(const LandingScreenRoute());

    Phoenix.rebirth(context);
  }
}

final sessionProvider = StateNotifierProvider<SessionProvider, Session>(
  (ref) => SessionProvider(ref, Session()),
);
