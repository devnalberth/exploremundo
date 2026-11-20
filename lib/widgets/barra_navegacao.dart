// Compatibilidade com o Material integrado ao Flutter SDK.
// ignore: deprecated_member_use
import 'package:flutter/material.dart';

import '../routes.dart';

class _LinkNavegacao {
  final String rota;
  final String rotulo;
  final IconData icone;

  const _LinkNavegacao(this.rota, this.rotulo, this.icone);
}

/// Barra de navegação superior com os links para as seções do app:
/// Destinos, Pacotes de viagem, Contato e Sobre nós.
class BarraNavegacao extends StatelessWidget implements PreferredSizeWidget {
  final String rotaAtual;

  const BarraNavegacao({super.key, required this.rotaAtual});

  static const List<_LinkNavegacao> _links = [
    _LinkNavegacao(Rotas.destinos, 'Destinos', Icons.explore),
    _LinkNavegacao(Rotas.pacotes, 'Pacotes de viagem', Icons.card_travel),
    _LinkNavegacao(Rotas.contato, 'Contato', Icons.support_agent),
    _LinkNavegacao(Rotas.sobre, 'Sobre nós', Icons.info_outline),
  ];

  @override
  Size get preferredSize => const Size.fromHeight(52);

  @override
  Widget build(BuildContext context) {
    final rotaDaTela = ModalRoute.of(context)?.settings.name;

    return SizedBox(
      height: 52,
      child: ListView(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 8),
        children: _links.map((link) {
          final ativo = link.rota == rotaAtual;

          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 8),
            child: TextButton.icon(
              onPressed: () {
                // Evita recarregar a seção quando o usuário já está nela.
                if (rotaDaTela == link.rota) return;
                Navigator.pushNamedAndRemoveUntil(
                  context,
                  link.rota,
                  (route) => false,
                );
              },
              icon: Icon(link.icone, size: 18),
              label: Text(link.rotulo),
              style: TextButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: ativo ? Colors.white24 : Colors.transparent,
                shape: const StadiumBorder(),
                padding: const EdgeInsets.symmetric(horizontal: 14),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}

/// AppBar padrão do aplicativo, com o título da agência e a barra de navegação.
PreferredSizeWidget construirAppBar(
  BuildContext context, {
  required String rotaAtual,
}) {
  return AppBar(
    title: const Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(Icons.flight_takeoff),
        SizedBox(width: 8),
        Text(
          'Explore Mundo',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ],
    ),
    bottom: BarraNavegacao(rotaAtual: rotaAtual),
  );
}
