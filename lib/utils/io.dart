import 'package:flutter/services.dart';
import 'package:stra/utils/io_interface.dart';

mixin Io implements IoInterface {
  @override
  Future<String> loadText(String path) async {
    final text = await rootBundle.loadString(path);
    return text;
  }
}
