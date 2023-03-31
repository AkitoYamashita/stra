import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'stra_platform_interface.dart';

/// An implementation of [StraPlatform] that uses method channels.
class MethodChannelStra extends StraPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('stra');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}
