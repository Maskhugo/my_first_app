import 'package:flutter/material.dart';

// Um Destino é uma linha do menu da tela inicial: o nome que aparece,
// o ícone da esquerda e a tela que abre quando eu toco nele.
// Mesma ideia da classe Filme: aqui eu só descrevo o formato do dado,
// quem monta a tela é o ListView.builder da HomePage.
class Destino {
  final String titulo;
  final IconData icone;
  final Widget pagina; // a tela que o onTap abre com o Navigator.push

  // Todos os campos são final, então o construtor pode ser const —
  // é isso que permite escrever a lista de destinos como uma lista const.
  const Destino({
    required this.titulo,
    required this.icone,
    required this.pagina,
  });
}
