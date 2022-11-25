import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/components/base_component.dart';
import '../../../core/components/buttons.dart';
import '../../../core/utils/toast.dart';
import '../../../media/asset/components/replace_asset.dart';
import '../providers/me_profile_form_provider.dart';

class MeProfileForm extends BaseComponent {
  const MeProfileForm({Key? key}) : super(key: key);

  @override
  Widget body(BuildContext context, WidgetRef ref) {
    final provider = ref.read(meProfileFormProvider.notifier);
    final me = ref.watch(meProfileFormProvider);

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
                  controller: provider.nameController,
                  validator: provider.nameValidator,
                  onChanged: (_) {
                    provider.updateModel();
                  },
                  decoration: const InputDecoration(label: Text("Title")),
                ),
                ReplaceAsset(
                  initialUrl: me.image,
                  onChange: (url) {
                    provider.setImage(url);
                  },
                  onRemove: () {
                    provider.setImage(null);
                  },
                )
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
                      Navigator.of(context).pop();
                    },
                  ),
                  AppButton(
                    label: "Save",
                    onPressed: () async {
                      final success = await provider.submit();

                      if (success == null) {
                        return;
                      }

                      if (success) {
                        Navigator.of(context).pop();
                        Toast.message("Updated!");
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
