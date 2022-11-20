#! /usr/bin/env dcli

import 'dart:io';
import 'package:cli/new_feature.dart';
import 'package:dcli/dcli.dart';
// import 'package:dcli/src/shell/'

void main(List<String> args) {
  // generateFeature("video");
  // return;

  // Loop, asking for user input and evaluating it
  for (;;) {
    final line = ask('${green('houston')}${blue('::')}');
    if (line.isNotEmpty) {
      evaluate(line);
    }
  }
}

void evaluate(String command) {
  final parts = command.split(' ');
  switch (parts[0]) {
    case 'new_feature':
      newFeature();
      break;
    case 'generate_feature':
      generateFeature();
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
