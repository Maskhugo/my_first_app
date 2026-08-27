import 'package:flutter/material.dart';

import '../constants/app-images.dart';
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
    Filme(titulo: 'Sherek 2', nota: 5, poster: AppImages.posterVerde),
    Filme(
      titulo: 'Coraline',
      assistido: true,
      nota: 4,
      poster: AppImages.posterRoxo,
    ),
    // cai na faixa do meio
    Filme(titulo: 'Madagascar', nota: 3, poster: AppImages.posterAzul),
    // ainda sem nota
    Filme(titulo: 'Kung fu Panda 2', poster: AppImages.posterVerde),
  ];

  // Os pôsteres que eu tenho. Os filmes novos vão se revezando entre eles.
  final List<String> posteres = [
    AppImages.posterAzul,
    AppImages.posterRoxo,
    AppImages.posterVerde,
  ];

  // O controller é o fio que liga o TextField ao código: por ele eu leio e limpo o texto.
  final TextEditingController controller = TextEditingController();

  void adicionarFilme() {
    final texto = controller.text;
    if (texto.isEmpty) {
      return; // não adiciona se estiver vazio
    }
    // setState avisa o Flutter que o estado mudou, então ele redesenha a tela.
    setState(() {
      // O % (resto da divisão) faz o índice girar 0, 1, 2, 0, 1, 2...
      // e nunca estourar o tamanho da lista de pôsteres.
      filmes.add(
        Filme(titulo: texto, poster: posteres[filmes.length % posteres.length]),
      );
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
                    decoration: const InputDecoration(hintText: 'Nome do filme'),
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
                  // Toque alterna o assistido. O ! aqui é o operador "não" do bool
                  // (inverte true/false) — nada a ver com o ! de null-safety.
                  onTap: () {
                    setState(() {
                      filme.assistido = !filme.assistido;
                    });
                  },
                  // Folga vertical para o pôster de 75px não ficar apertado.
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 8,
                  ),
                  // leading = o que aparece na ESQUERDA do item.
                  // ClipRRect é uma tesoura: não desenha nada, só recorta o filho
                  // com cantos arredondados.
                  leading: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.asset(
                      filme.poster, // cada filme mostra o pôster DELE
                      width: 50,
                      height: 75,
                      // cover preenche a caixa e corta o excesso, sem distorcer.
                      fit: BoxFit.cover,
                    ),
                  ),
                  title: Text(filme.titulo),
                  // nota pode ser nula, então o ?? 0 troca o nulo por 0 antes de
                  // entrar na função. Usar filme.nota! quebraria o app aqui.
                  subtitle: Text(classificar(filme.nota ?? 0)),
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
