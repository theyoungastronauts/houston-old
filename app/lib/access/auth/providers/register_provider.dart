import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../core/providers/session_provider.dart';
import '../../../core/utils/singletons.dart';
import '../../../core/utils/toast.dart';
import '../../../core/utils/validation.dart';
import '../../../navigation/app_router.gr.dart';
import '../models/token.dart';
import '../services/auth_service.dart';

part 'register_provider.freezed.dart';

@freezed
class RegisterFormModel with _$RegisterFormModel {
  const RegisterFormModel._();

  factory RegisterFormModel({
    @Default(false) bool processing,
    @Default("") String email,
    @Default("") String password,
    @Default("") String phoneNumber,
    @Default("") String name,
  }) = _RegisterFormModel;
}

final initialState = RegisterFormModel();

class RegisterFormProvider extends StateNotifier<RegisterFormModel> {
  final Ref ref;
  final GlobalKey<FormState> formKey = GlobalKey();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController nameController = TextEditingController();

  RegisterFormProvider(this.ref, RegisterFormModel model) : super(model) {
    load(model);
    _addListeners();
  }

  String? emailValidator(String? value) => formValidatorEmail(value);
  String? passwordValidator(String? value) => formValidatorNotEmpty(value, "Password");
  String? nameValidator(String? value) => formValidatorNotEmpty(value, "Name");
  String? phoneValidator(String? value) => formValidatorPhoneNumber(value);
  String? confirmPasswordValidator(String? value) {
    if (value != null && value.isEmpty) {
      return 'Confirm password required';
    }
    if (value!.trim() != passwordController.text.trim()) {
      return 'The passwords must match';
    }
    return null;
  }

  void _addListeners() {
    emailController.addListener(() {
      state = state.copyWith(email: emailController.text);
    });

    passwordController.addListener(() {
      state = state.copyWith(password: passwordController.text);
    });

    phoneController.addListener(() {
      state = state.copyWith(phoneNumber: phoneController.text);
    });

    nameController.addListener(() {
      state = state.copyWith(name: nameController.text);
    });
  }

  void clear() {
    state = initialState;
  }

  void load(RegisterFormModel register) async {
    state = register;
    emailController.text = state.email;
    passwordController.text = state.password;
    confirmPasswordController.text = state.password;
    phoneController.text = state.phoneNumber;
    nameController.text = state.name;
  }

  Future<void> submit() async {
    if (!formKey.currentState!.validate()) {
      return;
    }
    state = state.copyWith(processing: true);
    final result = await AuthService().register(email: state.email, password: state.password, name: state.name, number: state.phoneNumber);
    if (result == null) {
      Toast.error("Invalid login details");
      state = state.copyWith(processing: false);
      return;
    }
    Token? token = await AuthService().createToken(state.email, state.password);

    if (token != null) {
      ref.read(sessionProvider.notifier).setToken(token);
      singleton<AppRouter>().replace(const DashboardContainerRoute());
      state = state.copyWith(processing: false);
      return;
    }

    Toast.error();
    state = state.copyWith(processing: false);
  }
}

final registerFormProvider = StateNotifierProvider<RegisterFormProvider, RegisterFormModel>((ref) {
  return RegisterFormProvider(ref, initialState);
});
