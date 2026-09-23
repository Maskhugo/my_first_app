/// Remote Config "de mentira" — uma simulação simples para praticar.
///
/// No app da Clickbus, quem faz esse papel é o `RemoteConfigHelper`
/// (que usa o Firebase Remote Config). A ideia é a mesma: existem
/// "valores que vêm de fora" e o app os lê em tempo de execução para
/// decidir o que mostrar — sem precisar publicar uma versão nova na loja.
///
/// Aqui os valores ficam num `Map` local (em vez de virem de um servidor),
/// mas a FORMA de usar é igual à da Clickbus:
///   - um objeto único (singleton) acessível por `RemoteConfigFake.instance`;
///   - getters "genéricos" por tipo (`getBool`, `getString`);
///   - um getter NOMEADO por chave (um método por flag), igual ao
///     `RemoteConfigHelper.getToggleNewOrdersPage()` do app real.
///
/// Regra de ouro (a mesma do time): leia a flag UMA vez, no `initState`
/// da sua tela — nunca dentro do `build`.
class RemoteConfigFake {
  RemoteConfigFake._();

  /// Instância única (singleton). Use sempre `RemoteConfigFake.instance`.
  static final RemoteConfigFake instance = RemoteConfigFake._();

  /// Os "valores que viriam do servidor".
  /// 👉 Nas próximas tarefas você vai ADICIONAR novas chaves aqui.
  final Map<String, dynamic> _valores = {
    'usar_icone_novo': false,
    'texto_do_botao': 'teste de botão remoto',
    'variante_icone_ab': 'B', // 'A' ou 'B'
    'icone_botao_comprar': 'sacola', // 'carrinho' | 'sacola' | 'dinheiro'
  };

  /// Lê uma chave booleana. Se a chave não existir, devolve `false`.
  bool getBool(String chave) => _valores[chave] as bool? ?? false;

  /// Lê uma chave de texto. Se a chave não existir, devolve `''`.
  String getString(String chave) => _valores[chave] as String? ?? '';

  /// Getter nomeado de exemplo (estilo `RemoteConfigHelper`): um método por flag.
  /// Deixa o código de quem usa mais limpo: `RemoteConfigFake.instance.getUsarIconeNovo()`.
  bool getUsarIconeNovo() => getBool('usar_icone_novo');

  String getTextoDoBotao() => getString('texto_do_botao');

  String getVarianteIconeAb() => getString('variante_icone_ab');

  /// Aqui a configuração manda o NOME de uma variante, não um liga/desliga.
  /// Um bool só teria 2 estados; um texto permite quantas variantes eu quiser.
  String getIconeBotaoComprar() => getString('icone_botao_comprar');
}
