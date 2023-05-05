import 'dart:io';

import 'package:flutter/foundation.dart';

mixin Pf {
  String getPlatformName() {
    /// kIsWeb:true環境の場合、Platformを使うと処理が止まる
    if (kIsWeb) {
      return 'web';
    } else {
      if (Platform.isAndroid) {
        return 'android';
      } else if (Platform.isIOS) {
        return 'ios';
      } else if (Platform.isWindows) {
        return 'windows';
      } else if (Platform.isMacOS) {
        return 'macos';
      } else if (Platform.isLinux) {
        return 'linux';
      } else {
        return Platform.operatingSystem.toLowerCase();
      }
    }
  }

  bool isWeb() {
    return kIsWeb;
  }

  bool isAndroid() {
    return !kIsWeb && Platform.isAndroid;
  }

  bool isIOS() {
    return !kIsWeb && Platform.isIOS;
  }

  bool isWindows() {
    return !kIsWeb && Platform.isWindows;
  }

  bool isMacOS() {
    return !kIsWeb && Platform.isMacOS;
  }

  bool isLinux() {
    return !kIsWeb && Platform.isLinux;
  }
}
