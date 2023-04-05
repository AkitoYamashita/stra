import 'dart:developer' as developer;
import 'package:stra/thirdparty/yml.dart';

import 'stra_platform_interface.dart';

class StraApi with WithYml {
  void initialize() {
    testLog();
  }

  void testLog() {
    developer.log("STRA");
  }

  /// MethodCall
  Future<String?> getPlatformVersion() {
    return StraPlatform.instance.getPlatformVersion();
  }
}
