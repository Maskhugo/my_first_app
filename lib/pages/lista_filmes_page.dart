import 'package:flutter/material.dart';

import '../models/filme.dart';

// A tela virou StatefulWidget porque a lista agora muda enquanto o app roda.
class ListaFilmesPage extends StatefulWidget {
  const ListaFilmesPage({super.key});

  @override
  State<ListaFilmesPage> createState() => _ListaFilmesPageState();
}

class _ListaFilmesPageState extends State<ListaFilmesPage> {
  // Filme é o molde; a List<Filme> guarda vários filmes feitos com esse molde.
  // Agora ela mora no State, e não no build, para não ser recriada a cada redesenho.
  final List<Filme> filmes = [
    Filme(titulo: 'Sherek 2', nota: 5),
    Filme(titulo: 'Coraline', assistido: true, nota: 4),
    Filme(titulo: 'Kung fu Panda 2'), // ainda sem nota
  ];

  // O controller é o fio que liga o TextField ao código: por ele eu leio e limpo o texto.
  final TextEditingController controller = TextEditingController();

  void adicionarFilme() {
    final texto = controller.text;
    if (texto.isEmpty) {
      return; // 👉 não adiciona se estiver vazio
    }
    // setState avisa o Flutter que o estado mudou, então ele redesenha a tela.
    setState(() {
      filmes.add(Filme(titulo: texto));
    });
    controller.clear();
  }

  @override
  void dispose() {
    // O controller precisa ser descartado quando a tela sai, para não vazar memória.
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Meus Filmes')),
      // Column: o campo de digitar em cima e a lista embaixo.
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: controller,
                    decoration: const InputDecoration(
                      hintText: 'Nome do filme',
                    ),
                  ),
                ),
                IconButton(
                  onPressed: adicionarFilme,
                  icon: const Icon(Icons.add),
                ),
              ],
            ),
          ),
          // Expanded: o ListView ocupa todo o espaço que sobrou da Column.
          Expanded(
            // O itemBuilder roda uma vez para cada item da lista, igual a um for —
            // mas quem chama é o Flutter, e só para os itens visíveis na tela.
            child: ListView.builder(
              itemCount: filmes.length,
              itemBuilder: (context, index) {
                final filme = filmes[index];
                return ListTile(
                  title: Text(filme.titulo),
                  trailing: Icon(
                    filme.assistido ? Icons.check_circle : Icons.movie,
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
