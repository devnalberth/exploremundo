import 'dart:async';

// Compatibilidade com o Material integrado ao Flutter SDK.
// ignore: deprecated_member_use
import 'package:flutter/material.dart';

import '../models/destino.dart';

/// Banner de destaque em forma de slideshow. Troca de imagem sozinho a cada
/// 4 segundos e, ao tocar em uma imagem, abre a página do destino.
class BannerDestaque extends StatefulWidget {
  final List<Destino> destinos;
  final ValueChanged<Destino> aoTocar;

  const BannerDestaque({
    super.key,
    required this.destinos,
    required this.aoTocar,
  });

  @override
  State<BannerDestaque> createState() => _BannerDestaqueState();
}

class _BannerDestaqueState extends State<BannerDestaque> {
  final PageController _controller = PageController();
  Timer? _timer;
  int _paginaAtual = 0;

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(const Duration(seconds: 4), (_) {
      if (!_controller.hasClients) return;
      final proxima = (_paginaAtual + 1) % widget.destinos.length;
      _controller.animateToPage(
        proxima,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 230,
      child: Stack(
        children: [
          PageView.builder(
            controller: _controller,
            itemCount: widget.destinos.length,
            onPageChanged: (indice) => setState(() => _paginaAtual = indice),
            itemBuilder: (context, indice) {
              final destino = widget.destinos[indice];
              return GestureDetector(
                onTap: () => widget.aoTocar(destino),
                child: _SlideDestino(destino: destino),
              );
            },
          ),
          // Indicadores (bolinhas) da página atual.
          Positioned(
            left: 0,
            right: 0,
            bottom: 10,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(widget.destinos.length, (indice) {
                final ativo = indice == _paginaAtual;
                return AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  margin: const EdgeInsets.symmetric(horizontal: 3),
                  width: ativo ? 20 : 8,
                  height: 8,
                  decoration: BoxDecoration(
                    color: ativo ? Colors.white : Colors.white54,
                    borderRadius: BorderRadius.circular(4),
                  ),
                );
              }),
            ),
          ),
        ],
      ),
    );
  }
}

/// Um slide do banner: imagem com o nome do destino sobreposto (Stack).
class _SlideDestino extends StatelessWidget {
  final Destino destino;

  const _SlideDestino({required this.destino});

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        Image.asset(destino.imagem, fit: BoxFit.cover),
        const DecoratedBox(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Colors.transparent, Colors.black87],
              stops: [0.4, 1.0],
            ),
          ),
        ),
        Positioned(
          top: 12,
          right: 12,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
            decoration: BoxDecoration(
              color: Colors.black45,
              borderRadius: BorderRadius.circular(20),
            ),
            child: const Text(
              'Toque para conhecer',
              style: TextStyle(color: Colors.white, fontSize: 12),
            ),
          ),
        ),
        Positioned(
          left: 16,
          right: 16,
          bottom: 30,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                destino.nome,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Row(
                children: [
                  const Icon(Icons.place, color: Colors.white70, size: 16),
                  const SizedBox(width: 4),
                  Text(
                    destino.local,
                    style: const TextStyle(color: Colors.white70),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
