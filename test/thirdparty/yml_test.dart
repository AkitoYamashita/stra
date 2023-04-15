import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:stra/thirdparty/yml.dart';
import 'package:stra/utils/io.dart';
import 'package:stra/utils/io_interface.dart';

class MockYml with Yml, Io implements IoInterface {}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized(); // for rootBundle
  final mock = MockYml();
  const ymlStr = '''
String: "文字列"
Number: 100
Parent:
  Item1: "ItemValue1"
  Child:
    Item2: "ItemValue2"
''';
  setUpAll(() async {
    await rootBundle.loadString('assets/tmp/.gitkeep');
  });
  group('yml', () {
    test('getStringByYamlString.NotFound', () async {
      const expected = '';
      final actual = mock.getStringByYamlString(ymlStr, 'Notfound');
      expect(actual, expected);
    });
    test('getStringByYamlString.String', () async {
      const expected = '文字列';
      final actual = mock.getStringByYamlString(ymlStr, 'String');
      expect(actual, expected);
    });
    test('getStringByYamlString.Number', () async {
      const expected = '100';
      final actual = mock.getStringByYamlString(ymlStr, 'Number');
      expect(actual, expected);
    });
    test('getStringByYamlString.Item1(1)', () async {
      const expected = 'ItemValue1';
      final actual = mock.getStringByYamlString(ymlStr, 'Parent.Item1');
      expect(actual, expected);
    });
    test('getStringByYamlString.Item(2)', () async {
      const expected = 'ItemValue2';
      final actual = mock.getStringByYamlString(ymlStr, 'Parent.Child.Item2');
      expect(actual, expected);
    });
  });
}
