// Compatibilidade com o Material integrado ao Flutter SDK.
// ignore: deprecated_member_use
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:explore_mundo/main.dart';

void main() {
  testWidgets('Tela inicial exibe a barra de navegação e a pesquisa',
      (tester) async {
    await tester.pumpWidget(const ExploreMundoApp());

    expect(find.text('Explore Mundo'), findsWidgets);
    expect(find.text('Destinos'), findsOneWidget);
    expect(find.text('Pacotes de viagem'), findsOneWidget);
    expect(find.text('Contato'), findsOneWidget);
    expect(find.text('Sobre nós'), findsOneWidget);
    expect(find.text('Para onde você quer ir?'), findsOneWidget);
  });

  testWidgets('Pesquisa rápida filtra os destinos', (tester) async {
    await tester.pumpWidget(const ExploreMundoApp());

    await tester.enterText(find.byType(TextField), 'peru');
    await tester.pump();

    expect(find.textContaining('Resultados para "peru" (1)'), findsOneWidget);
  });
}
