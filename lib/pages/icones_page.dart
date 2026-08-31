import 'package:flutter/material.dart';

class IconesPage extends StatelessWidget {
  const IconesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Ícones')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.favorite, size: 48, color: Colors.red),
            const SizedBox(height: 24),
            const Icon(Icons.star, size: 40, color: Colors.amber),
            const SizedBox(height: 24),
            const Icon(Icons.check_circle, size: 40, color: Colors.green),
            const SizedBox(height: 24),
            const Icon(Icons.error, size: 40, color: Colors.red),
            // 👉 COMPLETE: adicione mais 2 ícones com size/color à sua escolha
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