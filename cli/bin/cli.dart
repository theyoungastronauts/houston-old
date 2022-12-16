#! /usr/bin/env dcli

import 'dart:io';
import 'package:cli/new_feature.dart';
import 'package:cli/new_module.dart';
import 'package:dcli/dcli.dart';
// import 'package:dcli/src/shell/'

Future<void> main(List<String> args) async {
  // newModule('media');
  generateFeature("video_game");
  return;

  // Loop, asking for user input and evaluating it
  for (;;) {
    final line = ask('${green('houston')}${blue('::')}');
    if (line.isNotEmpty) {
      await evaluate(line);
    }
  }
}

Future<void> evaluate(String command) async {
  final parts = command.split(' ');
  switch (parts[0]) {
    case 'new_module':
      await newModule();
      break;
    case 'new_feature':
      await newFeature();
      break;
    case 'generate_feature':
      await generateFeature();
      break;
    case 'cd':
      Directory.current = join(pwd, parts[1]);
      break;
    case 'exit':
      // dcliExit(0);
      break;
    default:
      if (which(parts[0]).found) {
        command.start(nothrow: true, progress: Progress.print());
      } else {
        print(red('Unknown command: ${parts[0]}'));
      }
      break;
  }
}
