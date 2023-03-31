import 'stra_platform_interface.dart';
import 'dart:developer' as developer;

class Stra {
  Future<String?> getPlatformVersion() {
    return StraPlatform.instance.getPlatformVersion();
  }

  void _testStra() {
    developer.log("STRA");
  }

  void initialize() {
    _testStra();
  }
}
