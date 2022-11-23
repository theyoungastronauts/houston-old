import 'package:houston_app/core/app.dart';
import 'package:houston_app/core/utils/env.dart';
import 'package:houston_app/core/utils/screen.dart';
import 'package:houston_app/core/utils/singletons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Env.init();
  await initSingletons();
  await ScreenUtils.setWindowConstraints();

  runApp(
    Phoenix(
      child: const RootRestorationScope(
        restorationId: "root",
        child: ProviderScope(child: App()),
      ),
    ),
  );
}
