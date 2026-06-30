import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:async';

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: ContadorProdutividade(),
  ));
}

class ContadorProdutividade extends StatefulWidget {
  const ContadorProdutividade({super.key});

  @override
  State<ContadorProdutividade> createState() => _ContadorProdutividadeState();
}

class _ContadorProdutividadeState extends State<ContadorProdutividade> {
  int _inputs = 0;
  DateTime? _startTime;
  Timer? _timerInterval;
  double _elapsedSeconds = 0.0;
  int _projectedPerHour = 0;
  bool _isPressed = false; // Para o efeito visual do botão

  void _registerInput() {
    setState(() {
      if (_inputs == 0) {
        _startTime = DateTime.now();
        // Inicia o loop de atualização a cada 100ms
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
        // (Total de inputs / segundos decorridos) * 3600 segundos (1 hora)
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
    _timerInterval?.cancel(); // Boa prática: matar o timer ao fechar a tela
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4F4F9),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
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

              // Envolvendo o botão com Focus para escutar o teclado (Barra de Espaço)
              Focus(
                autofocus: true,
                onKeyEvent: (node, event) {
                  if (event is KeyDownEvent &&
                      event.logicalKey == LogicalKeyboardKey.space) {
                    _registerInput();
                    // Simula o efeito de clique visualmente
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
                    scale: _isPressed ? 0.95 : 1.0, // Equivalente ao :active
                    duration: const Duration(milliseconds: 100),
                    child: Container(
                      width: 300,
                      height: 200,
                      decoration: BoxDecoration(
                        color: _isPressed ? const Color(0xFF45A049) : const Color(0xFF4CAF50),
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.black26,
                            blurRadius: 8,
                            offset: Offset(0, 4),
                          )
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

              // Painel de Métricas (Equivalente a <div class="metrics">)
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
                    )
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildMetricRow('Total de Inputs:', '$_inputs', true),
                    const SizedBox(height: 10),
                    _buildMetricRow('Tempo Decorrido:', '${_elapsedSeconds.toStringAsFixed(1)} segundos', false),
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 10),
                      child: Divider(thickness: 1),
                    ),
                    _buildMetricRow('Projeção por hora:', '$_projectedPerHour inputs/hora', true),
                  ],
                ),
              ),

              const SizedBox(height: 30),

              // Botão de Reset
              ElevatedButton(
                onPressed: _reset,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 178, 0, 0),
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
                child: const Text('Zerar', style: TextStyle(fontSize: 16)),
              ),

              const SizedBox(height: 30), //espaçamento entre o botão de zerar

              //Botão Resultado
              OutlinedButton(onPressed:(){
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => PaginaResultado(totalInputs: _inputs),
                  ),
                );
              },
              child: const Text ('Confira seu resultado')),


              const SizedBox(height: 30), 
              //Botão Sobre
              OutlinedButton(onPressed:(){
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const MinhaPagina()),
                );
              },
              child: const Text ('Sobre o App')),
            ],
          ),
        ),
      ),
    );
  }

  // Função auxiliar para montar as linhas de texto com formatação
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
            color: isHighlight ? const Color(0xFFD32F2F) : const Color(0xFF333333),
          ),
        ),
      ],
    );
  }
}
class MinhaPagina extends StatelessWidget {
  const MinhaPagina({super.key});


@override
Widget  build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(
      title: const Text('Sobre'),
    ),
    body: const Center(
      child: Padding(
        padding: EdgeInsets.all (20.0),
        child: Text('Este App contabiliza a quantidade de inputs de um botão e mostra uma projeção de quantidade de inputs em horas.',
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
  Widget build(BuildContext context) {String mensagem = '';

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
      appBar: AppBar(
        title: const Text('Seu Resultado'),
      ),
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