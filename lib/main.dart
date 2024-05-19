import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:testing_codelab/config/router.dart';
import 'package:testing_codelab/models/favorites.dart';

void main() {
  runApp(const MyAppTesting());
}

class MyAppTesting extends StatelessWidget {
  const MyAppTesting({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<Favorites>(
      create: (context) => Favorites(),
      child: MaterialApp.router(
        title: 'Testing Sample',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
            seedColor: Colors.deepPurple,
          ),
          appBarTheme: const AppBarTheme(
              backgroundColor: Colors.green, foregroundColor: Colors.white),
          useMaterial3: true,
        ),
        routerConfig: router,
      ),
    );
  }
}
