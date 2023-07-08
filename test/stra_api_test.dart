import "package:flutter_test/flutter_test.dart";
import "package:plugin_platform_interface/plugin_platform_interface.dart";
import "package:stra/stra_api.dart";
import "package:stra/stra_method_channel.dart";
import "package:stra/stra_platform_interface.dart";

class MockStraPlatform with MockPlatformInterfaceMixin implements StraPlatform {
  @override
  Future<String?> getPlatformVersion() => Future.value("42");
}

void main() {
  final initialPlatform = StraPlatform.instance;

  test("$MethodChannelStra is the default instance", () {
    expect(initialPlatform, isInstanceOf<MethodChannelStra>());
  });

  test("getPlatformVersion", () async {
    final straPlugin = StraApi();
    final fakePlatform = MockStraPlatform();
    StraPlatform.instance = fakePlatform;

    expect(await straPlugin.getPlatformVersion(), "42");
  });
}
