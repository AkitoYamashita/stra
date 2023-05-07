import 'dart:ui';

import 'package:flutter/material.dart';

/// ※Desktop/Webアプリケーションで水平方向の(マウスドラッグによる)スクロールを有効にするため、
/// MaterialScrollBehaviorのオーバーライドし、MaterialAppのscrollBehaviorへ設定する必要有り
class DragScrollBehavior extends MaterialScrollBehavior {
  @override
  Set<PointerDeviceKind> get dragDevices {
    return {
      PointerDeviceKind.touch,
      PointerDeviceKind.mouse,
    };
  }
}
