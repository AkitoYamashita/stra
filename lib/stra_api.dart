import 'dart:developer' as developer;
import 'stra_platform_interface.dart';

class StraApi {
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
