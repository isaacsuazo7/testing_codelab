import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:testing_codelab/main.dart';

void main() {
  group('Testing App', () {
    testWidgets('Favorites operaciones test', (tester) async {
      await tester.pumpWidget(const MyAppTesting());

      final iconKeys = [
        'icon_0',
        'icon_1',
        'icon_2',
      ];

      for (var icon in iconKeys) {
        await tester.tap(find.byKey(ValueKey(icon)));
        await tester.pumpAndSettle(const Duration(seconds: 1));

        expect(find.text('Agregado a favoritos.'), findsOneWidget);
      }

      await tester.tap(find.text('Favoritos'));
      await tester.pumpAndSettle();

      final removeIconKeys = [
        'remove_icon_0',
        'remove_icon_1',
        'remove_icon_2',
      ];

      for (final iconKey in removeIconKeys) {
        await tester.tap(find.byKey(ValueKey(iconKey)));
        await tester.pumpAndSettle(const Duration(seconds: 1));

        expect(find.text('Eliminado de favoritos.'), findsOneWidget);
      }
    });
  });
}
