import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:houston_app/feature/user/models/user.dart';
import 'package:houston_app/core/components/base_component.dart';

class UserCard extends BaseComponent {
  final User user;
  const UserCard(this.user, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Card(
      child: Text(user.uuid),
    );
  }
}
