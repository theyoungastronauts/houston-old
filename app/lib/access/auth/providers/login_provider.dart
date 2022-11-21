import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:houston_app/core/providers/session_provider.dart';
import 'package:houston_app/core/utils/logging.dart';
import 'package:houston_app/core/utils/singletons.dart';
import 'package:houston_app/core/utils/toast.dart';
import 'package:houston_app/core/utils/validation.dart';
import 'package:houston_app/access/auth/services/auth_service.dart';
import 'package:houston_app/navigation/app_router.gr.dart';

part 'login_provider.freezed.dart';

@freezed
class LoginFormModel with _$LoginFormModel {
  const LoginFormModel._();

  factory LoginFormModel({
    @Default(false) bool processing,
    @Default("") String email,
    @Default("") String password,
  }) = _LoginFormModel;
}

final initialState = LoginFormModel();

class LoginFormProvider extends StateNotifier<LoginFormModel> {
  final Ref ref;
  final GlobalKey<FormState> formKey = GlobalKey();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  LoginFormProvider(this.ref, LoginFormModel model) : super(model) {
    init();
  }

  String? emailValidator(String? value) => formValidatorEmail(value);
  String? passwordValidator(String? value) => formValidatorNotEmpty(value, "Password");

  void init() {
    emailController.text = state.email;
    passwordController.text = state.password;
  }

  void clear() {
    state = initialState;
    init();
  }

  Future<void> submit() async {
    if (!formKey.currentState!.validate()) {
      return;
    }

    state = state.copyWith(processing: true);
    final result = await AuthService().login(email: emailController.text, password: passwordController.text);
    if (result == null) {
      Toast.error("Invalid login details");
      state = state.copyWith(processing: false);
      return;
    }

    if (result.twoFa) {
      //TODO: handle two factor
      singleton<Log>().warn("2fa not implemented yet");
      state = state.copyWith(processing: false);
      return;
    }

    if (result.token != null) {
      ref.read(sessionProvider.notifier).setToken(result.token!);
      singleton<AppRouter>().replace(const DashboardContainerRoute());
      state = state.copyWith(processing: false);
      return;
    }

    Toast.error();
    state = state.copyWith(processing: false);
  }
}

final loginFormProvider = StateNotifierProvider<LoginFormProvider, LoginFormModel>((ref) {
  return LoginFormProvider(ref, initialState);
});
