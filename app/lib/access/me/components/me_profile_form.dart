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
                  decoration: const InputDecoration(label: Text("Name")),
                ),
                ReplaceAsset(
                  initialUrl: me.image,
                  onChange: (url) {
                    provider.setImage(url);
                  },
                  onRemove: () {
                    provider.setImage(null);
                  },
                ),
                TextFormField(
                  controller: provider.bioController,
                  decoration: const InputDecoration(label: Text("Bio")),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
