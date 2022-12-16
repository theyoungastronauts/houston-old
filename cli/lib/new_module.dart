// ignore_for_file: constant_identifier_names

import 'dart:io';

import 'package:cli/strings.dart';
import 'package:cli/utils.dart';
import 'package:cli/validators.dart';
import 'package:dcli/dcli.dart';
import 'package:mason/mason.dart' as mason;

const SETTINGS_APP_INSERT_TOKEN = '#::HOUSTON-INSERT-MODULE::';

Future<void> newModule([String? name]) async {
  name ??= ask(
    "Module Name:",
    required: true,
    validator: FeatureNameValidator(),
  );

  name = snakeCase(name);

  if (["navigation", "media", "core"].contains(name)) {
    print(red("Module `$name` is a reserved module name."));
    return;
  }

  if (["admin", "api", "bitpack", "connect", "data", "project", "static", "venv", "houston"].contains(name)) {
    print(red("Module `$name` is an module name."));
    return;
  }

  String serviceParentDir = serviceDir();
  final serviceGeneratedPath = "$serviceParentDir/${snakeCase(name)}";

  if (Directory(serviceGeneratedPath).existsSync()) {
    print(red("Module already exists."));
    return;
  }

  print(white("Generating service module"));

  print(bricksDir());

  final serviceModuleBrick = mason.Brick.path("${bricksDir()}/service/module");
  final serviceModuleGenerator = await mason.MasonGenerator.fromBrick(serviceModuleBrick);
  final serviceModuleTarget = mason.DirectoryGeneratorTarget(Directory(serviceParentDir));

  final vars = {
    'name': name,
  };
  await serviceModuleGenerator.generate(serviceModuleTarget, vars: vars);

  print(green("$name service module generated in $serviceGeneratedPath"));

  print(white("Adding Service Module to settings/apps.py"));

  await insertTextInFileAtToken(
    path: "${serviceDir()}/project/settings/apps.py",
    token: SETTINGS_APP_INSERT_TOKEN,
    value: '"${snakeCase(name)}.apps.${pascalCase(name)}Config",',
  );

  // APP
  final dir = "${appModuleDirectory()}/${snakeCase(name)}";
  if (!Directory(dir).existsSync()) {
    Directory(dir).createSync();
    print(green("Created App Module directory at $dir"));
  }
}
