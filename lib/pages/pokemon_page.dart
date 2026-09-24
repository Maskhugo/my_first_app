import 'package:flutter/material.dart';

import '../models/pokemon.dart';
import '../services/pokemon_service.dart';

// StatefulWidget pelo mesmo motivo de IconeRemotoPage: preciso de
// initState() para disparar a busca UMA vez só, quando a tela nasce —
// nunca dentro do build (que roda de novo a cada rebuild e pediria os
// dados à API repetidamente).
class PokemonPage extends StatefulWidget {
  const PokemonPage({super.key});

  @override
  State<PokemonPage> createState() => _PokemonPageState();
}

class _PokemonPageState extends State<PokemonPage> {
  final PokemonService _service = PokemonService();

  // late porque o Future só é criado no initState; guardo o Future (e não
  // a lista) porque é ele que o FutureBuilder precisa observar para saber
  // se ainda está carregando, deu erro ou já chegou.
  late final Future<List<Pokemon>> _futurePokemons;

  @override
  void initState() {
    super.initState();
    _futurePokemons = _service.buscarPokemons();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Pokémons (API pública)')),
      // FutureBuilder reconstrói sozinho quando o Future muda de estado:
      // primeiro "esperando", depois "erro" ou "dados prontos". snapshot
      // é a fotografia desse estado no momento do build.
      body: FutureBuilder<List<Pokemon>>(
        future: _futurePokemons,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            return Center(child: Text('Erro: ${snapshot.error}'));
          }

          // Se chegou até aqui, connectionState é "done" e não há erro,
          // então snapshot.data é garantido (o ! é seguro nesse ponto).
          final pokemons = snapshot.data!;

          return ListView.builder(
            itemCount: pokemons.length,
            itemBuilder: (context, index) {
              final pokemon = pokemons[index];
              return ListTile(
                leading: Image.network(
                  pokemon.imagemUrl,
                  width: 48,
                  height: 48,
                  errorBuilder: (context, error, stackTrace) {
                    return const Icon(Icons.catching_pokemon);
                  },
                ),
                title: Text('#${pokemon.id} ${pokemon.nome}'),
              );
            },
          );
        },
      ),
    );
  }
}
