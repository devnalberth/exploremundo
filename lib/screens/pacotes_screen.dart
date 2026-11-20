// Mantém o Material do SDK sem adicionar pacotes, conforme o enunciado.
// ignore: deprecated_member_use
import 'package:flutter/material.dart';

import '../models/destino.dart';
import '../routes.dart';
import '../utils/formatadores.dart';
import '../widgets/barra_navegacao.dart';
import '../widgets/formulario_reserva.dart';
import 'destino_screen.dart';

/// Seção "Pacotes de viagem": lista dos pacotes oferecidos pela agência.
class PacotesScreen extends StatelessWidget {
  const PacotesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: construirAppBar(context, rotaAtual: Rotas.pacotes),
      body: ListView.builder(
        padding: const EdgeInsets.symmetric(vertical: 12),
        itemCount: pacotes.length,
        itemBuilder: (context, indice) => _CardPacote(pacote: pacotes[indice]),
      ),
    );
  }
}

class _CardPacote extends StatelessWidget {
  final Pacote pacote;

  const _CardPacote({required this.pacote});

  @override
  Widget build(BuildContext context) {
    final cores = Theme.of(context).colorScheme;

    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      color: Colors.white,
      clipBehavior: Clip.antiAlias,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Imagem com o selo de duração sobreposto (Stack).
          SizedBox(
            height: 150,
            width: double.infinity,
            child: Stack(
              fit: StackFit.expand,
              children: [
                Image.asset(pacote.destino.imagem, fit: BoxFit.cover),
                Positioned(
                  top: 12,
                  left: 12,
                  child: Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                    decoration: BoxDecoration(
                      color: cores.primary,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      '${pacote.dias} dias',
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  pacote.titulo,
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium
                      ?.copyWith(fontWeight: FontWeight.bold),
                ),
                Text(
                  pacote.destino.local,
                  style: TextStyle(color: Colors.grey[600]),
                ),
                const SizedBox(height: 10),
                Wrap(
                  spacing: 6,
                  runSpacing: 6,
                  children: pacote.inclui
                      .map((item) => Chip(
                            label: Text(item),
                            visualDensity: VisualDensity.compact,
                          ))
                      .toList(),
                ),
                const SizedBox(height: 12),
                Text(
                  formatarPreco(pacote.preco),
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: cores.primary,
                  ),
                ),
                const Text('por pessoa', style: TextStyle(fontSize: 12)),
                const SizedBox(height: 12),
                Row(
                  children: [
                    Expanded(
                      child: OutlinedButton(
                        onPressed: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) =>
                                DestinoScreen(destino: pacote.destino),
                          ),
                        ),
                        child: const Text('Ver destino'),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: FilledButton(
                        onPressed: () =>
                            mostrarFormularioReserva(context, pacote.destino),
                        child: const Text('Reservar'),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
