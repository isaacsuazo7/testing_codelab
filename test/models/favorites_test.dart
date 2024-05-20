import 'package:test/expect.dart';
import 'package:test/scaffolding.dart';
import 'package:testing_codelab/models/favorites.dart';

void main() {
  // Pruebas unitarias
  group('Testing App Provider', () {
    final favorites = Favorites();

    test('Agrega un item', () {
      int item = 7;
      favorites.add(item);
      expect(favorites.items.contains(item), true);
    });

    test('Elimina un item', () {
      int item = 9;
      favorites.add(item);
      expect(favorites.items.contains(item), true);
      favorites.remove(item);
      expect(favorites.items.contains(item), false);
    });
  });
}
