import 'package:flutter/material.dart';

class MinhasCoisas extends StatelessWidget {
  const MinhasCoisas({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Minhas Coisas')),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Minhas 3 coisas favoritas:'),
            SizedBox(height: 12),
            Text('Games'),
            SizedBox(height: 8),
            Text('Music player'),
            SizedBox(height: 8),
            Text('Coleção TCG'),
          ],
        ),
      ),
    );
  }
}
