import 'package:flutter/material.dart';

class BoasVindasPage extends StatelessWidget {
  const BoasVindasPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Boas-vindas')),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Olá! 👋'),
            SizedBox(height: 16),
            Text('Esta é a minha tela de treino.'),
          ],
        ),
      ),
    );
  }
}
