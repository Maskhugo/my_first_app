// O "molde" do dado que a API devolve — igual Filme e Destino, só que
// aqui os valores não nascem no app: eles chegam de fora, em JSON.
class Pokemon {
  final int id;
  final String nome;
  final String imagemUrl;

  const Pokemon({
    required this.id,
    required this.nome,
    required this.imagemUrl,
  });

  // Um "construtor nomeado": em vez de Pokemon(...), quem tem um JSON
  // decodificado (um Map<String, dynamic>) chama Pokemon.fromJson(map).
  // A PokéAPI não manda o id nem a imagem prontos na listagem — só o nome
  // e uma url tipo ".../pokemon/25/". Por isso a gente extrai o id dessa
  // url e monta a url da imagem a partir dele.
  factory Pokemon.fromJson(Map<String, dynamic> json) {
    final url = json['url'] as String;
    // A url termina em "/25/": tiro a barra final, pego o último pedaço.
    final partes = url.split('/')..removeWhere((p) => p.isEmpty);
    final id = int.parse(partes.last);

    return Pokemon(
      id: id,
      nome: json['name'] as String,
      imagemUrl:
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/$id.png',
    );
  }
}
