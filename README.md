# Explore Mundo ✈️

Aplicativo da agência de viagens **Explore Mundo**, desenvolvido em Flutter como Trabalho Prático da disciplina **DGT2812 – Desenvolvimento de Aplicativos Móveis com Flutter** (Estácio).

**Aluno:** Matheus Nalberth Gonçalves Da Silva

## Funcionalidades

- **Banner de destaque:** slideshow automático com os destinos; ao tocar em uma imagem, abre a página do destino.
- **Barra de navegação superior:** links para *Destinos*, *Pacotes de viagem*, *Contato* e *Sobre nós*.
- **Pesquisa rápida:** filtra os destinos por nome, país ou descrição, ignorando acentos.
- **Página do destino:** imagem, seção de título com avaliação em estrelas, botões (Ligar, Rota, Compartilhar), descrição e reserva.
- **Avaliação interativa:** widget personalizado que permite favoritar o destino e atualiza o total de avaliações.
- **Reserva de viagem:** formulário em *bottom sheet* com nome, data da viagem e número de viajantes, com total estimado.
- **Pacotes de viagem, Contato e Sobre nós.**

## Estrutura

```
lib/
├── main.dart                  # MaterialApp, tema e rotas
├── routes.dart                # Nomes das rotas
├── models/destino.dart        # Modelos Destino e Pacote + dados
├── screens/                   # Telas do app
│   ├── home_screen.dart       # Banner + pesquisa + lista de destinos
│   ├── destino_screen.dart    # Layout do roteiro (título, botões, texto)
│   ├── pacotes_screen.dart
│   ├── contato_screen.dart
│   └── sobre_screen.dart
├── widgets/                   # Componentes reutilizáveis
│   ├── barra_navegacao.dart
│   ├── banner_destaque.dart
│   ├── avaliacao_widget.dart
│   └── formulario_reserva.dart
├── utils/formatadores.dart    # Preço, nota, data e normalização de texto
└── microatividades/           # Microatividades 2 a 5
images/                        # Imagens dos destinos
docs/                          # Documentação do projeto (PDF)
test/widget_test.dart          # Testes de widget
```

## Como executar

Pré-requisitos: Flutter SDK 3.x, Android Studio (ou VS Code) e um emulador.

```bash
git clone https://github.com/devnalberth/explore-mundo.git
cd explore-mundo
flutter create --project-name explore_mundo .   # gera as pastas android/ios/web
flutter pub get
flutter run
```

O comando `flutter create .` só cria os arquivos que estão faltando (pastas das plataformas) e não sobrescreve o código existente.

### Microatividades

```bash
flutter run -t lib/microatividades/micro2_material_app.dart
flutter run -t lib/microatividades/micro3_layout.dart
flutter run -t lib/microatividades/micro4_listview.dart
flutter run -t lib/microatividades/micro5_stack.dart
```

### Testes

```bash
flutter test
```

## Imagens

As imagens em `images/` são ilustrações. Para usar fotos reais, substitua os arquivos mantendo os mesmos nomes.
