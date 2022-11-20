import 'dart:io';
import 'package:cli/models/blueprint.dart';
import 'package:yaml/yaml.dart';
import 'package:dcli/dcli.dart';

String appName() {
  final yaml = parseYaml("${appDir()}/pubspec.yaml");

  return yaml['name'];
}

String cliBaseDir() {
  return pwd;
}

String blueprintsDir() {
  return Directory("${cliBaseDir()}/blueprints").path;
}

String bricksDir() {
  return Directory("${cliBaseDir()}/bricks").path;
}

String baseDir() {
  final dir = pwd;
  return (Directory(dir).parent).path;
}

String appDir() {
  return Directory("${baseDir()}/app").path;
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
