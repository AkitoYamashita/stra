import 'dart:developer';
import 'package:flutter/foundation.dart';
import 'package:stra/stra.dart';
import 'package:stra/stra_platform_interface.dart';
import 'package:stra/thirdparty/font_awesome.dart';
import 'package:stra/thirdparty/svg.dart';
import 'package:stra/thirdparty/yml.dart';
import 'package:stra/utils/io.dart';
import 'package:stra/utils/io_interface.dart';

class StraApi with Yml, Svg, FontAwesome, Io implements IoInterface {
  /// StraAPIコンストラクタ
  StraApi() {
    log('STRA_API_CONSTRUCTOR');
  }

  /// 初期化処理
  void initialize() {
    Stra.debug = !kReleaseMode;
    Stra.debugTagName = 'STRA';
    log('STRA_API_INITIALIZE');
    Stra.log('Environment:${kReleaseMode ? 'RELEASE' : 'DEBUG'}');
    Stra.log('Platform:${Stra.platformName()}');
  }

  /// ログのテスト
  void testLog() {
    log('STRA');
  }

  /// プラットフォームバージョン（MethodCall）
  Future<String?> getPlatformVersion() {
    return StraPlatform.instance.getPlatformVersion();
  }
}
