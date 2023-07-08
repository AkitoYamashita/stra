import "package:plugin_platform_interface/plugin_platform_interface.dart";

import "stra_method_channel.dart";

abstract class StraPlatform extends PlatformInterface {
  /// Constructs a StraPlatform.
  StraPlatform() : super(token: _token);

  static final Object _token = Object();

  static StraPlatform _instance = MethodChannelStra();

  /// The default instance of [StraPlatform] to use.
  ///
  /// Defaults to [MethodChannelStra].
  static StraPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [StraPlatform] when
  /// they register themselves.
  static set instance(StraPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError("platformVersion() has not been implemented.");
  }
}
