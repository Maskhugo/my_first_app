class Filme {
  final String titulo;
  bool assistido;
  int? nota; // pode ser nulo: nem todo filme tem nota ainda

  Filme({required this.titulo, this.assistido = false, this.nota});
}
