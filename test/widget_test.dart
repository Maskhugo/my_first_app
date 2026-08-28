// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

// O botão 'Ver Nota' saiu do contador e agora é um item da lista de
// destinos da HomePage, então o teste passou a partir da HomePage.
import 'package:my_first_app/pages/home_page.dart';

void main() {
  testWidgets('App loads and shows main screen and navigates to NotaPage', (WidgetTester tester) async {
    tester.view.physicalSize = const Size(1200, 800);
    tester.view.devicePixelRatio = 1.0;
    addTearDown(tester.view.resetPhysicalSize);

    // Build our app and trigger a frame.
    await tester.pumpWidget(const MaterialApp(home: HomePage()));

    // Verify that the main screen loads.
    expect(find.text('Ver Nota'), findsOneWidget);

    // Scroll to 'Ver Nota' item and tap
    final buttonFinder = find.text('Ver Nota');
    await tester.ensureVisible(buttonFinder);
    await tester.tap(buttonFinder);
    await tester.pumpAndSettle();

    // Verify NotaPage loaded
    expect(find.text('Resultado'), findsOneWidget);
    expect(find.text('Aprovado'), findsOneWidget);
  });
}
