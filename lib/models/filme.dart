// A ordem das faixas importa: o primeiro if que der true é o que responde.
// Como testo >= 4 antes de >= 2, uma nota 5 já para no 'Ótimo' e nunca cai no 'Ok'.
String classificar(int estrelas) {
  if (estrelas >= 4) {
    return 'Ótimo ⭐';
  } else if (estrelas >= 2) {
    return 'Ok 🙂';
  } else {
    return 'Fraco 👎';
  }
}

class Filme {
  final String titulo;
  bool assistido;
  int? nota; // pode ser nulo: nem todo filme tem nota ainda

  Filme({required this.titulo, this.assistido = false, this.nota});
}
