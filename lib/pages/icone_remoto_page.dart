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

  @override
  void initState() {
    super.initState();
    // Lê a flag UMA vez, aqui — nunca dentro do build. O build roda a cada
    // rebuild da tela, e ficar consultando a configuração lá desperdiça
    // trabalho e pode fazer a interface piscar se o valor mudar no meio.
    _usarIconeNovo = RemoteConfigFake.instance.getUsarIconeNovo();
    _textoDoBotao = RemoteConfigFake.instance.getTextoDoBotao();
  }

  @override
  Widget build(BuildContext context) {
    // Quem decide o ícone não é esta tela: é o valor que veio da configuração.
    final icone = _usarIconeNovo ? Icons.rocket_launch : Icons.star;

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
          ],
        ),
      ),
    );
  }
}
