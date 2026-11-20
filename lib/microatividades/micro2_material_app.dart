// Microatividade 2: Widgets básicos - MaterialApp, Scaffold e AppBar.
// Executar com: flutter run -t lib/microatividades/micro2_material_app.dart
// Compatibilidade com o Material integrado ao Flutter SDK.
// ignore: deprecated_member_use
import 'package:flutter/material.dart';

void main() {
  runApp(
    const MaterialApp(
      home: StatelessWidgetExemplo('Olá Flutter - MaterialApp'),
    ),
  );
}

class StatelessWidgetExemplo extends StatelessWidget {
  final String _appBarTitle;

  const StatelessWidgetExemplo(this._appBarTitle, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_appBarTitle),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text('Macoratti .net'),
            const SizedBox(height: 16),
            // O RaisedButton foi removido do Flutter 3; o substituto oficial
            // é o ElevatedButton.
            ElevatedButton(
              onPressed: () => ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Botão pressionado!')),
              ),
              child: const Text('Clique aqui'),
            ),
          ],
        ),
      ),
    );
  }
}
