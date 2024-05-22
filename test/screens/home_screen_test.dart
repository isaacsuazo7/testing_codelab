import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
import 'package:testing_codelab/models/favorites.dart';
import 'package:testing_codelab/screens/home_screen.dart';

Widget createHomeScreen() => ChangeNotifierProvider<Favorites>(
      create: (context) => Favorites(),
      child: const MaterialApp(
        home: HomeScreen(),
      ),
    );

void main() {
  group('Home Screen Tests', () {
    testWidgets('Testing Scrolling', (tester) async {
      // Carga el widget a probar
      await tester.pumpWidget(createHomeScreen());

      // Verifica que el texto 'Item 0' esté presente
      expect(find.text('Item 0'), findsOneWidget);

      // Realiza un fling para desplazar la lista hacia arriba
      await tester.fling(
        find.byType(ListView),
        const Offset(0, -50),
        3000,
      );

      // Espera a que la animación termine
      await tester.pumpAndSettle();

      // Verifica que el texto 'Item 0' ya no esté presente
      expect(find.text('Item 0'), findsNothing);
    });

    testWidgets('Agregar / Remover item a favorito', (tester) async {
      // Carga el widget a probar
      await tester.pumpWidget(createHomeScreen());

      // En este punto no hay items favoritos
      expect(find.byIcon(Icons.favorite), findsNothing);

      // Toca el primer ícono de favoritos
      await tester.tap(find.byIcon(Icons.favorite_border).first);
      await tester.pumpAndSettle(const Duration(seconds: 1));

      // Agregado y mostrando snackbar
      expect(find.text('Agregado a favoritos.'), findsOneWidget);
      expect(find.byIcon(Icons.favorite), findsWidgets);

      // Remover
      await tester.tap(find.byKey(const Key('icon_0')));
      await tester.pumpAndSettle(const Duration(seconds: 1));
      expect(find.text('Eliminado de favoritos.'), findsOneWidget);
      expect(find.byIcon(Icons.favorite), findsNothing);
    });
  });
}
