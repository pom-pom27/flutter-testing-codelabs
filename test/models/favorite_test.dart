import 'package:codebase_testing/models/favorite.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('add -', () {
    late Favorites favorites;
    late int number;

    setUp(() {
      favorites = Favorites();

      number = 30;
    });

    test('add new item to favorites list', () {
      //ARRANGE

      //ACT
      favorites.add(number);

      //ASSERT
      expect(favorites.items.contains(number), true);
    });
  });

  group('remove -', () {
    test('remove item from favorites list', () {
      final favorites = Favorites();
      final number = 30;

      favorites.add(number);
      favorites.remove(number);

      expect(favorites.items.contains(30), false);
    });
  });
}
