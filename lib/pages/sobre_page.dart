import 'package:flutter/material.dart';

// Mantive o nome da classe (MinhaPagina) para não mexer em nada além
// do lugar do arquivo — o nome do arquivo já diz que tela é essa.
class MinhaPagina extends StatelessWidget {
  const MinhaPagina({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Sobre')),
      body: const Center(
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: Text(
            'Este App contabiliza a quantidade de inputs de um botão e mostra uma projeção de quantidade de inputs em horas.',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 18),
          ),
        ),
      ),
    );
  }
}
