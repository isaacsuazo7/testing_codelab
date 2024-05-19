import 'package:go_router/go_router.dart';
import 'package:testing_codelab/screens/favorites_screen.dart';
import 'package:testing_codelab/screens/home_screen.dart';

abstract class Routes {
  static const home = '/';
  static const favorites = 'favorites';
}

final router = GoRouter(
  routes: [
    GoRoute(
      path: Routes.home,
      builder: (context, state) {
        return const HomeScreen();
      },
      routes: [
        GoRoute(
          path: Routes.favorites,
          name: Routes.favorites,
          builder: (context, state) {
            return const FavoritesScreen();
          },
        ),
      ],
    ),
  ],
);
