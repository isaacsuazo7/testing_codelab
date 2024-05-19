import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:testing_codelab/models/favorites.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Favoritos',
        ),
      ),
      body: Consumer<Favorites>(
        builder: (context, favorites, child) {
          if (favorites.items.isEmpty) {
            return const Center(
              child: Text(
                'No hay favoritos.',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            );
          }

          return ListView.builder(
            itemCount: favorites.items.length,
            padding: const EdgeInsets.symmetric(vertical: 16),
            itemBuilder: (context, index) {
              final item = favorites.items[index];
              return FavoriteItemTile(
                item: item,
              );
            },
          );
        },
      ),
    );
  }
}

class FavoriteItemTile extends StatelessWidget {
  final int item;
  const FavoriteItemTile({
    super.key,
    required this.item,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: Colors.primaries[item % Colors.primaries.length],
        ),
        title: Text(
          'Item $item',
          key: Key('favorites_text_$item'),
        ),
        trailing: IconButton(
          key: Key('remove_icon_$item'),
          icon: const Icon(Icons.close),
          onPressed: () {
            Provider.of<Favorites>(context, listen: false).remove(item);
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Eliminado de favoritos.'),
                duration: Duration(seconds: 1),
              ),
            );
          },
        ),
      ),
    );
  }
}
