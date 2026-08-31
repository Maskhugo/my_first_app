import 'package:flutter/material.dart';

import '../constants/app_images.dart';

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
            // CircleAvatar já é redondo por natureza: não precisa de ClipRRect.
            // backgroundImage pede um ImageProvider (AssetImage), não um widget.
            CircleAvatar(
              radius: 40, // raio, não diâmetro: o círculo fica com 80px
              backgroundImage: AssetImage(AppImages.avatar),
            ),
            SizedBox(height: 16),
            Text('Olá! 👋'),
            SizedBox(height: 16),
            Text('Esta é a minha tela de treino.'),
          ],
        ),
      ),
    );
  }
}
