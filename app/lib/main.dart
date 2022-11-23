import 'dart:io';

import 'package:desktop_window/desktop_window.dart';
import 'package:flutter/foundation.dart';
import 'package:houston_app/core/app.dart';
import 'package:houston_app/core/utils/env.dart';
import 'package:houston_app/core/utils/singletons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

const MIN_WIDTH = 1200.0;
const MIN_HEIGHT = 800.0;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Env.init();
  await initSingletons();
  if (!kIsWeb && Platform.isMacOS) {
    await DesktopWindow.setWindowSize(const Size(MIN_WIDTH, MIN_HEIGHT));
    await DesktopWindow.setMinWindowSize(const Size(MIN_WIDTH, MIN_HEIGHT));
  }

  runApp(
    Phoenix(
      child: const RootRestorationScope(
        restorationId: "root",
        child: ProviderScope(child: App()),
      ),
    ),
  );
}
