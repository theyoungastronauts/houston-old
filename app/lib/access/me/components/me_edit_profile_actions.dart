import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/components/base_component.dart';
import '../../../core/components/buttons.dart';
import '../../../core/utils/toast.dart';
import '../providers/me_profile_form_provider.dart';

class ProfileEditFormActions extends BaseComponent {
  const ProfileEditFormActions({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final MeProfileFormProvider provider = ref.read(meProfileFormProvider.notifier);
    return Container(
      color: Colors.black38,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            AppButton(
              label: "Discard",
              type: AppButtonType.Text,
              onPressed: () async {
                if (await provider.discard()) Navigator.of(context).pop();
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
    );
  }
}
