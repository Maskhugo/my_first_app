import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:my_first_app/constants/app-images.dart';

// Virou StatefulWidget porque agora a tela guarda uma informação que muda
// com a interação do usuário: qual cor está selecionada no radio button.
class Rockstargames extends StatefulWidget {
  const Rockstargames({super.key});

  @override
  State<Rockstargames> createState() => _RockstargamesState();
}

class _RockstargamesState extends State<Rockstargames> {
  // Cor aplicada ao SVG agora. Começa em preto, igual ao logo original.
  Color _corSelecionada = Colors.black;

  // Cada entrada deste mapa vira um RadioListTile na lista abaixo da figura:
  // a chave é o texto exibido, o valor é a cor que o radio representa.
  static const Map<String, Color> _opcoesDeCor = {
    'Preto': Colors.black,
    'Vermelho': Colors.red,
    'Azul': Colors.blue,
    'Dourado': Color(0xFFFFD700),
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Rockstar Games SVG')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 200,
              height: 200,
              child: SvgPicture.asset(
                AppImages.Rockstar,
                fit: BoxFit.contain,
                // BlendMode.srcIn substitui toda cor do SVG pela cor escolhida
                // no radio abaixo — funciona porque o SVG é monocromático.
                colorFilter: ColorFilter.mode(_corSelecionada, BlendMode.srcIn),
              ),
            ),
            const SizedBox(height: 30),
            // RadioGroup é o widget "pai" que sabe qual valor está
            // selecionado (groupValue) e o que fazer quando muda
            // (onChanged). Os RadioListTile filhos só precisam dizer qual
            // "value" cada um representa — o grupo cuida do resto.
            RadioGroup<Color>(
              groupValue: _corSelecionada,
              onChanged: (Color? novaCor) {
                if (novaCor == null) return;
                setState(() => _corSelecionada = novaCor);
              },
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: _opcoesDeCor.entries.map((opcao) {
                  return RadioListTile<Color>(
                    title: Text(opcao.key),
                    value: opcao.value,
                  );
                }).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}