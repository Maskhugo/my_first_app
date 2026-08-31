import 'package:flutter/material.dart';


class NavegacaoPage extends StatefulWidget {
  const NavegacaoPage({super.key});

  @override
  State<NavegacaoPage> createState() => _NavegacaoPageState();
}

class _NavegacaoPageState extends State<NavegacaoPage> {
  int _indice = 0;

  final List<Widget> _telas = const [
    Center(child: Text('Início')),
    Center(child: Text('Favoritos')),
    Center(child: Text('Perfil')),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _telas[_indice],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _indice,
        onTap: (novoIndice) => setState(() => _indice = novoIndice),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),   // vazado (inativo)
            activeIcon: Icon(Icons.home),      // preenchido (ativo)
            label: 'Início',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite_border),
            activeIcon: Icon(Icons.favorite),
            label: 'Favoritos',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            activeIcon: Icon(Icons.person),
            label: 'Perfil',
          ),
        ],
      ),
    );
  }
}
