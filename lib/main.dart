// Importação dos pacotes fundamentais do Flutter.
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:async';

void main() {
  runApp(
    const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ContadorProdutividade(),
    ),
  );
}

class ContadorProdutividade extends StatefulWidget {
  const ContadorProdutividade({super.key});

  @override
  State<ContadorProdutividade> createState() => _ContadorProdutividadeState();
}

class _ContadorProdutividadeState extends State<ContadorProdutividade> {
  int _inputs = 0;
  int? _metaSelecionada; // Variável que guarda a meta da Tarefa 4
  DateTime? _startTime;
  Timer? _timerInterval;
  double _elapsedSeconds = 0.0;
  int _projectedPerHour = 0;
  bool _isPressed = false;

  void _registerInput() {
    setState(() {
      if (_inputs == 0) {
        _startTime = DateTime.now();
        _timerInterval = Timer.periodic(
          const Duration(milliseconds: 100),
          (_) => _updateDisplay(),
        );
      }
      _inputs++;
    });
    _updateDisplay();
  }

  void _updateDisplay() {
    if (_inputs == 0 || _startTime == null) return;

    setState(() {
      final now = DateTime.now();
      _elapsedSeconds = now.difference(_startTime!).inMilliseconds / 1000.0;

      if (_elapsedSeconds > 0) {
        _projectedPerHour = ((_inputs / _elapsedSeconds) * 3600).round();
      }
    });
  }

  void _reset() {
    setState(() {
      _inputs = 0;
      _startTime = null;
      _elapsedSeconds = 0.0;
      _projectedPerHour = 0;
      _timerInterval?.cancel();
    });
  }

  @override
  void dispose() {
    _timerInterval?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4F4F9),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(vertical: 20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 20),
                const Text(
                  '⏱️ Contador de Velocidade de Input',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 8, 0, 255),
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 10),
                const Text(
                  'Toque no quadro verde para Iniciar.',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 16, color: Color(0xFF333333)),
                ),
                const SizedBox(height: 30),

                Focus(
                  autofocus: true,
                  onKeyEvent: (node, event) {
                    if (event is KeyDownEvent &&
                        event.logicalKey == LogicalKeyboardKey.space) {
                      _registerInput();

                      setState(() => _isPressed = true);
                      Future.delayed(const Duration(milliseconds: 100), () {
                        if (mounted) setState(() => _isPressed = false);
                      });
                      return KeyEventResult.handled;
                    }
                    return KeyEventResult.ignored;
                  },
                  child: GestureDetector(
                    onTapDown: (_) {
                      setState(() => _isPressed = true);
                      _registerInput();
                    },
                    onTapUp: (_) => setState(() => _isPressed = false),
                    onTapCancel: () => setState(() => _isPressed = false),
                    child: AnimatedScale(
                      scale: _isPressed ? 0.95 : 1.0,
                      duration: const Duration(milliseconds: 100),
                      child: Container(
                        width: 300,
                        height: 200,
                        decoration: BoxDecoration(
                          color: _isPressed
                              ? const Color(0xFF45A049)
                              : const Color(0xFF4CAF50),
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: const [
                            BoxShadow(
                              color: Colors.black26,
                              blurRadius: 8,
                              offset: Offset(0, 4),
                            ),
                          ],
                        ),
                        alignment: Alignment.center,
                        child: const Text(
                          'TOQUE AQUI',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 30),

                Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 5,
                        offset: Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildMetricRow('Total de Inputs:', '$_inputs', true),
                      const SizedBox(height: 10),
                      _buildMetricRow(
                        'Tempo Decorrido:',
                        '${_elapsedSeconds.toStringAsFixed(1)} segundos',
                        false,
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(vertical: 10),
                        child: Divider(thickness: 1),
                      ),
                      _buildMetricRow(
                        'Projeção por hora:',
                        '$_projectedPerHour inputs/hora',
                        true,
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 30),

                // Botões de fluxo da Tarefa 4 agrupados
                ElevatedButton(
                  onPressed: () async {
                    final int? metaEscolhida = await Navigator.push<int>(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const EscolherMetaPage(),
                      ),
                    );
                    if (metaEscolhida != null) {
                      setState(() {
                        _metaSelecionada = metaEscolhida;
                      });
                    }
                  },
                  child: Text(
                    _metaSelecionada == null
                        ? 'Definir meta'
                        : 'Meta atual: $_metaSelecionada',
                  ),
                ),
                const SizedBox(height: 10),

                ElevatedButton(
                  onPressed: _metaSelecionada == null
                      ? null
                      : () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  ProgressoPage(meta: _metaSelecionada!),
                            ),
                          );
                        },
                  child: const Text('Ver Progresso'),
                ),
                const SizedBox(height: 30),

                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const BoasVindasPage(),
                      ),
                    );
                  },
                  child: const Text('Ir para Boas-vindas'),
                ),
                const SizedBox(height: 30),

                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ContagemPage(total: 50),
                      ),
                    );
                  },
                  child: const Text('Contagem até 50'),
                ),
                const SizedBox(height: 30),


                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const DiaPage(dia: 2),
                      ),
                    );
                  },
                  child: const Text('Dia da Semana'),
                ),
                const SizedBox(height: 30),

                // Botões gerais
                ElevatedButton(
                  onPressed: _reset,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 178, 0, 0),
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 15,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                  child: const Text('Zerar', style: TextStyle(fontSize: 16)),
                ),
                const SizedBox(height: 10),

                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const MinhasCoisas(),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 0, 0, 0),
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 15,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                  child: const Text(
                    'Minhas Coisas',
                    style: TextStyle(fontSize: 16),
                  ),
                ),
                const SizedBox(height: 10),

                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const NotaPage(nota: 7),
                      ),
                    );
                  },
                  child: const Text('Ver Nota', style: TextStyle(fontSize: 16)),
                ),
                const SizedBox(height: 10),

                OutlinedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            PaginaResultado(totalInputs: _inputs),
                      ),
                    );
                  },
                  child: const Text('Confira seu resultado'),
                ),
                const SizedBox(height: 10),

                OutlinedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const MinhaPagina(),
                      ),
                    );
                  },
                  child: const Text('Sobre o App'),
                ),
                const SizedBox(height: 10),

                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const MenuPage()),
                    );
                  },
                  child: const Text('Abrir menu'),
                ),
                const SizedBox(height: 30), // Espaçamento final
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildMetricRow(String label, String value, bool isHighlight) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          label,
          style: const TextStyle(fontSize: 22, color: Color(0xFF333333)),
        ),
        const SizedBox(width: 10),
        Text(
          value,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: isHighlight ? 30 : 22,
            fontWeight: FontWeight.bold,
            color: isHighlight
                ? const Color(0xFFD32F2F)
                : const Color(0xFF333333),
          ),
        ),
      ],
    );
  }
}

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

class PaginaResultado extends StatelessWidget {
  final int totalInputs;

  const PaginaResultado({super.key, required this.totalInputs});

  @override
  Widget build(BuildContext context) {
    String mensagem = '';

    if (totalInputs == 0) {
      mensagem = 'Você mal apertou o botão';
    } else if (totalInputs <= 10) {
      mensagem = 'Bom começo, mas você pode fazer melhor do que isso';
    } else if (totalInputs <= 30) {
      mensagem = 'Boa! agora estamos conversando';
    } else {
      mensagem = 'Pensa em um bicho ansioso';
    }

    return Scaffold(
      appBar: AppBar(title: const Text('Seu Resultado')),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Text(
            mensagem,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
        ),
      ),
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

class EscolherMetaPage extends StatelessWidget {
  const EscolherMetaPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Defina uma Meta')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context, 10);
              },
              child: const Text('Meta: 10'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context, 25);
              },
              child: const Text('Meta: 25'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context, 50);
              },
              child: const Text('Meta: 50'),
            ),
          ],
        ),
      ),
    );
  }
}

class ProgressoPage extends StatelessWidget {
  final int meta;

  const ProgressoPage({super.key, required this.meta});

  @override
  Widget build(BuildContext context) {
    final List<Widget> linhas = [];

    for (int i = 1; i <= meta; i++) {
      linhas.add(
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            'Passo $i de $meta',
            style: const TextStyle(fontSize: 18),
          ),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(title: const Text('Seu Progresso')),
      // 1. Envolvemos o ListView com o SafeArea para respeitar os limites do sistema operacional
      body: SafeArea(
        child: ListView(
          // 2. Adicionamos um padding interno apenas na parte inferior (bottom)
          // Isso cria uma "folga" de 60 píxeis após o último item da lista
          padding: const EdgeInsets.only(
            left: 10.0,
            right: 10.0,
            top: 10.0,
            bottom: 60.0,
          ),
          children: linhas,
        ),
      ),
    );
  }
}

class BoasVindasPage extends StatelessWidget {
  const BoasVindasPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Boas-vindas')),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Olá! 👋'),
            SizedBox(height: 16),
            Text('Esta é a minha tela de treino.'),
          ],
        ),
      ),
    );
  }
}

class MinhasCoisas extends StatelessWidget {
  const MinhasCoisas({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Minhas Coisas')),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Minhas 3 coisas favoritas:'),
            SizedBox(height: 12),
            Text('Games'),
            SizedBox(height: 8),
            Text('Music player'),
            SizedBox(height: 8),
            Text('Coleção TCG'),
          ],
        ),
      ),
    );
  }
}

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
      body: ListView(
        padding: const EdgeInsets.all(10.0),
        children: linhas,
      ),
    );
  }
}