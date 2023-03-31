
import 'stra_platform_interface.dart';

class Stra {
  Future<String?> getPlatformVersion() {
    return StraPlatform.instance.getPlatformVersion();
  }
}
