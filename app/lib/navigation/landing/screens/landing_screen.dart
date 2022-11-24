import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/components/buttons.dart';
import '../../../core/screens/base_screen.dart';
import '../../app_router.gr.dart';

class LandingScreen extends BaseScreen {
  const LandingScreen({Key? key})
      : super(
          key: key,
          includeMainDrawer: true,
        );

  @override
  AppBar? appBar(BuildContext context, WidgetRef ref) {
    return AppBar(
      title: const Text("Welcome"),
    );
  }

  @override
  Widget body(BuildContext context, WidgetRef ref) {
    return Center(
      child: SizedBox(
        height: 100,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            AppButton(
              label: "Login",
              onPressed: () {
                AutoRouter.of(context).push(const LoginScreenRoute());
              },
            ),
            AppButton(
              label: "Register",
              onPressed: () {},
            ),
            AppButton(
              label: "Continue as guest",
              type: AppButtonType.Text,
              onPressed: () {
                AutoRouter.of(context).push(const DashboardContainerRoute());
              },
            ),
          ],
        ),
      ),
    );
  }
}
