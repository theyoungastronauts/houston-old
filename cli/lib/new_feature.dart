import 'dart:convert';
import 'dart:io';

import 'package:cli/strings.dart';
import 'package:cli/utils.dart';
import 'package:cli/validators.dart';
import 'package:dcli/dcli.dart';
import 'package:mason/mason.dart' as mason;

void newFeature() {
  String name = ask(
    "Feature Name:",
    required: true,
    validator: FeatureNameValidator(),
  );

  name = formatWithUnderbars(name);

  final dir = blueprintsDir();
  final path = "$dir/$name.yaml";

  if (File(path).existsSync()) {
    return print(red('Blueprint already exists.'));
  }

  File(path).createSync();
}

Future<void> generateFeature([String? name]) async {
  name ??= ask(
    "Feature Name:",
    required: true,
    validator: FeatureNameValidator(),
  );

  name = formatWithUnderbars(name);

  final dir = blueprintsDir();
  final path = "$dir/$name.yaml";

  if (!File(path).existsSync()) {
    return print(red('Feature $name not found.'));
  }
  final blueprint = parseBlueprint(path);

  String parentDir = appFeatureDir();

  if (blueprint.module != 'root') {
    parentDir = "${appFeatureDir()}/${snakeCase(blueprint.module)}";
    if (!Directory(parentDir).existsSync()) {
      Directory(parentDir).createSync();
    }
  }

  final generatePath = "$parentDir/$name";

  // if (Directory(generatePath).existsSync()) {
  //   return print(red('Feature already generated in $generatePath.\nRemove this folder first if you want to regenerate.'));
  // }

  final appBrick = mason.Brick.path("${bricksDir()}/app/feature");

  final generator = await mason.MasonGenerator.fromBrick(appBrick);
  final target = mason.DirectoryGeneratorTarget(Directory(parentDir));
  await generator.generate(
    target,
    vars: blueprint.serialize(),
  );

  print(green("$name generated in $generatePath"));
  final args = "flutter packages pub run build_runner build --delete-conflicting-outputs".split(" ");
  print(white("Running generate function in flutter project..."));
  final process = await Process.start("fvm", args, workingDirectory: appDir());
  process.stdout.transform(utf8.decoder).forEach((line) => print(yellow(line)));
}
