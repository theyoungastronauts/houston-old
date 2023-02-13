import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/components/base_component.dart';
import '../providers/{{#snakeCase}}{{name}}{{/snakeCase}}_form_provider.dart';


class {{#pascalCase}}{{name}}{{/pascalCase}}Form extends BaseComponent {
  const {{#pascalCase}}{{name}}{{/pascalCase}}Form({Key? key}) : super(key: key);

  @override
  Widget body(BuildContext context, WidgetRef ref) {
    final provider = ref.read({{#camelCase}}{{name}}{{/camelCase}}FormProvider.notifier);
    final {{#camelCase}}{{name}}{{/camelCase}} = ref.watch({{#camelCase}}{{name}}{{/camelCase}}FormProvider);


    return SingleChildScrollView(
      child: Form(
        key: provider.formKey,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              {{#appFormInputs}}{{{.}}}
              {{/appFormInputs}}
            ]
          ),
        ),
      ),
    );
  }
}