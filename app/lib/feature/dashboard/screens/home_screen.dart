import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:houston_app/core/screens/base_screen.dart';

class HomeScreen extends BaseScreen {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget body(BuildContext context, WidgetRef ref) {
    return Text("hi");
  }
}
