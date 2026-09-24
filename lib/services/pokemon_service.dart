import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/pokemon.dart';

// Uma "chamada de API" tem sempre a mesma forma: eu monto a url, peço pro
// pacote http buscar (GET), espero (await) a resposta chegar, confiro se
// deu certo (statusCode 200) e transformo o texto que voltou (JSON) em
// objetos Dart. Isolar isso aqui, longe do widget, é o mesmo motivo de
// RemoteConfigFake ficar fora da tela: quem desenha a tela não precisa
// saber DE ONDE o dado veio.
class PokemonService {
  static const _baseUrl = 'https://pokeapi.co/api/v2';

  // Future<List<Pokemon>> = "uma lista de Pokemon que ainda vai chegar".
  // Async porque isso demora (é uma viagem até a internet e volta) e o
  // app não pode travar esperando — outras coisas continuam rodando
  // enquanto o await aqui embaixo aguarda a resposta.
  Future<List<Pokemon>> buscarPokemons({int limite = 151}) async {
    final url = Uri.parse('$_baseUrl/pokemon?limit=$limite');
    final resposta = await http.get(url);

    if (resposta.statusCode != 200) {
      // Erro de rede/servidor vira uma exceção — quem chamou (a tela)
      // decide como mostrar isso, com um try/catch ou um FutureBuilder.
      throw Exception(
        'Falha ao buscar pokémons (status ${resposta.statusCode})',
      );
    }

    // resposta.body é um texto JSON tipo {"results": [...]}.
    // jsonDecode transforma esse texto num Map<String, dynamic> do Dart.
    final corpo = jsonDecode(resposta.body) as Map<String, dynamic>;
    final resultados = corpo['results'] as List<dynamic>;

    // Para cada item da lista (um Map), construo um Pokemon com fromJson.
    return resultados
        .map((item) => Pokemon.fromJson(item as Map<String, dynamic>))
        .toList();
  }
}
