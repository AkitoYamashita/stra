import 'package:flutter/services.dart';
import 'package:yaml/yaml.dart';

mixin WithYml {
  Future<Map<dynamic, dynamic>> loadYml(String path) async {
    final String configString = await rootBundle.loadString(path);
    final Map<dynamic, dynamic> config = loadYaml(configString);
    return config;
  }
}
