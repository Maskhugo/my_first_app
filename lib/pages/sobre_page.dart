import 'package:flutter/material.dart';

// Mantive o nome da classe (MinhaPagina) para não mexer em nada além
// do lugar do arquivo — o nome do arquivo já diz que tela é essa.
class MinhaPagina extends StatelessWidget {
  const MinhaPagina({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Sobre')),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          // RichText permite misturar vários estilos dentro do MESMO
          // parágrafo. Cada trecho é um TextSpan; quem não define style
          // próprio herda o style do TextSpan pai (o mais externo).
          child: RichText(
            textAlign: TextAlign.center,
            text: const TextSpan(
              style: TextStyle(
                fontSize: 18,
                color: Color(0xFF333333),
                height: 1.4,
              ),
              children: [
                TextSpan(text: 'Este é o '),
                TextSpan(
                  text: 'Meu Primeiro App',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                TextSpan(
                  text:
                      ', um laboratório de aprendizado em Flutter. Cada tela é um exercício prático — navegação, imagens, listas, ícones — construído para treinar conceitos do framework.\n\n',
                ),
                TextSpan(text: 'Seu destaque é o '),
                TextSpan(
                  text: 'Contador de Inputs',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF4CAF50),
                  ),
                ),
                TextSpan(
                  text:
                      ', que mede a velocidade dos seus toques e projeta quantos inputs você faria em ',
                ),
                TextSpan(
                  text: 'uma hora',
                  style: TextStyle(fontStyle: FontStyle.italic),
                ),
                TextSpan(
                  text:
                      ' — transformando cliques em produtividade visível.',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
