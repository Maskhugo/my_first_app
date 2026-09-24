# ✅ Plano de Ação — Itens Pendentes do README

Continuação do checklist do [README.md](README.md). Os itens **RichText & TextSpan**, **Card** e **SVG com `colorFilter`** já foram concluídos e marcados por lá. Abaixo estão os passos para o que falta.

---

## 1. Stack — sobreposição livre de elementos

- [ ] Escolher onde aplicar: badge sobre o SVG do Rockstar (`rockstargames_page.dart`) ou selo sobre o `Container` de métricas (`contador_page.dart`)
- [ ] Trocar o widget escolhido por um `Stack`
- [ ] Posicionar o elemento sobreposto com `Positioned`
- [ ] Rodar `dart analyze` e `dart format` no arquivo alterado
- [ ] Marcar `[x]` no README.md (seção 🟩 Widgets Básicos)

## 2. GridView — `posteres_page.dart`

- [ ] Ler como a tela monta a lista de pôsteres hoje (`Row`/`Column`?)
- [ ] Trocar por `GridView.builder` + `SliverGridDelegateWithFixedCrossAxisCount`
- [ ] Ajustar `crossAxisCount`, `childAspectRatio` e espaçamento até ficar legível
- [ ] Rodar `dart analyze` e `dart format` no arquivo alterado
- [ ] Marcar `[x]` no README.md (seção 🟨 Widgets de Visualização de Dados)

## 3. TextButton + Form/TextFormField — `lista_filmes_page.dart`

- [ ] Trocar o `TextField` solto por um `Form` com `GlobalKey<FormState>`
- [ ] Trocar `TextField` por `TextFormField` com `validator` (substituindo a checagem manual de `isEmpty`)
- [ ] Chamar `formKey.currentState!.validate()` antes de adicionar o filme
- [ ] Adicionar um `TextButton` de "Cancelar" ao lado do botão de adicionar
- [ ] Rodar `dart analyze` e `dart format` no arquivo alterado
- [ ] Marcar `[x]` no README.md (seção 🟦 Widgets de Entrada)

## 4. Rotas nomeadas — `main.dart`

- [ ] Escolher 2-3 telas pra migrar primeiro (ex: Sobre, Contador)
- [ ] Adicionar `routes: {...}` no `MaterialApp`
- [ ] Trocar os `Navigator.push(MaterialPageRoute(...))` dessas telas por `Navigator.pushNamed`
- [ ] Rodar `dart analyze` e `dart format` nos arquivos alterados
- [ ] Marcar `[x]` no README.md (seção 🧭 Navegação e Estado)

## 5. Combo: Provider + Dark mode + `lib/widgets/`

- [ ] Adicionar `provider` no `pubspec.yaml` (`flutter pub add provider`)
- [ ] Criar `lib/providers/theme_provider.dart` com um `ChangeNotifier` (`isDarkMode`, método `toggle()`)
- [ ] Criar `lib/widgets/custom_press_button.dart` extraindo o `GestureDetector` + `AnimatedScale` + `Container` do `contador_page.dart`
- [ ] Adicionar `gradient` no `BoxDecoration` desse botão extraído
- [ ] Envolver `main.dart` com `ChangeNotifierProvider(create: (_) => ThemeProvider())`
- [ ] Ligar `theme` / `darkTheme` / `themeMode` do `MaterialApp` ao provider
- [ ] Adicionar um `Switch` ou `IconButton` na `AppBar` da `HomePage` pra chamar `context.read<ThemeProvider>().toggle()`
- [ ] Substituir o botão original do `contador_page.dart` pelo widget extraído
- [ ] Rodar `dart analyze` e `dart format` nos arquivos alterados
- [ ] Marcar `[x]` no README.md (seções 🧭 Navegação e Estado e 🟪 Widgets Avançados/Customizados, 3 itens)

---

## Ordem sugerida

1. Stack (rápido)
2. GridView (médio)
3. TextButton + Form (médio)
4. Rotas nomeadas (médio)
5. Combo Provider + Dark mode + `lib/widgets/` (mais trabalhoso, mas fecha 3 itens de uma vez)
