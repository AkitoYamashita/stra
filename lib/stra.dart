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
