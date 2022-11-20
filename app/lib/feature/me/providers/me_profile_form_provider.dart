import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:houston_app/core/providers/global_loading_provider.dart';
import 'package:houston_app/core/providers/session_provider.dart';
import 'package:houston_app/core/utils/image.dart';
import 'package:houston_app/core/utils/validation.dart';
import 'package:houston_app/feature/asset/models/asset.dart';
import 'package:houston_app/feature/me/models/me_user.dart';
import 'package:houston_app/feature/me/providers/me_provider.dart';
import 'package:houston_app/feature/me/services/me_service.dart';

class MeProfileFormProvider extends StateNotifier<MeUser> {
  final Ref ref;

  final GlobalKey<FormState> formKey = GlobalKey();
  final TextEditingController nameController = TextEditingController();

  MeProfileFormProvider(this.ref, dynamic model) : super(model) {
    init();
  }

  void init() {
    load(state);
  }

  void load(MeUser me) {
    state = me;
    nameController.text = me.name;
  }

  void updateModel() {
    state = state.copyWith(name: nameController.text);
  }

  String? nameValidator(String? value) => formValidatorNotEmpty(value, "Name");

  void setImage(String? url) {
    state = state.copyWith(image: url ?? "");
  }

  void clear(MeUser me) {
    state = me;
    init();
  }

  Future<bool?> submit() async {
    if (!formKey.currentState!.validate()) {
      return null;
    }

    updateModel();
    ref.read(globalLoadingProvider.notifier).start();
    final me = await MeService().update({
      'name': state.name,
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
