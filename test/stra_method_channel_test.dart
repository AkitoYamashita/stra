import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:stra/stra_method_channel.dart';

void main() {
  final platform = MethodChannelStra();
  const channel = MethodChannel('stra');

  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return '42';
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

  test('getPlatformVersion', () async {
    expect(await platform.getPlatformVersion(), '42');
  });
}
