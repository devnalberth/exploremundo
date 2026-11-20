// Compatibilidade com o Material integrado ao Flutter SDK.
// ignore: deprecated_member_use
import 'package:flutter/material.dart';

import '../utils/formatadores.dart';

/// Widget personalizado de avaliação (Microatividade 5 / Trabalho Prático).
///
/// Mostra a nota em estrelas do destino e permite ao usuário favoritá-lo.
/// Ao tocar na estrela, o estado muda (estrela cheia/vazia) e o total de
/// avaliações é atualizado, sem precisar reconstruir a tela inteira.
class AvaliacaoWidget extends StatefulWidget {
  final double nota;
  final int totalAvaliacoes;

  const AvaliacaoWidget({
    super.key,
    required this.nota,
    required this.totalAvaliacoes,
  });

  @override
  State<AvaliacaoWidget> createState() => _AvaliacaoWidgetState();
}

class _AvaliacaoWidgetState extends State<AvaliacaoWidget> {
  bool _favoritado = false;
  late int _total;

  @override
  void initState() {
    super.initState();
    _total = widget.totalAvaliacoes;
  }

  void _alternarFavorito() {
    setState(() {
      _total += _favoritado ? -1 : 1;
      _favoritado = !_favoritado;
    });

    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(
        SnackBar(
          duration: const Duration(seconds: 1),
          content: Text(
            _favoritado
                ? 'Destino adicionado aos favoritos!'
                : 'Destino removido dos favoritos.',
          ),
        ),
      );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        IconButton(
          tooltip: _favoritado ? 'Remover dos favoritos' : 'Favoritar',
          onPressed: _alternarFavorito,
          color: Colors.red[500],
          icon: Icon(_favoritado ? Icons.star : Icons.star_border),
        ),
        Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              formatarNota(widget.nota),
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            Text(
              '($_total)',
              style: TextStyle(fontSize: 12, color: Colors.grey[600]),
            ),
          ],
        ),
      ],
    );
  }
}
