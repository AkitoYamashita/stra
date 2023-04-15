import 'package:stra/utils/io_interface.dart';
import 'package:yaml/yaml.dart';

mixin Yml implements IoInterface {
  Future<YamlMap> loadYml(String path) async {
    final text = await loadText(path);
    final yamlMap = loadYaml(text) as YamlMap;
    return yamlMap;
  }

  String getStringByYamlString(String yamlString, String target) {
    final yamlMap = loadYaml(yamlString) as YamlMap;
    var result = '';
    final keys = target.split('.');
    var elm = yamlMap;
    for (final key in keys) {
      if (elm.containsKey(key)) {
        if (key == keys.last) {
          result = elm[key].toString();
        } else {
          elm = elm[key] as YamlMap;
        }
      } else {
        break;
      }
    }
    return result;
  }
}
