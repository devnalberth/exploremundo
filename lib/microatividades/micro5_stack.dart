// Microatividade 5: Empilhamento de widgets com Stack.
// Executar com: flutter run -t lib/microatividades/micro5_stack.dart
// Mantém o Material do SDK sem adicionar pacotes, conforme o enunciado.
// ignore: deprecated_member_use
import 'package:flutter/material.dart';

void main() => runApp(const MicroStackApp());

class MicroStackApp extends StatelessWidget {
  const MicroStackApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Microatividade 5 - Stack')),
        body: Center(
          child: Stack(
            children: [
              Container(
                width: 250,
                height: 250,
                color: Colors.blue,
              ),
              Container(
                width: 200,
                height: 200,
                color: Colors.red,
              ),
              Container(
                width: 150,
                height: 150,
                color: Colors.yellow,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
