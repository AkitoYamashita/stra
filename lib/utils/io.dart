import "package:flutter/services.dart";
import "package:stra/utils/io_interface.dart";

mixin Io implements IoInterface {
  @override
  Future<String> loadText(String assetPath) async {
    final text = await rootBundle.loadString(assetPath);
    return text;
  }
}
