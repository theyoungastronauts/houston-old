import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:houston_app/core/components/base_component.dart';
import 'package:houston_app/access/user/models/user.dart';

class UserProfile extends BaseComponent {
  final User user;
  const UserProfile(this.user, {Key? key}) : super(key: key);

  @override
  Widget body(BuildContext context, WidgetRef ref) {
    return Container();
  }
}
