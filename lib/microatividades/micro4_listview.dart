// Microatividade 4: Utilização do Widget ListView com ListTile.
// Executar com: flutter run -t lib/microatividades/micro4_listview.dart
// Compatibilidade com o Material integrado ao Flutter SDK.
// ignore: deprecated_member_use
import 'package:flutter/material.dart';

void main() => runApp(const MicroListViewApp());

class MicroListViewApp extends StatelessWidget {
  const MicroListViewApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Microatividade 4 - ListView')),
        body: ListView(
          children: const [
            ListTile(
              title: Text('Flutter'),
              subtitle: Text('Tudo é um widget'),
              leading: Icon(Icons.flash_on),
              trailing: Icon(Icons.keyboard_arrow_right),
            ),
            ListTile(
              title: Text('Dart'),
              subtitle: Text('É fácil'),
              leading: Icon(Icons.mood),
              trailing: Icon(Icons.keyboard_arrow_right),
            ),
            ListTile(
              title: Text('Firebase'),
              subtitle: Text('Combina com Flutter'),
              leading: Icon(Icons.whatshot),
              trailing: Icon(Icons.keyboard_arrow_right),
            ),
          ],
        ),
      ),
    );
  }
}
