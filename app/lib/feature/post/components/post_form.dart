import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:houston_app/core/components/base_component.dart';
import 'package:houston_app/core/components/buttons.dart';
import 'package:houston_app/core/utils/toast.dart';
import 'package:houston_app/feature/post/providers/post_form_provider.dart';

class PostForm extends BaseComponent {
  const PostForm({Key? key}) : super(key: key);

  @override
  Widget body(BuildContext context, WidgetRef ref) {
    final provider = ref.read(postFormProvider.notifier);
    final post = ref.watch(postFormProvider);

    return Form(
      key: provider.formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextFormField(
                  controller: provider.titleController,
                  validator: provider.titleValidator,
                  onChanged: (_) {
                    provider.updateModel();
                  },
                  decoration: const InputDecoration(label: Text("Title")),
                ),
              ],
            ),
          ),
          Container(
            color: Colors.black38,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AppButton(
                    label: "Discard",
                    type: AppButtonType.Text,
                    onPressed: () {
                      AutoRouter.of(context).pop();
                    },
                  ),
                  AppButton(
                    label: post.exists ? "Save" : "Publish",
                    onPressed: () async {
                      final success = await provider.submit();

                      if (success == null) {
                        return;
                      }

                      if (success) {
                        AutoRouter.of(context).pop();
                        Toast.message("Published!");
                      } else {
                        Toast.error();
                      }
                    },
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
