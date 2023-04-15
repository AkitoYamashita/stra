import 'package:flutter_test/flutter_test.dart';
import 'package:stra/stra.dart';

void main() {
  group('utils', () {
    test('echo', () {
      const expected = 'ECHO:Message';
      final actual = Stra.echo('Message');
      expect(actual, expected);
    });
  });
  group('store', () {
    test('initialize', () {
      const expected = 'STRA';
      Stra();
      expect(Stra.get('name').toString(), expected);
    });
    test('reinitialize', () {
      const expected = 'STRA2';
      Stra();
      Stra.set('name', 'STRA2');
      Stra();
      expect(Stra.get('name').toString(), expected);
    });
  });
}
