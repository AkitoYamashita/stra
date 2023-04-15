import 'package:flutter/services.dart';

mixin Io {
  Future<String> loadText(String path) async {
    final text = await rootBundle.loadString(path);
    return text;
  }
}
