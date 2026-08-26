# assets/images — insumos para as tarefas de Imagens 🖼️

Estas imagens foram adicionadas para você praticar **como importar, declarar e exibir imagens** no Flutter — do jeito que fazemos no app da Clickbus.

## O que tem aqui

| Arquivo | Tamanho | Ideia de uso na prática |
|---------|---------|--------------------------|
| `logo_watchlist.png` | 512×512 | logo do app (topo de uma tela / AppBar) |
| `poster_azul.png` | 300×450 | pôster de filme (proporção 2:3) |
| `poster_roxo.png` | 300×450 | pôster de filme |
| `poster_verde.png` | 300×450 | pôster de filme |
| `avatar.png` | 256×256 | foto de perfil redonda (`CircleAvatar`) |

## ⚠️ Importante: imagem no repositório ≠ imagem disponível no app
Só ter o arquivo aqui **não basta**. O Flutter só enxerga um asset depois que ele é **declarado no `pubspec.yaml`**. A primeira tarefa te ensina exatamente isso (atenção à indentação do YAML!). O caminho para usar no código é sempre relativo à raiz do projeto, por exemplo:

```dart
Image.asset('assets/images/logo_watchlist.png')
```

## Como a Clickbus organiza (você vai imitar isso)
No app da Clickbus os caminhos das imagens **não ficam soltos** pelo código — eles vivem numa classe de constantes (`CBImages`), assim:

```dart
abstract class CBImages {
  static const String logoSplash = 'assets/images/logo_splash.png';
  // ...
}
```

Você vai criar a sua versão disso (`AppImages`) nas tarefas. Bom estudo! 🚀
