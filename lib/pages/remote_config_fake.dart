class RemoteConfigFake {
  RemoteConfigFake._();
  static final RemoteConfigFake instance = RemoteConfigFake._();

  // "valores que viriam do servidor" (no app real, do Firebase)
  final Map<String, dynamic> _valores = {
    'usar_icone_novo': false,
  };

  bool getBool(String chave) => _valores[chave] as bool? ?? false;

  // getter nomeado, no estilo do RemoteConfigHelper da Clickbus
  bool getUsarIconeNovo() => getBool('usar_icone_novo');
}
