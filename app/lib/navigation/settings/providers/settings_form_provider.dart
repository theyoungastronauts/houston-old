import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SettingsFormProvider extends StateNotifier<dynamic> {
  final Ref ref;

  final GlobalKey<FormState> formKey = GlobalKey();

  SettingsFormProvider(this.ref, dynamic model) : super(model) {
    init();
  }

  void init() {
    load(state);
  }

  void load(dynamic model) {
    state = model;
  }

  void updateModel() {
    state = state.copyWith();
  }

  void clear() {
    state = {};
    init();
  }

  Future<bool?> submit() async {
    if (!formKey.currentState!.validate()) {
      return null;
    }

    return true;
  }
}

final settingsFormProvider = StateNotifierProvider<SettingsFormProvider, dynamic>((ref) {
  return SettingsFormProvider(ref, {});
});
