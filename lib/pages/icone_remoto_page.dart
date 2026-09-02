import 'package:flutter/material.dart';

import '../config/remote_config_fake.dart';

// Esta tela não guarda nada que o usuário mude — mesmo assim ela é um
// StatefulWidget. O motivo é único: só o StatefulWidget tem initState(),
// e é lá que se lê uma configuração que vem de fora do app.
class IconeRemotoPage extends StatefulWidget {
  const IconeRemotoPage({super.key});

  @override
  State<IconeRemotoPage> createState() => _IconeRemotoPageState();
}

class _IconeRemotoPageState extends State<IconeRemotoPage> {
  // late porque o valor só chega no initState; final porque, uma vez lido,
  // ele não muda mais enquanto esta tela estiver viva.
  late final bool _usarIconeNovo;

  // A configuração não decide só coisas de ligar/desligar: ela também manda
  // textos. Mesma regra do campo acima — late + final.
  late final String _textoDoBotao;

  // Em qual grupo do teste A/B este usuário caiu. Também é late + final:
  // um usuário não pode trocar de grupo no meio do experimento, senão os
  // números medidos não valeriam nada.
  late final String _variante;

  // A MÉTRICA do experimento: quantas vezes o ícone foi tocado.
  // Este SIM é um estado que muda, então é um int normal (sem final) e
  // toda mudança dele passa pelo setState.
  int _toques = 0;

  @override
  void initState() {
    super.initState();
    // Lê a flag UMA vez, aqui — nunca dentro do build. O build roda a cada
    // rebuild da tela, e ficar consultando a configuração lá desperdiça
    // trabalho e pode fazer a interface piscar se o valor mudar no meio.
    _usarIconeNovo = RemoteConfigFake.instance.getUsarIconeNovo();
    _textoDoBotao = RemoteConfigFake.instance.getTextoDoBotao();
    _variante = RemoteConfigFake.instance.getVarianteIconeAb();
  }

  @override
  Widget build(BuildContext context) {
    // Quem decide o ícone não é esta tela: é o valor que veio da configuração.
    final icone = _usarIconeNovo ? Icons.rocket_launch : Icons.star;

    // O teste A/B: duas versões do MESMO botão, uma para cada grupo.
    // Ninguém vê as duas — cada usuário só conhece a sua.
    final iconeAb = _variante == 'A' ? Icons.favorite : Icons.thumb_up;

    return Scaffold(
      appBar: AppBar(title: const Text('Ícone remoto')),
      body: Center(
        // A Column empilha os filhos de cima para baixo. Sem o
        // mainAxisAlignment.center ela ocuparia a altura toda e o conteúdo
        // ficaria colado no topo, mesmo dentro do Center.
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icone, size: 80),
            const SizedBox(height: 24),
            // Repare: sem `const` antes do Text. O valor só é conhecido
            // quando o app roda, e `const` exige um valor fixo já na compilação.
            ElevatedButton(onPressed: () {}, child: Text(_textoDoBotao)),
            const SizedBox(height: 40),
            const Text('Qual ícone as pessoas tocam mais?'),
            IconButton(
              // Cada toque soma 1 na métrica. No app real, em vez de um
              // setState, aqui iria um evento para a ferramenta de análise
              // (Firebase/Amplitude) — é dali que o time tira os números.
              onPressed: () => setState(() => _toques++),
              icon: Icon(iconeAb),
              iconSize: 48,
            ),
            // O que o time compararia no fim do experimento: os toques da
            // variante A contra os da variante B. Ganha quem tiver mais.
            Text('Variante $_variante — $_toques toques'),
          ],
        ),
      ),
    );
  }
}
