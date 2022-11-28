import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/screens/base_screen.dart';
import '../components/me_edit_profile_actions.dart';
import '../components/me_profile_form.dart';

class MeProfileEditScreen extends BaseScreen {
  const MeProfileEditScreen({Key? key})
      : super(
          key: key,
          verticalPadding: 0,
          horizontalPadding: 0,
        );

  @override
  Widget? bottomNavigationBar(BuildContext context, WidgetRef ref) {
    return const ProfileEditFormActions();
  }

  @override
  AppBar? appBar(BuildContext context, WidgetRef ref) {
    return AppBar(
      title: const Text("Editing My Profile"),
    );
  }

  @override
  Widget body(BuildContext context, WidgetRef ref) {
    return const MeProfileForm();
  }
}
