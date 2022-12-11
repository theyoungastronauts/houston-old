import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/components/base_component.dart';
import '../../../core/components/buttons.dart';
import '../providers/register_provider.dart';

class RegisterForm extends BaseComponent {
  const RegisterForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final provider = ref.read(registerFormProvider.notifier);
    final model = ref.watch(registerFormProvider);

    return Form(
      key: provider.formKey,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextFormField(
              controller: provider.nameController,
              decoration: const InputDecoration(
                label: Text("Username"),
              ),
              validator: provider.nameValidator),
          TextFormField(
            keyboardType: TextInputType.phone,
            controller: provider.phoneController,
            decoration: const InputDecoration(
              label: Text("Phone"),
            ),
            validator: provider.phoneValidator,
          ),
          TextFormField(
            keyboardType: TextInputType.emailAddress,
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
          ),
          TextFormField(
            controller: provider.confirmPasswordController,
            decoration: const InputDecoration(
              label: Text("Confirm Password"),
            ),
            obscureText: true,
            validator: provider.confirmPasswordValidator,
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
