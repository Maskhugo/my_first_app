// Importação dos pacotes fundamentais do Flutter.
// material.dart: Traz os componentes visuais padrão do Google (botões, app bars, textos).
import 'package:flutter/material.dart';
// services.dart: Permite interagir com o sistema do dispositivo (neste caso, o teclado físico).
import 'package:flutter/services.dart';
// async: Fornece classes para operações assíncronas, como o Timer que você está usando.
import 'dart:async';

// Ponto de entrada do aplicativo. Todo app em Dart/Flutter começa pela função main.
void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false, // Remove a faixa de "DEBUG" do canto da tela.
    home: ContadorProdutividade(), // Define a tela inicial do aplicativo.
  ));
}

// Criamos um StatefulWidget porque a interface desta tela vai mudar ao longo do tempo.
// Em apps reais, usamos StatefulWidgets para coisas como carrinhos de compras, 
// formulários ou cronômetros (como o seu).
class ContadorProdutividade extends StatefulWidget {
  const ContadorProdutividade({super.key});

  @override
  State<ContadorProdutividade> createState() => _ContadorProdutividadeState();
}

// Aqui é onde os dados (o "estado") da tela são guardados e gerenciados.
class _ContadorProdutividadeState extends State<ContadorProdutividade> {
  // Variáveis de estado. Sempre que elas precisarem atualizar a tela, 
  // devem ser alteradas dentro de um setState().
  int _inputs = 0;
  DateTime? _startTime;
  Timer? _timerInterval;
  double _elapsedSeconds = 0.0;
  int _projectedPerHour = 0;
  bool _isPressed = false; // Controla se o botão está pressionado para dar feedback visual.

  // Método chamado toda vez que o usuário interage com o botão (clique ou barra de espaço).
  void _registerInput() {
    setState(() {
      // Se for o primeiro input, capturamos o momento exato e iniciamos o cronômetro.
      if (_inputs == 0) {
        _startTime = DateTime.now();
        // Timer.periodic executa uma função repetidamente. 
        // Em projetos reais, também usamos isso para buscar atualizações em tempo real de um servidor.
        _timerInterval = Timer.periodic(
          const Duration(milliseconds: 100),
          (_) => _updateDisplay(),
        );
      }
      _inputs++;
    });
    _updateDisplay();
  }

  // Calcula o tempo que passou e a projeção de inputs por hora.
  void _updateDisplay() {
    // Regra de segurança: não calcula nada se não houver toques ou tempo inicial.
    if (_inputs == 0 || _startTime == null) return;

    setState(() {
      final now = DateTime.now();
      // Calcula a diferença entre o tempo atual e o tempo inicial em segundos.
      _elapsedSeconds = now.difference(_startTime!).inMilliseconds / 1000.0;

      if (_elapsedSeconds > 0) {
        // Fórmula matemática direta: (Toques / Segundos) * 3600 (segundos em 1 hora).
        _projectedPerHour = ((_inputs / _elapsedSeconds) * 3600).round();
      }
    });
  }

  // Zera todos os dados da tela para o estado inicial.
  void _reset() {
    setState(() {
      _inputs = 0;
      _startTime = null;
      _elapsedSeconds = 0.0;
      _projectedPerHour = 0;
      // É crucial cancelar o Timer para que ele não continue rodando em segundo plano.
      _timerInterval?.cancel();
    });
  }

  // O método dispose é executado quando essa tela é destruída (fechada).
  // No mundo real, esquecer de cancelar Timers ou Streams aqui causa "Memory Leaks" 
  // (vazamentos de memória), fazendo o app travar ou gastar muita bateria.
  @override
  void dispose() {
    _timerInterval?.cancel(); 
    super.dispose();
  }

  // O método build desenha a interface na tela do usuário.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4F4F9),
      // Center e SingleChildScrollView garantem que o conteúdo fique no meio 
      // e possa rolar caso a tela do celular seja muito pequena.
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

              // Focus é usado para escutar eventos de hardware, como teclados.
              // Muito útil em apps para tablets ou integração com leitores de código de barras.
              Focus(
                autofocus: true,
                onKeyEvent: (node, event) {
                  // Verifica se a tecla pressionada foi a barra de espaço
                  if (event is KeyDownEvent &&
                      event.logicalKey == LogicalKeyboardKey.space) {
                    _registerInput();
                    
                    // Simula o efeito de clique visualmente manipulando a variável de estado
                    setState(() => _isPressed = true);
                    Future.delayed(const Duration(milliseconds: 100), () {
                      if (mounted) setState(() => _isPressed = false);
                    });
                    return KeyEventResult.handled;
                  }
                  return KeyEventResult.ignored;
                },
                // GestureDetector identifica toques físicos na tela (toque rápido, segurar, arrastar).
                child: GestureDetector(
                  onTapDown: (_) {
                    setState(() => _isPressed = true);
                    _registerInput();
                  },
                  onTapUp: (_) => setState(() => _isPressed = false),
                  onTapCancel: () => setState(() => _isPressed = false),
                  
                  // AnimatedScale cria a animação de "afundar" o botão.
                  child: AnimatedScale(
                    scale: _isPressed ? 0.95 : 1.0, 
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

              // Painel de Métricas (onde os resultados são exibidos)
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
                    // Chamada para um método auxiliar para evitar repetição de código (Clean Code).
                    _buildMetricRow('Total de Inputs:', '$_inputs', true),
                    const SizedBox(height: 10),
                    // toStringAsFixed(1) garante que o número tenha apenas 1 casa decimal (ex: 2.5).
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
                onPressed: _reset, // Passamos a referência da função que criamos acima.
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

              const SizedBox(height: 30), 

              // Botão que navega para a tela de resultados
              OutlinedButton(
                onPressed: () {
                  // Navigator.push empilha uma nova tela sobre a atual.
                  // É o equivalente a abrir a página de detalhes de um produto em um app de e-commerce.
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      // Passamos o total de inputs via construtor para a próxima tela
                      builder: (context) => PaginaResultado(totalInputs: _inputs),
                    ),
                  );
                },
                child: const Text('Confira seu resultado')
              ),

              const SizedBox(height: 30), 
              
              // Botão que navega para a tela "Sobre o App"
              OutlinedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const MinhaPagina()),
                  );
                },
                child: const Text('Sobre o App')
              ),

              const SizedBox(height: 30),


              ElevatedButton(
                  onPressed: () {
                        Navigator.push(
                           context,
                           MaterialPageRoute(builder: (context) => const MenuPage()),
    );
  },
  child: const Text('Abrir menu'),
)


            ],
          ),
        ),
      ),
    );
  }

  

  // Função auxiliar para construir as linhas de texto das métricas.
  // Criar métodos assim ajuda a manter a árvore de widgets mais limpa e legível.
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

// Uma tela que apenas exibe texto fixo. Como a interface não muda depois de renderizada,
// usamos StatelessWidget (consome menos recursos do sistema).
class MinhaPagina extends StatelessWidget {
  const MinhaPagina({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sobre'),
      ),
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

// Outro StatelessWidget, mas este recebe dados (totalInputs) quando é construído.
class PaginaResultado extends StatelessWidget {
  // Variável final: significa que depois de inicializada no construtor, não pode mais ser alterada.
  final int totalInputs;

  // required this.totalInputs garante que quem chamar esta tela é obrigado a passar este dado.
  const PaginaResultado({super.key, required this.totalInputs});

  @override
  Widget build(BuildContext context) {
    String mensagem = '';

    // Lógica de negócios básica para definir a mensagem baseada nos dados recebidos.
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

class NivelPage extends StatelessWidget {
  // A variável que vai receber o número 1, 2 ou 3 da tela anterior
  final int nivel;

  // Construtor exigindo que o parâmetro 'nivel' seja passado
  const NivelPage({super.key, required this.nivel});

  @override
  Widget build(BuildContext context) {
    String nomeDoNivel;
    
    // O switch avalia a variável 'nivel' exata e executa o bloco correspondente (case)
    switch (nivel) {
      case 1:
        nomeDoNivel = 'Iniciante 🐣';
        break; // O break impede que o código continue executando os próximos cases
      case 2:
        nomeDoNivel = 'Intermediário 🚶';
        break;
      case 3:
        nomeDoNivel = 'Avançado 🏃';
        break;
      default:
        // O default é o "fallback", acionado se nenhum dos cases acima for verdadeiro
        nomeDoNivel = 'Desconhecido ❓';
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Detalhes do Nível'),
      ),
      body: Center(
        child: Text(
          // Mostrando a variável definida pelo switch na tela
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
      appBar: AppBar(
        title: const Text('Menu de Níveis'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  // Passando o número 1
                  MaterialPageRoute(builder: (context) => const NivelPage(nivel: 1)),
                );
              },
              child: const Text('Nível 1'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  // Passando o número 2
                  MaterialPageRoute(builder: (context) => const NivelPage(nivel: 2)),
                );
              },
              child: const Text('Nível 2'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  // Passando o número 3
                  MaterialPageRoute(builder: (context) => const NivelPage(nivel: 3)),
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