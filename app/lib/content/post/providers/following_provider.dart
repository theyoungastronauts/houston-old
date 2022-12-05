import 'dart:core';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../access/me/services/me_service.dart';
import '../../../access/user/models/user.dart';
import '../../../access/user/services/user_service.dart';
part 'following_provider.freezed.dart';

@freezed
class UserFollowingModel with _$UserFollowingModel {
  const UserFollowingModel._();

  factory UserFollowingModel({
    @Default([]) List<int> followers,
    @Default([]) List<int> following,
  }) = _UserFollowingModel;
}

final initialState = UserFollowingModel();

class FollowingProvider extends StateNotifier<UserFollowingModel> {
  final Ref ref;
  Future<void> load() async {
    final me = await MeService().retrieve();
    state = state.copyWith(followers: me.followers, following: me.following);
  }

  FollowingProvider(this.ref, UserFollowingModel model) : super(model) {
    load();
  }
  Future<bool> follow(User user, {bool willFollow = true}) async {
    final success = await UserService().follow(user, willFollow: willFollow);
    if (success) {
      load();
      return true;
    }
    return false;
  }
}

final followingProvider = StateNotifierProvider<FollowingProvider, UserFollowingModel>(
  (ref) => FollowingProvider(ref, initialState),
);
