import 'package:flutter/material.dart';

import '../models/destino.dart';

// Cada import abaixo é uma tela que aparece na lista de destinos.
import 'boas_vindas_page.dart';
import 'contador_page.dart';
import 'exercicios_page.dart';
import 'imagem_internet_page.dart';
import 'lista_filmes_page.dart';
import 'logo_page.dart';
import 'minhas_coisas_page.dart';
import 'posteres_page.dart';
import 'sobre_page.dart';
import 'rockstargames_page.dart';
import 'icones_page.dart';

// A tela inicial do app: um índice de tudo que já foi construído.
// É StatelessWidget porque ela não guarda estado nenhum — só lista
// caminhos. O estado do contador ficou dentro da ContadorProdutividade.
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  // O índice do app. Para publicar uma tela nova eu adiciono UM Destino
  // aqui e o ListView.builder monta a linha sozinho — não preciso mais
  // escrever um ElevatedButton de 10 linhas para cada tela.
  // É static porque a lista é a mesma para qualquer HomePage, e const
  // porque nada nela muda depois de escrita.
  static const List<Destino> _destinos = [
    Destino(
      titulo: 'Contador de Inputs',
      icone: Icons.timer,
      pagina: ContadorProdutividade(),
    ),
    Destino(
      titulo: 'Boas-vindas',
      icone: Icons.person,
      pagina: BoasVindasPage(),
    ),
    Destino(
      titulo: 'Meus Filmes',
      icone: Icons.movie,
      pagina: ListaFilmesPage(),
    ),
    Destino(
      titulo: 'Minhas Coisas',
      icone: Icons.list_alt,
      pagina: MinhasCoisas(),
    ),
    Destino(
      titulo: 'Logo do App',
      icone: Icons.image,
      pagina: LogoPage()),
    Destino(
      titulo: 'Pôsteres',
      icone: Icons.photo_library,
      pagina: PosteresPage(),
    ),
    Destino(
      titulo: 'Imagem da Internet',
      icone: Icons.cloud_download,
      pagina: ImagemInternetPage(),
    ),
    Destino(
      titulo: 'Contagem até 50',
      icone: Icons.format_list_numbered,
      pagina: ContagemPage(total: 50),
    ),
    Destino(
      titulo: 'Dia da Semana',
      icone: Icons.calendar_today,
      pagina: DiaPage(dia: 2),
    ),
    Destino(
      titulo: 'Ver Nota',
      icone: Icons.school,
      pagina: NotaPage(nota: 7)),
    Destino(
      titulo: 'Menu de Níveis',
      icone: Icons.layers,
      pagina: MenuPage()),
    Destino(
      titulo: 'Sobre o App',
      icone: Icons.info_outline,
      pagina: MinhaPagina(),
    ),
    Destino(
      titulo: 'Rockstar Games SVG',
      icone: Icons.gamepad,
      pagina: Rockstargames(),
    ),
    Destino(
      titulo: 'Ícones',
      icone: Icons.apps,
      pagina: IconesPage(),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Meu Primeiro App')),
      body: SafeArea(
        // Mesma mecânica da ListaFilmesPage: eu digo QUANTOS itens existem
        // (itemCount) e ensino a montar UM item (itemBuilder). O Flutter
        // repete o molde para cada índice.
        child: ListView.builder(
          padding: const EdgeInsets.only(bottom: 40.0),
          itemCount: _destinos.length,
          itemBuilder: (context, index) {
            final destino = _destinos[index];

            return ListTile(
              leading: Icon(destino.icone),
              title: Text(destino.titulo, style: const TextStyle(fontSize: 18)),
              trailing: const Icon(Icons.chevron_right),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => destino.pagina),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
