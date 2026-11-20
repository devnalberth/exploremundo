// Compatibilidade com o Material integrado ao Flutter SDK.
// ignore: deprecated_member_use
import 'package:flutter/material.dart';

import '../routes.dart';
import '../widgets/barra_navegacao.dart';

/// Seção "Sobre nós": apresentação da agência Explore Mundo.
class SobreScreen extends StatelessWidget {
  const SobreScreen({super.key});

  Widget _numero(Color cor, String valor, String rotulo) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          valor,
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: cor,
          ),
        ),
        const SizedBox(height: 4),
        Text(rotulo, style: const TextStyle(fontSize: 12)),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final cor = Theme.of(context).colorScheme.primary;

    return Scaffold(
      appBar: construirAppBar(context, rotaAtual: Rotas.sobre),
      body: ListView(
        children: [
          // Cabeçalho: imagem com o logotipo sobreposto (Stack).
          SizedBox(
            height: 220,
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                Positioned.fill(
                  bottom: 40,
                  child: Image.asset(
                    'images/machu_picchu.jpg',
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  left: 0,
                  right: 0,
                  bottom: 0,
                  child: Center(
                    child: CircleAvatar(
                      radius: 42,
                      backgroundColor: Colors.white,
                      child: CircleAvatar(
                        radius: 38,
                        backgroundColor: cor,
                        child: const Icon(
                          Icons.public,
                          size: 40,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 12),
          const Text(
            'Explore Mundo',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          const Text(
            'Agência de Viagens',
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.grey),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 24),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Flexible(child: _numero(cor, '12', 'anos de estrada')),
                Flexible(child: _numero(cor, '35 mil', 'viajantes')),
                Flexible(child: _numero(cor, '80+', 'destinos')),
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 32),
            child: Text(
              'A Explore Mundo nasceu com o propósito de transformar sonhos em '
              'roteiros. Planejamos viagens nacionais e internacionais sob '
              'medida, cuidando de cada detalhe, da passagem aérea à '
              'hospedagem e aos passeios, para que nossos clientes só se '
              'preocupem em aproveitar.',
              softWrap: true,
            ),
          ),
          const SizedBox(height: 16),
          const ListTile(
            leading: Icon(Icons.verified_user),
            title: Text('Segurança'),
            subtitle: Text('Parceiros certificados e suporte durante toda a viagem.'),
          ),
          const ListTile(
            leading: Icon(Icons.favorite),
            title: Text('Atendimento humano'),
            subtitle: Text('Consultores que conhecem os destinos de perto.'),
          ),
          const ListTile(
            leading: Icon(Icons.savings),
            title: Text('Preço justo'),
            subtitle: Text('Pacotes com parcelamento e sem taxas escondidas.'),
          ),
          const SizedBox(height: 24),
        ],
      ),
    );
  }
}
