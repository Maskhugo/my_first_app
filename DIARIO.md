//Emojis para finalizar dificuldades <🔴 🟡 🟢>

Task 1 - < 🟡 Média > - Dificuldade com sintaxe e com a lógica de vincular eventos com um wigdet. (apesar de ter funcionado, acabei quebrando de alguma forma a disposição dos demais elementos na tela).

Task 2 - < 🔴 Dificil > - As maiores dificuldades foram referente à sintaxe e estrutura da linguagem Dart.

Task 3 - < 🔴 Dificil > - Consegui compreender a lógica dos requisitos, mas enfrentei dificuldades estruturais relacionadas à sintaxe e organização do Flutter.

Task 4 - < 🔴 Dificil > - dificuldades nesta tarefa envolveram um erro estrutural de sintaxe com uma chave excedente, a desorganização na indentação da árvore de widgets e problemas apara apresentar todas a linhas da lista na visualização na pagina de progresso.

---

## Tarefas de reforço:

Task 1 - < 🟢 Fácil > - Nesta tarefa por já se familiarizar com o que fizemos nas anteriores, eu já tive um pouco mais de facilidade de concluir-la

Task 2 - < 🟢 Fácil > - Foi uma feat bacana de implementar e bater de frente com alguns dificuldades que tenho com estrutura de widgets. 

Task 3 - < 🟡 Média > - Apesar de concluir a tarefa, tive alguns problemas durante o processo com case Sensitivity do dart e estrutura de widgets e hierarquia que só consegui resolver com apoio de IA.

Task 4 - < 🟢 Fácil > É possivel identificar uma evolução ao lidar com sintaxes e estruturas, mesmo compartilhando enfrentando problemas similares as tasks anteriores.

Task 5 - < 🟢 Fácil > Não gosto de ser redundante, mas é nitido como houve evolução comparado com os ultimos exercicios, com mais segurança no momento de encarar um erro de estrutura/sintaxe.

---

## Tarefas — Dados, Listas e Organização de Código

Task 1 - < 🟢 Fácil > Primeira tarefa de organização em vez de nova funcionalidade: movi as telas BoasVindasPage e MinhasCoisas do main.dart para arquivos próprios dentro de lib/pages/. O aprendizado principal foi entender que o `import` é o que conecta um arquivo ao outro. No final das contas o código está começando a deixar de ser um "linguição" dificil de se localizar

Task 2 - < 🟡 Média > Criei a classe Filme em lib/models/ e uma List<Filme> com 3 filmes na nova ListaFilmesPage. O que ficou claro é a diferença entre o molde e as cópias: a classe Filme só descreve o formato do dado (título, assistido, nota), e cada Filme(...) que eu escrevo é um objeto de verdade guardado na lista. Também entendi o papel do `?` no `int? nota` — é o jeito do Dart aceitar que um filme ainda não tem nota, em vez de me obrigar a inventar um número. Foi a primeira vez que separei dado de tela em pastas diferentes (models e pages).

Task 3 - < 🟡 Média > Troquei o Text da contagem por um ListView.builder na ListaFilmesPage. 
A virada de chave foi entender que eu não escrevo mais um widget para cada filme na mão, eu só preciso dizer quantos são (com o itemCount) e ensino como montar UM item com itemBuilder, e o Flutter repete isso sozinho para cada índice. Ainda estou com alguns problema no momento de construir a lógica dos builders, mas o Claude me ajudou a entender melhor destravar.

Task 4 - < 🟡 Média > Esse foi o desafio mais dificil até agora, consegui colocar em prática alguns conceitos que ando estudando como StatefulWidgets e setState, mas apesar de conseguir entender o código rodando, eu ainda precisei de um apoio do Claude para chegar no resultado final.

Task 5 - < 🟡 Média > Gostei bastante desta task pois colocou em pratica a questão de se preocupar com null no código, se não houvesse aquele disclaimer no exercicio provávelmente eu teria quebrado o código.

Task bônus - < 🟡 Média > Coloquei um onTap no ListTile que inverte o filme.assistido dentro do setState, então tocar no filme troca o ícone na hora — o setState não serve só para adicionar itens, serve para qualquer mudança de estado que precise aparecer na tela.
Sobre a diferança entre "final" e "var" en dart: var permite trocar o valor depois, final aceita um valor só uma vez. O final vale para a caixa e não para o conteúdo, e é por isso que o meu final List<Filme> filmes aceita filmes.add(...) sem reclamar, mas recusaria filmes = [outra lista].

---

## Tarefas — Imagens no Flutter 🖼️

Task 1 - < 🟢 Fácil > Foi super tranquilo, é a maneira mais simples de se adicionar uma imagem em uma tela.

Task 2 - < 🟢 Fácil > Ficou muito mais trabalhar com imagens desta forma, uma vez que diminui minhas frustrações por erros de digitação e como fica mais organizado o código.

Task 3 - < 🟢 Fácil > Foi um ótimo exercicio para fazer com que uma imagem preencha de forma correta o espaço sem evitando distorções e sobreposições.

Task 4 - < 🟡 Média > Este me deu um pouco mais de trabalho para entender o código pois ele exige um comportamente caso ele traga algum erro ao tentar trazer a imagem da internet. 

Task 5 - < 🟡 Média > Esse foi o mais dificil dos 5 exercicios muito pela dificuldade ainda com a lógica do código e em implementar os CircleAvatar / ClipRRect no que já estava pronto, mas após alguns erros e com material de apoio consegui concluir a tarefa.

---

## Ícones no Flutter (jeito Clickbus) ✨

Task 0 - < 🟢 Fácil > - Não tem muito o que dizer, foi bem simples e me ajudou a entender que existe um padrão Snake case para os arquivos do projeto da clickbus.

Task 1 - < 🟢 Fácil > - Foi um ótimo exercicio para lidar com varios tipos de icons e configurar corretamente iconbuttons. 

Task 2 - < 🟢 Fácil > - Exercicio me ajudou a exercitar essas outras possibilidades de buttons na app bar e como tile list.

Task 3 - < 🟢 Fácil > Me ajudou muito a entender como criar as abas de navegação com um icone que alterna de vazado para preenchido.

Task 4 - < 🟢 Fácil > Assim como as imagens em outras tarefas, foi legal ver que existe um padrão de utilizar esses assets como constantes, ajuda a deixar o projeto mais facil de se trabalhar.

Task 5 - < 🟢 Fácil > - Foi uma tarefa bem simples, me ensinou as possibilidades que o um arquivo svg pode ser facilmente manipulavel dentro do código.

Task 6 - < 🟡 Média > - Esta tarefa me deu um pouco mais de trabalho para implementar, apesar de entender o conceito acho que vale eu estudar um pouco mais o código.

Task 7 - < 🟢 Fácil > - Como foi apenas necessário configurar, esta tarefa foi um pouco mais simples que a anterior.

Task 8 - < 🟢 Fácil > -