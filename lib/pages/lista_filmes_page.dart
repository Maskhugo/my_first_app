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
      // O itemBuilder roda uma vez para cada item da lista, igual a um for —
      // mas quem chama é o Flutter, e só para os itens visíveis na tela.
      body: ListView.builder(
        itemCount: filmes.length,
        itemBuilder: (context, index) {
          final filme = filmes[index];
          return ListTile(
            title: Text(filme.titulo),
            trailing: Icon(filme.assistido ? Icons.check_circle : Icons.movie),
          );
        },
      ),
    );
  }
}
