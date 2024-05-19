import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:testing_codelab/config/router.dart';
import 'package:testing_codelab/models/favorites.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Ejemplo Testing',
        ),
        actions: [
          TextButton.icon(
            onPressed: () {
              context.goNamed(Routes.favorites);
            },
            icon: const Icon(
              Icons.favorite_border,
              color: Colors.white,
            ),
            label:
                const Text('Favoritos', style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: 50,
        cacheExtent: 20.0,
        padding: const EdgeInsets.symmetric(vertical: 16),
        itemBuilder: (context, index) => ItemTile(item: index),
      ),
    );
  }
}

class ItemTile extends StatelessWidget {
  final int item;
  const ItemTile({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    final favorites = Provider.of<Favorites>(context);
    final itemWasAdded = favorites.items.contains(item);

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: Colors.primaries[item % Colors.primaries.length],
        ),
        title: Text(
          'Item $item',
          key: Key('text_$item'),
        ),
        trailing: IconButton(
          key: Key('icon_$item'),
          icon: itemWasAdded
              ? const Icon(Icons.favorite)
              : const Icon(Icons.favorite_border),
          onPressed: () {
            if (itemWasAdded) {
              favorites.remove(item);
            } else {
              favorites.add(item);
            }

            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(!itemWasAdded
                    ? 'Agregado a favoritos.'
                    : 'Eliminado de favoritos.'),
                duration: const Duration(seconds: 1),
              ),
            );
          },
        ),
      ),
    );
  }
}
