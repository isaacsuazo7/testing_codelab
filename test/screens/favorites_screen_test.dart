import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
import 'package:testing_codelab/models/favorites.dart';
import 'package:testing_codelab/screens/favorites_screen.dart';

late Favorites favoritesList;

Widget createFavoritesScreen() => ChangeNotifierProvider<Favorites>(
      create: (context) {
        favoritesList = Favorites();
        return favoritesList;
      },
      child: const MaterialApp(
        home: FavoritesScreen(),
      ),
    );

void addItems() {
  for (var i = 0; i < 5; i++) {
    favoritesList.add(i);
  }
}

void main() {
  group('Favorites Screen Tests', () {
    testWidgets('Test si hay items favoritos', (tester) async {
      await tester.pumpWidget(createFavoritesScreen());

      addItems();

      await tester.pumpAndSettle();

      expect(find.byType(ListView), findsOneWidget);
    });
    testWidgets('Test si no hay items favoritos', (tester) async {
      await tester.pumpWidget(createFavoritesScreen());

      await tester.pumpAndSettle();

      expect(find.byType(ListView), findsNothing);

      expect(find.text('No hay favoritos.'), findsOneWidget);
    });

    testWidgets('Eliminar primer item favoritos', (tester) async {
      await tester.pumpWidget(createFavoritesScreen());

      addItems();

      await tester.pumpAndSettle();

      await tester.tap(find.byKey(const Key('remove_icon_0')));

      await tester.pumpAndSettle();

      expect(find.text('Eliminado de favoritos.'), findsOneWidget);
    });
  });
}
