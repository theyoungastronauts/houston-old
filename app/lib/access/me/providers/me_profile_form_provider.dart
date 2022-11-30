import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/providers/global_loading_provider.dart';
import '../../../core/providers/session_provider.dart';
import '../../../core/utils/dialogs.dart';
import '../../../core/utils/image.dart';
import '../../../core/utils/validation.dart';
import '../models/me_user.dart';
import '../services/me_service.dart';
import 'me_provider.dart';

class MeProfileFormProvider extends StateNotifier<MeUser> {
  final Ref ref;

  final GlobalKey<FormState> formKey = GlobalKey();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController bioController = TextEditingController();
  bool changesMade = false;

  MeProfileFormProvider(this.ref, dynamic model) : super(model) {
    load(state);
    _addListeners();
  }

  void _addListeners() {
    nameController.addListener(() {
      changesMade = true;
      state = state.copyWith(name: nameController.text);
    });

    bioController.addListener(() {
      changesMade = true;
      state = state.copyWith(bio: bioController.text);
    });
  }

  Future<bool> discard() async {
    if (changesMade) {
      final confirmed = await ConfirmDialog.show(title: "Are you sure you want to discard all unsaved changes?");

      if (confirmed != true) {
        return false;
      }
    }
    load(ref.read(sessionProvider).user!);
    changesMade = false;
    return true;
  }

  void load(MeUser me) {
    state = me;
    nameController.text = me.name;
    bioController.text = me.bio;
  }

  String? nameValidator(String? value) => formValidatorNotEmpty(value, "Name");

  void setImage(String? url) {
    changesMade = true;
    state = state.copyWith(image: url ?? "");
  }

  void clear(MeUser me) {
    state = me;
    nameController.text = '';
    bioController.text = '';
  }

  Future<bool?> submit() async {
    if (!formKey.currentState!.validate()) {
      return null;
    }

    ref.read(globalLoadingProvider.notifier).start();
    final me = await MeService().update({
      'name': state.name,
      'bio': state.bio,
      'image': ImageUrlBuilder.stripTransforms(state.image),
    });

    if (me != null) {
      state = me;
      ref.invalidate(meProvider);
      ref.read(sessionProvider.notifier).setMe(me);
      ref.read(globalLoadingProvider.notifier).complete();
      return true;
    }

    ref.read(globalLoadingProvider.notifier).complete();

    return false;
  }
}

final meProfileFormProvider = StateNotifierProvider<MeProfileFormProvider, MeUser>((ref) {
  return MeProfileFormProvider(ref, ref.read(sessionProvider).user);
});
