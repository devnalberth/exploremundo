// Compatibilidade com o Material integrado ao Flutter SDK.
// ignore: deprecated_member_use
import 'package:flutter/material.dart';

import 'routes.dart';
import 'screens/contato_screen.dart';
import 'screens/home_screen.dart';
import 'screens/pacotes_screen.dart';
import 'screens/sobre_screen.dart';

void main() => runApp(const ExploreMundoApp());

/// Widget raiz do aplicativo da agência de viagens Explore Mundo.
class ExploreMundoApp extends StatelessWidget {
  const ExploreMundoApp({super.key});

  static const Color corPrincipal = Color(0xFF0B6E99);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Explore Mundo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: corPrincipal),
        scaffoldBackgroundColor: const Color(0xFFF4F7FA),
        appBarTheme: const AppBarTheme(
          backgroundColor: corPrincipal,
          foregroundColor: Colors.white,
          centerTitle: false,
        ),
      ),
      initialRoute: Rotas.destinos,
      routes: {
        Rotas.destinos: (_) => const HomeScreen(),
        Rotas.pacotes: (_) => const PacotesScreen(),
        Rotas.contato: (_) => const ContatoScreen(),
        Rotas.sobre: (_) => const SobreScreen(),
      },
    );
  }
}
