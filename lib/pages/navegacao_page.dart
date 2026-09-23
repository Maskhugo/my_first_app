import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:my_first_app/constants/app_images.dart';
import 'package:my_first_app/constants/app_icons.dart';

class NavegacaoPage extends StatefulWidget {
  const NavegacaoPage({super.key});

  @override
  State<NavegacaoPage> createState() => _NavegacaoPageState();
}

class _NavegacaoPageState extends State<NavegacaoPage> {
  int _indice = 0;

  final List<Widget> _telas = [
    Center(
      child: SvgPicture.asset(
        AppImages.estrela,
        width: 48,
        height: 48,
        colorFilter: const ColorFilter.mode(Colors.amber, BlendMode.srcIn),
      ),
    ),
    Center(
      child: SvgPicture.asset(
        AppImages.estrela,
        width: 48,
        height: 48,
        colorFilter: const ColorFilter.mode(Colors.blue, BlendMode.srcIn),
      ),
    ),
    Center(
      child: SvgPicture.asset(
        AppImages.estrela,
        width: 48,
        height: 48,
        colorFilter: const ColorFilter.mode(Colors.orange, BlendMode.srcIn),
      ),
    ),
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
            icon: Icon(AppIcons.inicioVazado), // vazado (inativo)
            activeIcon: Icon(AppIcons.inicio), // preenchido (ativo)
            label: 'Início',
          ),
          BottomNavigationBarItem(
            icon: Icon(AppIcons.favoritoVazado),
            activeIcon: Icon(AppIcons.favorito),
            label: 'Favoritos',
          ),
          BottomNavigationBarItem(
            icon: Icon(AppIcons.perfilVazado),
            activeIcon: Icon(AppIcons.perfil),
            label: 'Perfil',
          ),
        ],
      ),
    );
  }
}
