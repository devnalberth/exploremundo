/// Modelo de um destino oferecido pela agência.
class Destino {
  final String id;
  final String nome;
  final String local;
  final String imagem;
  final String descricao;
  final double nota;
  final int avaliacoes;
  final double precoAPartir;

  const Destino({
    required this.id,
    required this.nome,
    required this.local,
    required this.imagem,
    required this.descricao,
    required this.nota,
    required this.avaliacoes,
    required this.precoAPartir,
  });
}

/// Modelo de um pacote de viagem.
class Pacote {
  final String titulo;
  final Destino destino;
  final int dias;
  final double preco;
  final List<String> inclui;

  const Pacote({
    required this.titulo,
    required this.destino,
    required this.dias,
    required this.preco,
    required this.inclui,
  });
}

/// Telefone fictício da agência, usado nos botões de contato.
const String telefoneAgencia = '(82) 4000-1234';

const List<Destino> destinos = [
  Destino(
    id: 'lago-oeschinen',
    nome: 'Lago Oeschinen',
    local: 'Kandersteg, Suíça',
    imagem: 'images/lago_oeschinen.jpg',
    nota: 4.9,
    avaliacoes: 412,
    precoAPartir: 12890,
    descricao:
        'O Lago Oeschinen fica aos pés do Blüemlisalp, nos Alpes Berneses. '
        'Situado a 1.578 metros acima do nível do mar, é um dos lagos alpinos '
        'mais amplos. Um passeio de teleférico a partir de Kandersteg, seguido '
        'por meia hora de caminhada por pastagens e floresta de pinheiros, leva '
        'você ao lago, que aquece até 20 graus Celsius no verão. As atividades '
        'desfrutadas aqui incluem remo e passeios no tobogã de verão.',
  ),
  Destino(
    id: 'maragogi',
    nome: 'Maragogi',
    local: 'Alagoas, Brasil',
    imagem: 'images/maragogi.jpg',
    nota: 4.8,
    avaliacoes: 1280,
    precoAPartir: 1490,
    descricao:
        'Conhecido como o Caribe Brasileiro, Maragogi encanta com suas águas '
        'cristalinas em tons de azul e verde. O grande destaque são as galés, '
        'piscinas naturais formadas pelos recifes de corais a alguns '
        'quilômetros da costa, ideais para mergulho livre e observação de '
        'peixes coloridos. O passeio é feito de catamarã, de acordo com a tábua '
        'das marés.',
  ),
  Destino(
    id: 'noronha',
    nome: 'Fernando de Noronha',
    local: 'Pernambuco, Brasil',
    imagem: 'images/fernando_de_noronha.jpg',
    nota: 4.9,
    avaliacoes: 986,
    precoAPartir: 3890,
    descricao:
        'O arquipélago de Fernando de Noronha reúne algumas das praias mais '
        'bonitas do mundo, como a Baía do Sancho e a Baía dos Porcos, com vista '
        'para o Morro Dois Irmãos. É um paraíso para quem gosta de mergulho, '
        'trilhas e observação de golfinhos. O acesso é controlado para '
        'preservar o ecossistema, por isso é preciso planejar a viagem com '
        'antecedência.',
  ),
  Destino(
    id: 'paris',
    nome: 'Paris',
    local: 'Île-de-France, França',
    imagem: 'images/paris.jpg',
    nota: 4.7,
    avaliacoes: 2140,
    precoAPartir: 8990,
    descricao:
        'A Cidade Luz combina história, arte e gastronomia em cada esquina. '
        'Visite a Torre Eiffel ao entardecer, explore as obras do Museu do '
        'Louvre, caminhe pelo bairro de Montmartre e faça um passeio de barco '
        'pelo Rio Sena. Os cafés e as confeitarias completam a experiência '
        'parisiense.',
  ),
  Destino(
    id: 'machu-picchu',
    nome: 'Machu Picchu',
    local: 'Cusco, Peru',
    imagem: 'images/machu_picchu.jpg',
    nota: 4.8,
    avaliacoes: 1532,
    precoAPartir: 7490,
    descricao:
        'A cidadela inca de Machu Picchu fica no alto das montanhas dos Andes, '
        'a cerca de 2.400 metros de altitude, e é uma das Novas Sete Maravilhas '
        'do Mundo. A viagem pode ser feita de trem panorâmico a partir de Cusco '
        'ou pela tradicional Trilha Inca, passando por paisagens de vales e '
        'picos nevados.',
  ),
];

final List<Pacote> pacotes = [
  Pacote(
    titulo: 'Alpes Suíços Clássico',
    destino: destinos[0],
    dias: 8,
    preco: 12890,
    inclui: const ['Aéreo', 'Hotel com café', 'Teleférico', 'Guia em português'],
  ),
  Pacote(
    titulo: 'Caribe Brasileiro',
    destino: destinos[1],
    dias: 5,
    preco: 1490,
    inclui: const ['Pousada pé na areia', 'Passeio às galés', 'Traslado'],
  ),
  Pacote(
    titulo: 'Noronha Essencial',
    destino: destinos[2],
    dias: 6,
    preco: 3890,
    inclui: const ['Aéreo', 'Pousada', 'Ilha Tour', 'Passeio de barco'],
  ),
  Pacote(
    titulo: 'Paris Romântica',
    destino: destinos[3],
    dias: 7,
    preco: 8990,
    inclui: const ['Aéreo', 'Hotel', 'Cruzeiro no Sena', 'Ingresso do Louvre'],
  ),
  Pacote(
    titulo: 'Caminhos Incas',
    destino: destinos[4],
    dias: 9,
    preco: 7490,
    inclui: const ['Aéreo', 'Hotel em Cusco', 'Trem panorâmico', 'Ingresso'],
  ),
];
