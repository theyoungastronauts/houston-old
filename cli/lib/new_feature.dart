import 'dart:convert';
import 'dart:io';

import 'package:cli/strings.dart';
import 'package:cli/utils.dart';
import 'package:cli/validators.dart';
import 'package:dcli/dcli.dart';
import 'package:mason/mason.dart' as mason;

Future<void> newFeature() async {
  String moduleName = ask(
    "Module Name:",
    required: true,
    validator: FeatureNameValidator(),
  );
  moduleName = snakeCase(moduleName);

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

  final contents = "name: $name\nmodule: $moduleName\nproperties:";

  await setTextInFile(path: path, value: contents);
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

  if (!Directory(serviceModuleDirectory).existsSync()) {
    throw Exception(red("Module ${blueprint.module} doesn't exist yet."));
  }

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

  final urlInsert = 'path("$name/", include("api.$name.urls")),';

  await insertTextInFileAtToken(
    path: "${serviceDir()}/api/urls.py",
    token: "#::HOUSTON-INSERT-FEATURE::",
    value: urlInsert,
  );

  await insertTextInFile(
    path: "${serviceDir()}/${snakeCase(blueprint.module)}/models/__init__.py",
    value: "from .${snakeCase(blueprint.name)} import *",
  );

  await insertTextInFile(
    path: "${serviceDir()}/${snakeCase(blueprint.module)}/admin/__init__.py",
    value: "from .${snakeCase(blueprint.name)} import *",
  );

  // APP

  print(white("Generating App Feature"));

  final appParentDir = "${appModuleDirectory()}/${snakeCase(blueprint.module)}";
  if (!Directory(appParentDir).existsSync()) {
    Directory(appParentDir).createSync();
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
  await process.stdout.transform(utf8.decoder).forEach((line) => print(yellow(line)));
}
