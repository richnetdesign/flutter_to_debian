import 'dart:io';

import 'package:flutter_to_debian/flutter_to_debian.dart';
import 'package:yaml/yaml.dart';

class Vars {
  static const List<String> allowedExecFieldCodes = [
    'f',
    'F',
    'u',
    'U',
    'i',
    'c',
    'k'
  ];

  static Future<FlutterToDebian?> parseDebianYaml({debianYaml = "debian/debian.yaml"}) async {
    File yaml = File(debianYaml);
    if (!(await yaml.exists())) {
      yaml = File(debianYaml);
    }

    if (await yaml.exists()) {
      try {
        YamlMap yamlMap = loadYaml(await yaml.readAsString());
        return FlutterToDebian.fromYaml(yamlMap);
      } catch (e) {
        rethrow;
      }
    }
    return null;
  }

  static Future<FlutterToDebian?> parsePubspecYaml() async {
    File pubspec = File("pubspec.yaml");
    if (!(await pubspec.exists())) {
      pubspec = File("pubspec.yml");
    }

    if (await pubspec.exists()) {
      try {
        YamlMap yamlMap = loadYaml(await pubspec.readAsString());
        return FlutterToDebian.fromPubspec(yamlMap);
      } catch (e) {
        rethrow;
      }
    }
    return null;
  }

  static late String pathToIcons;

  static late String pathToApplications;

  static late String pathToFinalAppLocation;

  static late String pathToDebianControl;

  static late String newDebPackageDirPath;
}
