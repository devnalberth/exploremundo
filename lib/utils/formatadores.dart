/// Formata um valor em reais. Ex.: 4590 -> "R$ 4.590,00".
String formatarPreco(double valor) {
  final partes = valor.toStringAsFixed(2).split('.');
  final inteiro = partes[0];
  final buffer = StringBuffer();

  for (var i = 0; i < inteiro.length; i++) {
    final posicaoDoFim = inteiro.length - i;
    buffer.write(inteiro[i]);
    if (posicaoDoFim > 1 && posicaoDoFim % 3 == 1) {
      buffer.write('.');
    }
  }

  return 'R\$ ${buffer.toString()},${partes[1]}';
}

/// Formata a nota de avaliação. Ex.: 4.8 -> "4,8".
String formatarNota(double nota) => nota.toStringAsFixed(1).replaceAll('.', ',');

/// Formata uma data no padrão brasileiro. Ex.: 05/03/2027.
String formatarData(DateTime data) {
  final dia = data.day.toString().padLeft(2, '0');
  final mes = data.month.toString().padLeft(2, '0');
  return '$dia/$mes/${data.year}';
}

/// Remove acentos e deixa o texto em minúsculas, para a pesquisa rápida.
String normalizar(String texto) {
  const comAcento = 'áàâãäéèêëíìîïóòôõöúùûüç';
  const semAcento = 'aaaaaeeeeiiiiooooouuuuc';

  var resultado = texto.toLowerCase();
  for (var i = 0; i < comAcento.length; i++) {
    resultado = resultado.replaceAll(comAcento[i], semAcento[i]);
  }
  return resultado.trim();
}
