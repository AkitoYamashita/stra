import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

// Annotation which generates the cat.mocks.dart library and the MockCat class.
@GenerateNiceMocks([MockSpec<Cat>()])
import 'cat.mocks.dart';

// Real class
class Cat {
  String sound() => 'Meow';
  bool eatFood(String food, {bool? hungry}) => true;
  Future<void> chew() async => print('Chewing...');
  int walk(List<String> places) => 7;
  void sleep() {}
  void hunt(String place, String prey) {}
  int lives = 9;
}

void main() {
  // Create mock object.
  final cat = MockCat();

  test('initialize', () {
    expect(cat.sound(), 'Meow');
    when(cat.sound()).thenReturn('Purr');
    expect(cat.sound(), 'Purr');

    // You can use plain arguments themselves
    when(cat.eatFood('fish')).thenReturn(true);

    // ... including collections
    when(cat.walk(['roof', 'tree'])).thenReturn(2);

    // ... or matchers
    when(cat.eatFood(argThat(startsWith('dry')))).thenReturn(false);
    when(cat.eatFood(any)).thenReturn(false);

    // ... or mix arguments with matchers
    when(cat.eatFood(argThat(startsWith('dry')), hungry: true))
        .thenReturn(true);
    expect(cat.eatFood('fish'), isTrue);
    expect(cat.walk(['roof', 'tree']), equals(2));
    expect(cat.eatFood('dry food'), isFalse);
    expect(cat.eatFood('dry food', hungry: true), isTrue);

    // You can also verify using an argument matcher.
    verify(cat.eatFood('fish'));
    verify(cat.walk(['roof', 'tree']));
    verify(cat.eatFood(argThat(contains('food'))));

    // You can verify setters.
    cat.lives = 9;
    verify(cat.lives = 9);
  });
}
