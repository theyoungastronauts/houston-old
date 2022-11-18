import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:houston_app/core/screens/base_screen.dart';
import 'package:houston_app/feature/auth/components/login_form.dart';

class LoginScreen extends BaseScreen {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  AppBar? appBar(BuildContext context, WidgetRef ref) {
    return AppBar(
      title: const Text("Login"),
    );
  }

  @override
  Widget body(BuildContext context, WidgetRef ref) {
    return Center(
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 600),
        child: const LoginForm(),
      ),
    );
  }
}
