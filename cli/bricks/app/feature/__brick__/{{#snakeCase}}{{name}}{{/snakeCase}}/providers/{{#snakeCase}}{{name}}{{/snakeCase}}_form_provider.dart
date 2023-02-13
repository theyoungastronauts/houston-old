import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/utils/dialogs.dart';
import '../../../core/utils/toast.dart';
import '../../../core/utils/validation.dart';

import '../../../core/providers/global_loading_provider.dart';
import '../models/{{#snakeCase}}{{name}}{{/snakeCase}}.dart';
import '../services/{{#snakeCase}}{{name}}{{/snakeCase}}_service.dart';
import '{{#snakeCase}}{{name}}{{/snakeCase}}_detail_provider.dart';
import '{{#snakeCase}}{{name}}{{/snakeCase}}_list_provider.dart';

class {{#pascalCase}}{{name}}{{/pascalCase}}FormProvider extends StateNotifier<{{#pascalCase}}{{name}}{{/pascalCase}}> {

  final Ref ref;
  final GlobalKey<FormState> formKey = GlobalKey();
  bool changesMade = false;

  {{#appFormControllers}}{{{.}}}
  {{/appFormControllers}}
  {{#pascalCase}}{{name}}{{/pascalCase}}FormProvider(this.ref, {{#pascalCase}}{{name}}{{/pascalCase}} model) : super(model) {
    load(state);
    _addListeners();
  }

  void _addListeners() {
    {{#appFormControllerListeners}}{{{.}}}
    {{/appFormControllerListeners}}
  }

  void load({{#pascalCase}}{{name}}{{/pascalCase}} {{#camelCase}}{{name}}{{/camelCase}}) async {
    state = {{#camelCase}}{{name}}{{/camelCase}};
    changesMade = false;
    {{#appFormSetters}}{{{.}}}
    {{/appFormSetters}}
  }

  {{#appFormValidators}}{{{.}}}
  {{/appFormValidators}}

  Future<bool> discard() async {
    if (changesMade) {
      final confirmed = await ConfirmDialog.show(title: "Are you sure you want to discard all unsaved changes?");

      if (confirmed != true) {
        return false;
      }
    }
    clear();
    return true;
  }

  void clear() {
    state = {{#pascalCase}}{{name}}{{/pascalCase}}.empty();
    {{#appFormClearers}}{{{.}}}
    {{/appFormClearers}}
  }

  Future<void> delete({{#pascalCase}}{{name}}{{/pascalCase}} {{#camelCase}}{{name}}{{/camelCase}}, {Function? onDelete}) async {
    final confirmed = await ConfirmDialog.show(
      title: 'Are you sure you want to delete this {{#titleCase}}{{name}}{{/titleCase}}?',
      destructive: true,
    );

    if (confirmed == true) {

      ref.read(globalLoadingProvider.notifier).start();
      final success = await {{#pascalCase}}{{name}}{{/pascalCase}}Service().delete({{#camelCase}}{{name}}{{/camelCase}});
      ref.read(globalLoadingProvider.notifier).complete();

      if (success) {
        ref.read({{#camelCase}}{{name}}{{/camelCase}}ListProvider.notifier).refresh();
        Toast.message("{{#titleCase}}{{name}}{{/titleCase}} deleted");
        if (onDelete != null) onDelete.call();

      } else {
        Toast.error();
      }
      
    }
  }

  Future<bool?> submit() async {
    if (!formKey.currentState!.validate()) {
      return null;
    }

    ref.read(globalLoadingProvider.notifier).start();
    final {{#camelCase}}{{name}}{{/camelCase}} = await {{#pascalCase}}{{name}}{{/pascalCase}}Service().save(state);

    if ({{#camelCase}}{{name}}{{/camelCase}} != null) {
      state = {{#camelCase}}{{name}}{{/camelCase}};
      ref.read({{#camelCase}}{{name}}{{/camelCase}}ListProvider.notifier).refresh();
      ref.invalidate({{#camelCase}}{{name}}{{/camelCase}}DetailProvider({{#camelCase}}{{name}}{{/camelCase}}.uuid));
      ref.read(globalLoadingProvider.notifier).complete();
      return true;
    }

    ref.read(globalLoadingProvider.notifier).complete();
    return false;
  }
  
}

final {{#camelCase}}{{name}}{{/camelCase}}FormProvider = StateNotifierProvider<{{#pascalCase}}{{name}}{{/pascalCase}}FormProvider, {{#pascalCase}}{{name}}{{/pascalCase}}>((ref) {
  return {{#pascalCase}}{{name}}{{/pascalCase}}FormProvider(
    ref,
    {{#pascalCase}}{{name}}{{/pascalCase}}.empty(),
  );
});