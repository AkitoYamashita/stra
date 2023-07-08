import "package:flutter_test/flutter_test.dart";
import "package:stra/thirdparty/yml.dart";
import "package:stra/utils/io.dart";
import "package:stra/utils/io_interface.dart";

class MockYml with Yml, Io implements IoInterface {}

void main() {
  final mock = MockYml();
  group("getStringByYmlText", () {
    const ymlText =
        '''
String: "文字列"
Number: 100
Parent:
  Item1: "ItemValue1"
  Child:
    Item2: "ItemValue2"
''';
    test("NotFound", () async {
      const expected = "";
      final actual = mock.getStringByYmlText(ymlText, "Notfound");
      expect(actual, expected);
    });
    test("String", () async {
      const expected = "文字列";
      final actual = mock.getStringByYmlText(ymlText, "String");
      expect(actual, expected);
    });
    test("Number", () async {
      const expected = "100";
      final actual = mock.getStringByYmlText(ymlText, "Number");
      expect(actual, expected);
    });
    test("Item1(1)", () async {
      const expected = "ItemValue1";
      final actual = mock.getStringByYmlText(ymlText, "Parent.Item1");
      expect(actual, expected);
    });
    test("Item(2)", () async {
      const expected = "ItemValue2";
      final actual = mock.getStringByYmlText(ymlText, "Parent.Child.Item2");
      expect(actual, expected);
    });
  });
}
