//Emojis para finalizar dificuldades <🔴 🟡 🟢>

Task 1 - < 🟡 Média > - Dificuldade com sintaxe e com a lógica de vincular eventos com um wigdet. (apesar de ter funcionado, acabei quebrando de alguma forma a disposição dos demais elementos na tela).

Task 2 - < 🔴 Dificil > - As maiores dificuldades foram referente à sintaxe e estrutura da linguagem Dart.

Task 3 - < 🔴 Dificil > - Consegui compreender a lógica dos requisitos, mas enfrentei dificuldades estruturais relacionadas à sintaxe e organização do Flutter.

Task 4 - < 🔴 Dificil > - dificuldades nesta tarefa envolveram um erro estrutural de sintaxe com uma chave excedente, a desorganização na indentação da árvore de widgets e problemas apara apresentar todas a linhas da lista na visualização na pagina de progresso.

---

##Tarefas de reforço:

Task 1 - < 🟢 Fácil > - Nesta tarefa por já se familiarizar com o que fizemos nas anteriores, eu já tive um pouco mais de facilidade de concluir-la

Task 2 - < 🟢 Fácil > - Foi uma feat bacana de implementar e bater de frente com alguns dificuldades que tenho com estrutura de widgets. 

Task 3 - < 🟡 Média > - Apesar de concluir a tarefa, tive alguns problemas durante o processo com case Sensitivity do dart e estrutura de widgets e hierarquia que só consegui resolver com apoio de IA.

Task 4 - < 🟢 Fácil > É possivel identificar uma evolução ao lidar com sintaxes e estruturas, mesmo compartilhando enfrentando problemas similares as tasks anteriores.

Task 5 - < 🟢 Fácil > Não gosto de ser redundante, mas é nitido como houve evolução comparado com os ultimos exercicios, com mais segurança no momento de encarar um erro de estrutura/sintaxe.

---

##Tarefas — Dados, Listas e Organização de Código

Task 1 - < 🟢 Fácil > Primeira tarefa de organização em vez de nova funcionalidade: movi as telas BoasVindasPage e MinhasCoisas do main.dart para arquivos próprios dentro de lib/pages/. O aprendizado principal foi entender que o `import` é o que conecta um arquivo ao outro. No final das contas o código está começando a deixar de ser um "linguição" dificil de se localizar

Task 2 - < 🟡 Média > Criei a classe Filme em lib/models/ e uma List<Filme> com 3 filmes na nova ListaFilmesPage. O que ficou claro é a diferença entre o molde e as cópias: a classe Filme só descreve o formato do dado (título, assistido, nota), e cada Filme(...) que eu escrevo é um objeto de verdade guardado na lista. Também entendi o papel do `?` no `int? nota` — é o jeito do Dart aceitar que um filme ainda não tem nota, em vez de me obrigar a inventar um número. Foi a primeira vez que separei dado de tela em pastas diferentes (models e pages).

Task 3 - < 🟡 Média > Troquei o Text da contagem por um ListView.builder na ListaFilmesPage. 
A virada de chave foi entender que eu não escrevo mais um widget para cada filme na mão, eu só preciso dizer quantos são (com o itemCount) e ensino como montar UM item com itemBuilder, e o Flutter repete isso sozinho para cada índice. Ainda estou com alguns problema no momento de construir a lógica dos builders, mas o Claude me ajudou a entender melhor destravar.