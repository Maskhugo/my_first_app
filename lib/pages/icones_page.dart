import 'package:flutter/material.dart';

class IconesPage extends StatelessWidget {
  const IconesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ícones'),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {/* 👉 mostre um SnackBar 'Buscar' */},
          ),
          IconButton(
            icon: const Icon(Icons.more_vert),
            onPressed: () {/* 👉 SnackBar 'Menu' */},
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ListTile(
              leading: const Icon(Icons.settings),
              title: const Text('Configurações'),
              trailing: const Icon(Icons.chevron_right),
              onTap: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Abrindo Configurações...')),
                );
              },
            ),
            
            ListTile(
              leading: const Icon(Icons.gamepad),
              title: const Text('Play'),
              trailing: const Icon(Icons.chevron_right),
              onTap: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Abrindo Play...')),
                );
              },
            ),
            const Icon(Icons.favorite, size: 48, color: Colors.red),
            const SizedBox(height: 24),
            const Icon(Icons.star, size: 40, color: Colors.amber),
            const SizedBox(height: 24),
            
            IconButton(
              iconSize: 40,
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Você tocou no ícone! 👍')),
                );
              },
              icon: const Icon(Icons.thumb_up),
            ),
            const SizedBox(height: 24),
            IconButton(
              iconSize: 40,
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Você tocou no ícone! 👎')),
                );
              },
              icon: const Icon(Icons.thumb_down),
            ),
            
          ],
        ),
      ),
    );
  }
}