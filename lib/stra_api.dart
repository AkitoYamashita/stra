import 'dart:developer' as developer;
import 'package:stra/thirdparty/font_awesome.dart';
import 'package:stra/thirdparty/svg.dart';
import 'package:stra/thirdparty/yml.dart';
import 'package:stra/utils/io.dart';
import 'package:stra/utils/io_interface.dart';

import 'stra_platform_interface.dart';

class StraApi with Yml, Svg, FontAwesome, Io implements IoInterface {
  /// StraAPIコンストラクタ
  StraApi() {
    developer.log('STRA_API_CONSTRUCTOR');
  }

  /// 初期化処理
  void initialize() {
    developer.log('STRA_API_INITIALIZE');
  }

  /// ログのテスト
  void testLog() {
    developer.log('STRA');
  }

  /// プラットフォームバージョン（MethodCall）
  Future<String?> getPlatformVersion() {
    return StraPlatform.instance.getPlatformVersion();
  }
}
