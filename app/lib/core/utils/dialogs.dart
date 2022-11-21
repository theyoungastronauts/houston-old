import 'package:flutter/material.dart';
import 'package:houston_app/core/app.dart';
import 'package:houston_app/core/theme/theme.dart';

class InfoDialog {
  static show({
    required String title,
    String? body,
    Widget? content,
    String? closeText,
  }) async {
    final context = rootNavigatorKey.currentContext!;

    return await showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(6.0),
            ),
          ),
          title: Text(title),
          content: body != null ? Text(body) : content,
          actions: [
            TextButton(
              style: TextButton.styleFrom(
                textStyle: const TextStyle(fontWeight: FontWeight.bold),
              ),
              onPressed: () {
                Navigator.of(context).pop(true);
              },
              child: Text(closeText ?? "Close"),
            )
          ],
        );
      },
    );
  }
}

class ConfirmDialog {
  static show({
    required String title,
    Widget? content,
    String? body,
    String? cancelText,
    String? confirmText,
    bool destructive = false,
  }) async {
    final context = rootNavigatorKey.currentContext!;

    return await showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(12.0))),
          title: Text(title),
          content: body != null ? Text(body) : content,
          actions: [
            TextButton(
              style: TextButton.styleFrom(
                foregroundColor: Theme.of(context).colorScheme.primaryButtonBg.withOpacity(0.8),
                textStyle: const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              onPressed: () {
                Navigator.of(context).pop(false);
              },
              child: Text(
                cancelText ?? "Cancel",
              ),
            ),
            TextButton(
              style: TextButton.styleFrom(
                foregroundColor: destructive ? Theme.of(context).colorScheme.danger : Theme.of(context).colorScheme.primaryButtonBg,
                textStyle: const TextStyle(fontWeight: FontWeight.bold),
              ),
              onPressed: () {
                Navigator.of(context).pop(true);
              },
              child: Text(confirmText ?? "Yes"),
            )
          ],
        );
      },
    );
  }
}

class PromptModal {
  static Future<List<String>?> show({
    required String title,
    required String? Function(String?) validator,
    required String labelText,
    bool obscureText = false,
    String? cancelText,
    String? confirmText,
    String initialValue = "",
    bool destructive = false,
    bool seconaryInput = false,
    String secondaryLabel = "",
    String secondaryInitialValue = "",
    bool secondaryObscureText = false,
    Function(String?)? secondaryValidator,
    Function(List<String>)? onValidSubmission,
  }) async {
    final context = rootNavigatorKey.currentContext!;

    final GlobalKey<FormState> _formKey = GlobalKey();

    final TextEditingController _controller = TextEditingController(text: initialValue);

    final TextEditingController _secondaryController = TextEditingController(text: secondaryInitialValue);

    return await showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(6.0),
            ),
          ),
          title: Text(title),
          content: Form(
            key: _formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextFormField(
                  controller: _controller,
                  obscureText: obscureText,
                  autofocus: true,
                  decoration: InputDecoration(
                    label: Text(
                      labelText,
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                    focusedBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.white70,
                      ),
                    ),
                  ),
                  validator: validator,
                ),
                if (seconaryInput)
                  TextFormField(
                    controller: _secondaryController,
                    obscureText: secondaryObscureText,
                    decoration: InputDecoration(
                      label: Text(secondaryLabel),
                      focusedBorder: const UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.white70,
                        ),
                      ),
                    ),
                    validator: (String? value) {
                      if (secondaryValidator == null) return null;
                      return secondaryValidator(value);
                    },
                  ),
              ],
            ),
          ),
          actions: [
            TextButton(
              style: TextButton.styleFrom(
                foregroundColor: Theme.of(context).colorScheme.primaryButtonBg.withOpacity(0.8),
                textStyle: const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              onPressed: () {
                Navigator.of(context).pop(null);
              },
              child: Text(cancelText ?? "Cancel"),
            ),
            TextButton(
              style: TextButton.styleFrom(
                foregroundColor: destructive ? Theme.of(context).colorScheme.danger : Theme.of(context).colorScheme.primaryButtonBg,
                textStyle: const TextStyle(fontWeight: FontWeight.bold),
              ),
              onPressed: () {
                if (!_formKey.currentState!.validate()) return;

                final value = seconaryInput ? [_controller.value.text, _secondaryController.value.text] : [_controller.value.text];

                if (onValidSubmission != null) {
                  onValidSubmission(value);
                  return;
                }

                Navigator.of(context).pop(value.isNotEmpty ? value : null);
              },
              child: Text(confirmText ?? "Submit"),
            )
          ],
        );
      },
    );
  }
}
