// Microatividade 3: Criação de layouts básicos com Row, Column, Icon e Text.
// Executar com: flutter run -t lib/microatividades/micro3_layout.dart
// Compatibilidade com o Material integrado ao Flutter SDK.
// ignore: deprecated_member_use
import 'package:flutter/material.dart';

void main() => runApp(const MicroLayoutApp());

class MicroLayoutApp extends StatelessWidget {
  const MicroLayoutApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Microatividade 3 - Layouts')),
        body: const Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[Icon(Icons.call), Text('Call')],
              ),
              Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[Icon(Icons.directions), Text('Route')],
              ),
              Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[Icon(Icons.share), Text('Share')],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
