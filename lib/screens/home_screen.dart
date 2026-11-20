// Mantém o Material do SDK sem adicionar pacotes, conforme o enunciado.
// ignore: deprecated_member_use
import 'package:flutter/material.dart';

import '../models/destino.dart';
import '../routes.dart';
import '../utils/formatadores.dart';
import '../widgets/banner_destaque.dart';
import '../widgets/barra_navegacao.dart';
import 'destino_screen.dart';

/// Tela inicial (seção "Destinos"): banner de destaque, pesquisa rápida e
/// lista de destinos.
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _buscaController = TextEditingController();
  String _termo = '';

  @override
  void dispose() {
    _buscaController.dispose();
    super.dispose();
  }

  /// Filtra os destinos pelo nome, local ou descrição, ignorando acentos.
  List<Destino> get _resultados {
    if (_termo.trim().isEmpty) return destinos;
    final termo = normalizar(_termo);
    return destinos
        .where((d) =>
            normalizar('${d.nome} ${d.local} ${d.descricao}').contains(termo))
        .toList();
  }

  void _abrirDestino(Destino destino) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => DestinoScreen(destino: destino)),
    );
  }

  void _limparBusca() {
    _buscaController.clear();
    setState(() => _termo = '');
  }

  @override
  Widget build(BuildContext context) {
    final resultados = _resultados;
    final pesquisando = _termo.trim().isNotEmpty;

    return Scaffold(
      appBar: construirAppBar(context, rotaAtual: Rotas.destinos),
      body: ListView(
        children: [
          BannerDestaque(destinos: destinos, aoTocar: _abrirDestino),

          // Pesquisa rápida
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 20, 16, 8),
            child: TextField(
              controller: _buscaController,
              onChanged: (valor) => setState(() => _termo = valor),
              textInputAction: TextInputAction.search,
              decoration: InputDecoration(
                hintText: 'Para onde você quer ir?',
                prefixIcon: const Icon(Icons.search),
                suffixIcon: pesquisando
                    ? IconButton(
                        tooltip: 'Limpar pesquisa',
                        icon: const Icon(Icons.clear),
                        onPressed: _limparBusca,
                      )
                    : null,
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.fromLTRB(16, 12, 16, 8),
            child: Text(
              pesquisando
                  ? 'Resultados para "$_termo" (${resultados.length})'
                  : 'Destinos em destaque',
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
          ),

          if (resultados.isEmpty)
            const Padding(
              padding: EdgeInsets.all(32),
              child: Column(
                children: [
                  Icon(Icons.travel_explore, size: 48, color: Colors.grey),
                  SizedBox(height: 8),
                  Text(
                    'Nenhum destino encontrado. Tente outro nome ou país.',
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            )
          else
            ...resultados.map(
              (destino) => Card(
                margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
                color: Colors.white,
                child: ListTile(
                  onTap: () => _abrirDestino(destino),
                  contentPadding: const EdgeInsets.all(10),
                  leading: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.asset(
                      destino.imagem,
                      width: 64,
                      height: 64,
                      fit: BoxFit.cover,
                    ),
                  ),
                  title: Text(
                    destino.nome,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text(
                    '${destino.local}\n'
                    'A partir de ${formatarPreco(destino.precoAPartir)}',
                  ),
                  isThreeLine: true,
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.star, color: Colors.red[500], size: 18),
                      const SizedBox(width: 2),
                      Text(formatarNota(destino.nota)),
                    ],
                  ),
                ),
              ),
            ),
          const SizedBox(height: 24),
        ],
      ),
    );
  }
}
