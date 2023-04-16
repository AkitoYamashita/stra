import 'package:stra/utils/io_interface.dart';
import 'package:yaml/yaml.dart';

mixin Yml implements IoInterface {
  /// 引数のyamlパスと
  /// `parent.child.item`のようなdot区切りの形式で指定された文字列を元に
  /// 値を文字列として取得し返す
  Future<String> getStrByYml(String assetPath, String target) async {
    return getStringByYmlText(await loadText(assetPath), target);
  }

  /// 引数のアセットパスからyamlを読み込み
  /// YamlMap(package:yaml/yaml)形式で返す
  Future<YamlMap> loadYml(String assetPath) async {
    final text = await loadText(assetPath);
    final yamlMap = loadYaml(text) as YamlMap;
    return yamlMap;
  }

  /// 引数のyaml文字列と
  /// `parent.child.item`のようなdot区切りの形式で指定された文字列を元に
  /// 値を文字列として取得し返す
  String getStringByYmlText(String ymlTxt, String target) {
    final yamlMap = loadYaml(ymlTxt) as YamlMap;
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
