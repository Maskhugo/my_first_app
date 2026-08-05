import 'package:flutter/material.dart';

import '../models/filme.dart';

class ListaFilmesPage extends StatelessWidget {
  const ListaFilmesPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Filme é o molde; a List<Filme> guarda vários filmes feitos com esse molde.
    final List<Filme> filmes = [
      Filme(titulo: 'Sherek 2', nota: 5),
      Filme(titulo: 'Coraline', assistido: true, nota: 4),
      Filme(titulo: 'Kung fu Panda 2'), // ainda sem nota
    ];

    return Scaffold(
      appBar: AppBar(title: const Text('Meus Filmes')),
      body: Center(
        child: Text(
          'Você tem ${filmes.length} filmes na lista',
          style: const TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
