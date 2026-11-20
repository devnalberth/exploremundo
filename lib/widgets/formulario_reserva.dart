// Mantém o Material do SDK sem adicionar pacotes, conforme o enunciado.
// ignore: deprecated_member_use
import 'package:flutter/material.dart';

import '../models/destino.dart';
import '../utils/formatadores.dart';

/// Abre o formulário de reserva em um BottomSheet (modal).
Future<void> mostrarFormularioReserva(BuildContext context, Destino destino) {
  return showModalBottomSheet<void>(
    context: context,
    isScrollControlled: true,
    showDragHandle: true,
    builder: (_) => FormularioReserva(destino: destino),
  );
}

/// Formulário para o cliente efetuar a reserva de uma viagem.
class FormularioReserva extends StatefulWidget {
  final Destino destino;

  const FormularioReserva({super.key, required this.destino});

  @override
  State<FormularioReserva> createState() => _FormularioReservaState();
}

class _FormularioReservaState extends State<FormularioReserva> {
  final _formKey = GlobalKey<FormState>();
  final _nomeController = TextEditingController();
  DateTime? _dataIda;
  bool _erroData = false;
  int _viajantes = 2;

  @override
  void dispose() {
    _nomeController.dispose();
    super.dispose();
  }

  Future<void> _escolherData() async {
    final hoje = DateTime.now();
    final data = await showDatePicker(
      context: context,
      initialDate: hoje.add(const Duration(days: 30)),
      firstDate: hoje,
      lastDate: hoje.add(const Duration(days: 730)),
      helpText: 'Data da viagem',
      cancelText: 'Cancelar',
      confirmText: 'OK',
    );
    if (data != null) {
      setState(() {
        _dataIda = data;
        _erroData = false;
      });
    }
  }

  void _confirmar() {
    final formularioValido = _formKey.currentState!.validate();
    if (_dataIda == null) setState(() => _erroData = true);
    if (!formularioValido || _dataIda == null) return;

    final total = widget.destino.precoAPartir * _viajantes;
    final messenger = ScaffoldMessenger.of(context);
    Navigator.pop(context);

    messenger.showSnackBar(
      SnackBar(
        duration: const Duration(seconds: 4),
        content: Text(
          'Reserva solicitada! ${widget.destino.nome} em '
          '${formatarData(_dataIda!)} para $_viajantes viajante(s). '
          'Total estimado: ${formatarPreco(total)}.',
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final total = widget.destino.precoAPartir * _viajantes;

    return Padding(
      padding: EdgeInsets.only(
        left: 24,
        right: 24,
        bottom: MediaQuery.of(context).viewInsets.bottom + 24,
      ),
      child: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'Reservar: ${widget.destino.nome}',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _nomeController,
                textCapitalization: TextCapitalization.words,
                decoration: const InputDecoration(
                  labelText: 'Nome completo',
                  prefixIcon: Icon(Icons.person),
                  border: OutlineInputBorder(),
                ),
                validator: (valor) => (valor == null || valor.trim().length < 3)
                    ? 'Informe seu nome completo'
                    : null,
              ),
              const SizedBox(height: 12),
              OutlinedButton.icon(
                onPressed: _escolherData,
                icon: const Icon(Icons.calendar_month),
                label: Text(
                  _dataIda == null
                      ? 'Escolher data da viagem'
                      : 'Ida em ${formatarData(_dataIda!)}',
                ),
              ),
              if (_erroData)
                Padding(
                  padding: const EdgeInsets.only(top: 6),
                  child: Text(
                    'Selecione a data da viagem',
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.error,
                      fontSize: 12,
                    ),
                  ),
                ),
              const SizedBox(height: 12),
              Row(
                children: [
                  const Text('Viajantes'),
                  const Spacer(),
                  IconButton(
                    onPressed:
                        _viajantes > 1 ? () => setState(() => _viajantes--) : null,
                    icon: const Icon(Icons.remove_circle_outline),
                  ),
                  Text(
                    '$_viajantes',
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  IconButton(
                    onPressed:
                        _viajantes < 10 ? () => setState(() => _viajantes++) : null,
                    icon: const Icon(Icons.add_circle_outline),
                  ),
                ],
              ),
              Text(
                'Total estimado: ${formatarPreco(total)}',
                textAlign: TextAlign.right,
                style: const TextStyle(fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 16),
              FilledButton.icon(
                onPressed: _confirmar,
                icon: const Icon(Icons.check),
                label: const Text('Confirmar reserva'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
