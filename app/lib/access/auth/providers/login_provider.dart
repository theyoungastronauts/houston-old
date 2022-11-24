import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../core/providers/session_provider.dart';
import '../../../core/utils/logging.dart';
import '../../../core/utils/singletons.dart';
import '../../../core/utils/toast.dart';
import '../../../core/utils/validation.dart';
import '../services/auth_service.dart';
import '../../../navigation/app_router.gr.dart';

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
