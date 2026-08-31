import 'package:flutter/material.dart';
import 'package:my_first_app/constants/app_images.dart';

class PosteresPage extends StatelessWidget {
  const PosteresPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Pôsteres')),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 100,
              height: 150,
              child: Image.asset(AppImages.posterAzul, fit: BoxFit.fill),
            ),
            const SizedBox(width: 8),
            SizedBox(
              width: 100,
              height: 150,
              child: Image.asset(AppImages.posterRoxo, fit: BoxFit.fill),
            ),
            const SizedBox(width: 8),
            SizedBox(
              width: 100,
              height: 150,
              child: Image.asset(AppImages.posterVerde, fit: BoxFit.fill),
            ),
          ],
        ),
      ),
    );
  }
}
