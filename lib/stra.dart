import 'package:flutter/widgets.dart';
import 'package:stra/widgets/stra_text.dart';

import 'stra_platform_interface.dart';
import 'dart:developer' as developer;

class Stra {
  Future<String?> getPlatformVersion() {
    return StraPlatform.instance.getPlatformVersion();
  }

  void initialize() {
    testLog();
  }

  void testLog() {
    developer.log("STRA");
  }
}
