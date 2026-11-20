// Compatibilidade com o Material integrado ao Flutter SDK.
// ignore: deprecated_member_use
import 'package:flutter/material.dart';

import '../models/destino.dart';
import '../routes.dart';
import '../widgets/barra_navegacao.dart';

/// Seção "Contato": canais de atendimento e formulário de mensagem.
class ContatoScreen extends StatefulWidget {
  const ContatoScreen({super.key});

  @override
  State<ContatoScreen> createState() => _ContatoScreenState();
}

class _ContatoScreenState extends State<ContatoScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nomeController = TextEditingController();
  final _emailController = TextEditingController();
  final _mensagemController = TextEditingController();

  @override
  void dispose() {
    _nomeController.dispose();
    _emailController.dispose();
    _mensagemController.dispose();
    super.dispose();
  }

  void _enviar() {
    if (!_formKey.currentState!.validate()) return;

    final nome = _nomeController.text.trim().split(' ').first;
    _formKey.currentState!.reset();
    _nomeController.clear();
    _emailController.clear();
    _mensagemController.clear();
    FocusScope.of(context).unfocus();

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          'Obrigado, $nome! Nossa equipe responderá em até 24 horas.',
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: construirAppBar(context, rotaAtual: Rotas.contato),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Text(
            'Fale com a nossa equipe',
            style: Theme.of(context)
                .textTheme
                .titleLarge
                ?.copyWith(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          const Card(
            color: Colors.white,
            child: Column(
              children: [
                ListTile(
                  leading: Icon(Icons.phone),
                  title: Text('Telefone'),
                  subtitle: Text(telefoneAgencia),
                ),
                ListTile(
                  leading: Icon(Icons.chat),
                  title: Text('WhatsApp'),
                  subtitle: Text('(82) 99999-0000'),
                ),
                ListTile(
                  leading: Icon(Icons.email),
                  title: Text('E-mail'),
                  subtitle: Text('contato@exploremundo.com.br'),
                ),
                ListTile(
                  leading: Icon(Icons.schedule),
                  title: Text('Atendimento'),
                  subtitle: Text('Segunda a sábado, das 8h às 18h'),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          Text(
            'Envie uma mensagem',
            style: Theme.of(context).textTheme.titleMedium,
          ),
          const SizedBox(height: 12),
          Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                TextFormField(
                  controller: _nomeController,
                  decoration: const InputDecoration(
                    labelText: 'Nome',
                    border: OutlineInputBorder(),
                  ),
                  validator: (valor) => (valor == null || valor.trim().isEmpty)
                      ? 'Informe seu nome'
                      : null,
                ),
                const SizedBox(height: 12),
                TextFormField(
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: const InputDecoration(
                    labelText: 'E-mail',
                    border: OutlineInputBorder(),
                  ),
                  validator: (valor) {
                    final email = valor?.trim() ?? '';
                    final valido = RegExp(r'^[^@\s]+@[^@\s]+\.[^@\s]+$')
                        .hasMatch(email);
                    return valido ? null : 'Informe um e-mail válido';
                  },
                ),
                const SizedBox(height: 12),
                TextFormField(
                  controller: _mensagemController,
                  maxLines: 4,
                  decoration: const InputDecoration(
                    labelText: 'Mensagem',
                    alignLabelWithHint: true,
                    border: OutlineInputBorder(),
                  ),
                  validator: (valor) =>
                      (valor == null || valor.trim().length < 10)
                          ? 'Escreva pelo menos 10 caracteres'
                          : null,
                ),
                const SizedBox(height: 16),
                FilledButton.icon(
                  onPressed: _enviar,
                  icon: const Icon(Icons.send),
                  label: const Text('Enviar mensagem'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
