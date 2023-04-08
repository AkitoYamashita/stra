import 'dart:developer' as developer;
import 'package:stra/thirdparty/font_awesome.dart';
import 'package:stra/thirdparty/svg.dart';
import 'package:stra/thirdparty/yml.dart';

import 'stra_platform_interface.dart';

class StraApi with WithYml, WithSvg, WithFontAwesome {
  StraApi() {
    developer.log('STRA_CONSTRUCTOR');
  }

  void initialize() {
    testLog();
  }

  void testLog() {
    developer.log('STRA');
  }

  /// MethodCall
  Future<String?> getPlatformVersion() {
    return StraPlatform.instance.getPlatformVersion();
  }
}
