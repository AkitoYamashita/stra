import 'package:flutter/services.dart';
import 'package:yaml/yaml.dart';

mixin WithYml {
  Future<YamlMap> loadYml(String path) async {
    final configString = await rootBundle.loadString(path);
    final config = loadYaml(configString) as YamlMap;
    return config;
  }
}
