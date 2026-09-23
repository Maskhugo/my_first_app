// O main.dart agora tem uma única responsabilidade: ligar o app.
// Todas as telas moram em lib/pages/ e o índice delas está na HomePage.
import 'package:flutter/material.dart';

import 'pages/home_page.dart';

void main() {
  runApp(
    const MaterialApp(debugShowCheckedModeBanner: false, home: HomePage()),
  );
}
