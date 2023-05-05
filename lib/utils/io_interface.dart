/// package:yaml/yamlでimplementsするためIoInterfaceとして切り出す
mixin IoInterface {
  /// 引数のアセットパスを元にファイルから文字列読み込みを行いテキストとして返す
  Future<String> loadText(String assetPath);
}
