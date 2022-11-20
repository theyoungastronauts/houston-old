import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:houston_app/core/components/base_component.dart';
import 'package:houston_app/core/components/buttons.dart';
import 'package:houston_app/feature/auth/providers/login_provider.dart';

class LoginForm extends BaseComponent {
  const LoginForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final provider = ref.read(loginFormProvider.notifier);
    final model = ref.watch(loginFormProvider);

    return Form(
      key: provider.formKey,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextFormField(
            controller: provider.emailController,
            decoration: const InputDecoration(
              label: Text("Email"),
            ),
            validator: provider.emailValidator,
          ),
          TextFormField(
            controller: provider.passwordController,
            decoration: const InputDecoration(
              label: Text("Password"),
            ),
            obscureText: true,
            validator: provider.passwordValidator,
            onFieldSubmitted: (_) {
              provider.submit();
            },
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 12.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppButton(
                  label: "Clear",
                  type: AppButtonType.Text,
                  onPressed: provider.clear,
                ),
                AppButton(
                  label: "Submit",
                  // icon: Icons.login,
                  processing: model.processing,
                  onPressed: provider.submit,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
