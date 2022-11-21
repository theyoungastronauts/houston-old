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

  name = snakeCase(name);

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

  name = snakeCase(name);

  final dir = blueprintsDir();
  final path = "$dir/$name.yaml";

  if (!File(path).existsSync()) {
    return print(red('Feature $name not found.'));
  }
  final blueprint = parseBlueprint(path);

  // if (Directory(generatePath).existsSync()) {
  //   return print(red('Feature already generated in $generatePath.\nRemove this folder first if you want to regenerate.'));
  // }

  print(white("Generating Service Feature"));

  String serviceModuleDirectory = "${serviceDir()}/${snakeCase(blueprint.module)}";
  final serviceFeatureBrick = mason.Brick.path("${bricksDir()}/service/feature");
  final serviceFeatureGenerator = await mason.MasonGenerator.fromBrick(serviceFeatureBrick);
  final serviceFeatureTarget = mason.DirectoryGeneratorTarget(Directory(serviceModuleDirectory));
  await serviceFeatureGenerator.generate(
    serviceFeatureTarget,
    vars: blueprint.serialize(),
  );

  print(green("$name service feature generated in $serviceModuleDirectory"));

  print(white("Generating Service API"));

  String serviceApiParentDir = serviceApiDir();

  final serviceApiGeneratedPath = "$serviceApiParentDir/$name";

  final serviceApiBrick = mason.Brick.path("${bricksDir()}/service/api/feature");
  final serviceApiGenerator = await mason.MasonGenerator.fromBrick(serviceApiBrick);
  final serviceApiTarget = mason.DirectoryGeneratorTarget(Directory(serviceApiParentDir));

  await serviceApiGenerator.generate(
    serviceApiTarget,
    vars: blueprint.serialize(),
  );

  print(green("$name service api generated in $serviceApiGeneratedPath"));

  // APP

  print(white("Generating App Feature"));
  String appParentDir = appFeatureDir();

  if (blueprint.module != 'root') {
    appParentDir = "${appFeatureDir()}/${snakeCase(blueprint.module)}";
    if (!Directory(appParentDir).existsSync()) {
      Directory(appParentDir).createSync();
    }
  }

  final appGeneratedPath = "$appParentDir/$name";

  final appBrick = mason.Brick.path("${bricksDir()}/app/feature");

  final appGenerator = await mason.MasonGenerator.fromBrick(appBrick);
  final appTarget = mason.DirectoryGeneratorTarget(Directory(appParentDir));
  await appGenerator.generate(
    appTarget,
    vars: blueprint.serialize(),
  );

  print(green("$name app generated in $appGeneratedPath"));
  final args = "flutter packages pub run build_runner build --delete-conflicting-outputs".split(" ");

  print(white("Running generate function in flutter project..."));
  final process = await Process.start("fvm", args, workingDirectory: appDir());
  process.stdout.transform(utf8.decoder).forEach((line) => print(yellow(line)));
}
