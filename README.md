# 📱 my_first_app (Estudos de Flutter)

Este repositório foi criado com o objetivo de centralizar e documentar meus estudos práticos em **Flutter**. A ideia principal é realizar exercícios de criação de **Widgets** (dos mais básicos aos customizados) e documentar a evolução e o código de cada um deles dentro de um único aplicativo.

---

## 🚀 Objetivo do Projeto

- [x] Praticar e dominar os principais Widgets do Flutter (Stateless e Stateful).
- [x] Aprender sobre gerenciamento de estado e navegação.
- [ ] Criar componentes de UI reaproveitáveis (Custom Widgets).
- [x] Documentar o progresso para consultas futuras e compartilhamento com o time.

---

## 🛠️ Tecnologias Utilizadas

- **Flutter** (SDK v3.x.x ou superior — Dart `^3.11.5`)
- **Dart**
- **Pacotes:** [`flutter_svg`](https://pub.dev/packages/flutter_svg) — renderização de imagens vetoriais
- **IDE:** VS Code / Android Studio

---

## 📂 Organização dos Exercícios

Para manter o código limpo, o aplicativo está estruturado para que cada exercício/widget seja acessível através de uma tela de menu principal. 

Abaixo está a lista dos widgets já desenvolvidos ou em andamento. Legenda: `[x]` concluído · `🚧` em andamento · `[ ]` ainda não iniciado.

### 🟩 Widgets Básicos
- [x] **Text & TextStyle:** fontSize, fontWeight, color, textAlign — presente em praticamente todas as telas.
- [ ] **RichText & TextSpan:** vários estilos dentro de um mesmo parágrafo.
- [x] **Container & Padding:** `BoxDecoration` com color, `borderRadius` e `boxShadow`; `EdgeInsets` nas variações `all`, `symmetric` e `only` — `contador_page.dart`.
- [x] **Rows & Columns:** `Row`, `Column`, `Expanded`, `mainAxisAlignment` / `crossAxisAlignment` e `SizedBox` como espaçador — `lista_filmes_page.dart`, `PosteresPage.dart`.
- [x] **SafeArea & SingleChildScrollView:** respeitar as áreas do sistema e rolar conteúdo maior que a tela.
- [ ] **Stack:** sobreposição livre de elementos.

### 🟦 Widgets de Entrada (Formulários)
- [x] **TextField:** `TextEditingController`, `InputDecoration(hintText:)`, validação simples com `isEmpty` e descarte no `dispose()` — `lista_filmes_page.dart`.
- [x] **Buttons (Elevated, Outlined, Icon):** `onPressed`, `styleFrom` e estado desabilitado via `onPressed: null` — `contador_page.dart`.
- [ ] **TextButton** e **Form + TextFormField:** validação estruturada com `GlobalKey<FormState>`.

### 🟨 Widgets de Visualização de Dados
- [x] **ListView & ListView.builder:** `itemCount` + `itemBuilder` para listas dinâmicas — `home_page.dart`, `lista_filmes_page.dart`, `exercicios_page.dart`.
- [ ] **GridView:** grids de elementos.
- [x] **ListTile:** `leading`, `title`, `subtitle`, `trailing`, `onTap` e `contentPadding`.
- [ ] **Card:** elevação e `RoundedRectangleBorder` herdados do tema.

### 🖼️ Imagens
- [x] **Image.asset + declaração de assets no `pubspec.yaml`.**
- [x] **Caminhos centralizados** na classe `AppImages` (`lib/constants/app-images.dart`).
- [x] **BoxFit:** `cover`, `fill` e `contain` — diferença entre preencher, esticar e caber.
- [x] **ClipRRect:** recorte com cantos arredondados.
- [x] **CircleAvatar + AssetImage:** avatar redondo sem recorte manual.
- [x] **Image.network:** com `loadingBuilder` (spinner) e `errorBuilder` (fallback).
- [ ] 🚧 **SVG com `flutter_svg`:** `SvgPicture.asset` e troca de cor em tempo de execução via `colorFilter`.

### 🧭 Navegação e Estado
- [x] **Navigator.push + MaterialPageRoute:** empilhar telas.
- [x] **Passagem de dados por construtor:** `NotaPage(nota: 7)`, `DiaPage(dia: 2)`, `ContagemPage(total: 50)`.
- [x] **Retorno de dados da tela filha:** `Navigator.push<int>` + `Navigator.pop(context, valor)` — `EscolherMetaPage`.
- [x] **setState:** adicionar itens à lista, alternar `assistido`, atualizar métricas.
- [x] **Ciclo de vida:** `dispose()`, `Timer.periodic` e checagem de `mounted` antes de atualizar estado.
- [ ] **Rotas nomeadas** (`routes` / `onGenerateRoute`).
- [ ] **Gerenciamento de estado com pacote** (Provider, Riverpod ou BLoC).

### 🎯 Lógica Dart
- [x] **if / else if / else** — `NotaPage`, `classificar()`.
- [x] **switch / case** — `DiaPage`, `NivelPage`.
- [x] **Laço `for` construindo lista de widgets** — `ContagemPage`, `ProgressoPage`.
- [x] **Classes e modelos** — `Filme`, `Destino` em `lib/models/`.
- [x] **Null-safety:** `int?`, operador `??` e quando o `!` é seguro.
- [x] **`final` vs `var`:** o `final` protege a caixa, não o conteúdo.

### 🟪 Widgets Avançados / Customizados
- [ ] 🚧 **Custom Button:** já existe um protótipo funcional em `contador_page.dart` (`GestureDetector` + `AnimatedScale` + `Container` com sombra), mas ainda não foi extraído como widget reaproveitável nem recebeu gradiente.
- [x] **Stateful Widget Lab:** `ContadorProdutividade` — `setState`, `Timer.periodic`, `AnimatedScale` e captura de teclado com `Focus` + `LogicalKeyboardKey`.
- [ ] **Dark mode toggle / ThemeData customizado.**
- [ ] **Pasta `lib/widgets/`** com componentes próprios reaproveitados por mais de uma tela.

## ⚙️ Como Executar o Projeto

Para clonar e rodar este aplicativo localmente, você precisará do [Flutter](https://docs.flutter.dev/get-started/install) instalado em sua máquina.

1. **Clone o repositório:**
   ```bash
   git clone [https://github.com/Maskhugo/my_first_app.git](https://github.com/Maskhugo/my_first_app.git)
