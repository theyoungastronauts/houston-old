// ignore_for_file: constant_identifier_names

import 'dart:io';

import 'package:cli/strings.dart';
import 'package:cli/utils.dart';
import 'package:cli/validators.dart';
import 'package:dcli/dcli.dart';
import 'package:mason/mason.dart' as mason;

const SETTINGS_APP_INSERT_TOKEN = '#::HOUSTON-INSERT-MODULE::';

void newModule([String? name]) async {
  name ??= ask(
    "Module Name:",
    required: true,
    validator: FeatureNameValidator(),
  );
  name = snakeCase(name);
  String serviceParentDir = serviceDir();
  final serviceGeneratedPath = "$serviceParentDir/${snakeCase(name)}";

  if (Directory(serviceGeneratedPath).existsSync()) {
    print(orange("Module already exists. Delete before continuing"));
    return;
  }

  print(white("Generating service module"));

  final serviceModuleBrick = mason.Brick.path("${bricksDir()}/service/module");
  final serviceModuleGenerator = await mason.MasonGenerator.fromBrick(serviceModuleBrick);
  final serviceModuleTarget = mason.DirectoryGeneratorTarget(Directory(serviceParentDir));

  final vars = {
    'name': name,
  };
  await serviceModuleGenerator.generate(serviceModuleTarget, vars: vars);

  print(green("$name service module generated in $serviceGeneratedPath"));

  print(white("Adding Service Module to settings/apps.py"));

  await insertTextInFile(
    path: "${serviceDir()}/project/settings/apps.py",
    token: SETTINGS_APP_INSERT_TOKEN,
    value: '"${snakeCase(name)}.apps.${pascalCase(name)}Config",',
  );
}
