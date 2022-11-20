import 'dart:io';
import 'package:cli/models/blueprint.dart';
import 'package:yaml/yaml.dart';
import 'package:dcli/dcli.dart';

const isCompiled = String.fromEnvironment('COMPILED') == 'true';

String appName() {
  final yaml = parseYaml("${appDir()}/pubspec.yaml");

  return yaml['name'];
}

String houstonRoot() {
  if (isCompiled) {
    return pwd;
  }

  return (Directory(pwd).parent).path;
}

String cliDir() {
  return Directory("${houstonRoot()}/cli").path;
}

String appDir() {
  return Directory("${houstonRoot()}/app").path;
}

String serviceDir() {
  return Directory("${houstonRoot()}/service").path;
}

String blueprintsDir() {
  return Directory("${cliDir()}/blueprints").path;
}

String bricksDir() {
  return Directory("${cliDir()}/bricks").path;
}

String appFeatureDir() {
  return Directory("${appDir()}/lib/feature").path;
}

String formatWithUnderbars(String val) {
  return val.replaceAll(" ", "_").toLowerCase();
}

YamlMap parseYaml(String path) {
  File file = File(path);
  String yamlString = file.readAsStringSync();
  final yaml = loadYaml(yamlString);
  return yaml;
}

BluePrint parseBlueprint(String path) {
  final yaml = parseYaml(path);
  return BluePrint.fromYaml(yaml);
}
