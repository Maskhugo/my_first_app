import 'package:flutter/material.dart';

// Telas dos exercícios de lógica (if/else, switch e for) que estavam
// soltas no fim do main.dart. Elas não dependem do contador, então
// puderam sair de lá sem levar nenhum estado com elas.

class NotaPage extends StatelessWidget {
  final int nota;
  const NotaPage({super.key, required this.nota});

  @override
  Widget build(BuildContext context) {
    String mensagem;
    if (nota >= 7) {
      mensagem = 'Aprovado';
    } else if (nota <= 5) {
      mensagem = 'Recuperação';
    } else {
      mensagem = 'Reprovado';
    }

    return Scaffold(
      appBar: AppBar(title: const Text('Resultado')),
      body: Center(
        child: Text(
          mensagem,
          style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}

class DiaPage extends StatelessWidget {
  final int dia;

  const DiaPage({super.key, required this.dia});

  @override
  Widget build(BuildContext context) {
    String nomeDoDia;

    switch (dia) {
      case 1:
        nomeDoDia = 'Segunda-feira';
        break;
      case 2:
        nomeDoDia = 'Terça-feira';
        break;
      case 3:
        nomeDoDia = 'Quarta-feira';
        break;
      case 4:
        nomeDoDia = 'Quinta-feira';
        break;
      case 5:
        nomeDoDia = 'Sexta-feira';
        break;
      case 6:
        nomeDoDia = 'Sábado';
        break;
      case 7:
        nomeDoDia = 'Domingo';
        break;
      default:
        nomeDoDia = 'Dia inválido';
    }

    return Scaffold(
      appBar: AppBar(title: const Text('Dia da Semana')),
      body: Center(
        child: Text(
          'Dia $dia = $nomeDoDia',
          style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}

class ContagemPage extends StatelessWidget {
  final int total;

  const ContagemPage({super.key, required this.total});

  @override
  Widget build(BuildContext context) {
    final List<Widget> linhas = [];

    for (int i = 1; i <= total; i++) {
      linhas.add(
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            'Contagem $i de $total',
            style: const TextStyle(fontSize: 18),
          ),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(title: const Text('Contagem')),
      body: ListView(padding: const EdgeInsets.all(10.0), children: linhas),
    );
  }
}

class NivelPage extends StatelessWidget {
  final int nivel;

  const NivelPage({super.key, required this.nivel});

  @override
  Widget build(BuildContext context) {
    String nomeDoNivel;

    switch (nivel) {
      case 1:
        nomeDoNivel = 'Iniciante 🐣';
        break;
      case 2:
        nomeDoNivel = 'Intermediário 🚶';
        break;
      case 3:
        nomeDoNivel = 'Avançado 🏃';
        break;
      default:
        nomeDoNivel = 'Desconhecido ❓';
    }

    return Scaffold(
      appBar: AppBar(title: const Text('Detalhes do Nível')),
      body: Center(
        child: Text(
          nomeDoNivel,
          style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}

class MenuPage extends StatelessWidget {
  const MenuPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Menu de Níveis')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const NivelPage(nivel: 1),
                  ),
                );
              },
              child: const Text('Nível 1'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const NivelPage(nivel: 2),
                  ),
                );
              },
              child: const Text('Nível 2'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const NivelPage(nivel: 3),
                  ),
                );
              },
              child: const Text('Nível 3'),
            ),
          ],
        ),
      ),
    );
  }
}
