import 'package:flutter/material.dart';


class ImagemInternetPage extends StatelessWidget {
  const ImagemInternetPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Imagem da Internet')),
      body: Center(
        child: Image.network(
          'https://picsum.photos/300/450',
          width: 200,
          fit: BoxFit.cover,
  loadingBuilder: (context, child, progress) {
    if (progress == null) return child; // já carregou
    return const Center(child: CircularProgressIndicator());
  },
  errorBuilder: (context, error, stackTrace) {
    return const Icon(Icons.broken_image, size: 80);
  },
)
      ),
    );
  }
}