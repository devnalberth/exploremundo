// Mantém o Material do SDK sem adicionar pacotes, conforme o enunciado.
// ignore: deprecated_member_use
import 'package:flutter/material.dart';

import '../models/destino.dart';
import '../routes.dart';
import '../utils/formatadores.dart';
import '../widgets/avaliacao_widget.dart';
import '../widgets/barra_navegacao.dart';
import '../widgets/formulario_reserva.dart';

/// Página de detalhes de um destino, construída seguindo o roteiro do
/// trabalho prático: imagem, seção de título, seção de botões e seção de
/// texto, organizadas em uma ListView.
class DestinoScreen extends StatelessWidget {
  final Destino destino;

  const DestinoScreen({super.key, required this.destino});

  void _mostrarMensagem(BuildContext context, String mensagem) {
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(SnackBar(content: Text(mensagem)));
  }

  /// Método auxiliar (Passo 6) que monta cada coluna de botão.
  Widget _buildButtonColumn(
    Color color,
    IconData icon,
    String label,
    VoidCallback onTap,
  ) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(8),
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: color),
            Container(
              margin: const EdgeInsets.only(top: 8),
              child: Text(
                label,
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: color,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final Color color = Theme.of(context).colorScheme.primary;

    // Passo 5: Seção de Título
    Widget titleSection = Container(
      padding: const EdgeInsets.all(32),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: Text(
                    destino.nome,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                Text(
                  destino.local,
                  style: TextStyle(color: Colors.grey[500]),
                ),
              ],
            ),
          ),
          AvaliacaoWidget(
            nota: destino.nota,
            totalAvaliacoes: destino.avaliacoes,
          ),
        ],
      ),
    );

    // Passo 6: Seção de Botões
    Widget buttonSection = Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _buildButtonColumn(
          color,
          Icons.call,
          'LIGAR',
          () => _mostrarMensagem(context, 'Ligando para $telefoneAgencia...'),
        ),
        _buildButtonColumn(
          color,
          Icons.near_me,
          'ROTA',
          () => _mostrarMensagem(context, 'Abrindo rota para ${destino.nome}...'),
        ),
        _buildButtonColumn(
          color,
          Icons.share,
          'COMPARTILHAR',
          () => _mostrarMensagem(
            context,
            'Link de ${destino.nome} copiado para compartilhar!',
          ),
        ),
      ],
    );

    // Passo 7: Seção de Texto
    Widget textSection = Container(
      padding: const EdgeInsets.all(32),
      child: Text(destino.descricao, softWrap: true),
    );

    // Reserva da viagem
    Widget reservaSection = Padding(
      padding: const EdgeInsets.fromLTRB(32, 0, 32, 32),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            'A partir de ${formatarPreco(destino.precoAPartir)} por pessoa',
            style: Theme.of(context).textTheme.titleMedium,
          ),
          const SizedBox(height: 12),
          FilledButton.icon(
            onPressed: () => mostrarFormularioReserva(context, destino),
            icon: const Icon(Icons.event_available),
            label: const Text('Reservar viagem'),
          ),
        ],
      ),
    );

    // Passos 8 e 9: Imagem + organização em ListView
    return Scaffold(
      appBar: construirAppBar(context, rotaAtual: Rotas.destinos),
      body: ListView(
        children: [
          Image.asset(
            destino.imagem,
            width: 600,
            height: 240,
            fit: BoxFit.cover,
          ),
          titleSection,
          buttonSection,
          textSection,
          reservaSection,
        ],
      ),
    );
  }
}
