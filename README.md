# Labirinto em PL-SQL e SVG com aparência 3D

> Um motor de navegação em labirintos pseudo-3D renderizado dinamicamente via SVG e PL/SQL para Oracle APEX.

## Sobre o Projeto

Este repositório contém uma package em PL/SQL que implementa uma exibição e navegação de um labirinto em uma página de aplicação Oracle APEX, além de scripts de banco de dados associados. A renderização gráfica é feita de forma nativa no banco de dados utilizando PL/SQL para gerar código SVG (Scalable Vector Graphics), criando tanto uma visão em primeira pessoa com perspectiva de profundidade quanto um mini-mapa 2D (top-down).

:eyes: Este programa foi baseado no programa em PHP publicado em [Modelo SVG para labirinto 3D](https://github.com/danmadeira/labirinto) e na *package* em PL/SQL publicada em [Building SVG elements with PL-SQL](https://github.com/danmadeira/building-svg-elements-with-pl-sql)

O projeto inclui 20 layouts de labirintos predefinidos (em matrizes 14x14) armazenados em tabelas relacionais.

## O Pacote `pkg_labirinto`

O coração da lógica visual e de movimentação do jogo reside na package `pkg_labirinto`. Abaixo está uma explicação detalhada de suas principais responsabilidades e rotinas:

### 1. Renderização Gráfica e Perspectiva (Pseudo-3D)

A principal funcionalidade do pacote é pegar a posição atual do jogador (linha e coluna) e a direção para onde ele está olhando (Norte, Sul, Leste, Oeste) e calcular o que ele vê.

* **`gerar_conteudo_dinamico` / `navegar`**: Calcula a distância da visão do jogador até a próxima parede ou saída, determinando paredes laterais, corredores abertos e o fundo do labirinto. Em seguida, desenha polígonos SVG com escalas decrescentes para simular profundidade (perspectiva em primeira pessoa).

* **`quadrado_perspectiva`, `trapezio_direito`, `trapezio_esquerdo`**: Funções matemáticas auxiliares que projetam as coordenadas isométricas baseadas num fator percentual de distância (`percentual_perspectiva`).

* **`gerar_bussola`**: Cria dinamicamente um elemento SVG de bússola na interface para orientar o jogador.

### 2. Mini-mapa 2D

* **`gerar_miniatura`**: Lê o layout completo de um labirinto (matriz de 14x14) e gera um mini-mapa top-down. Usa cores distintas para destacar paredes (cinza-escuro), corredores (branco), entrada (verde), saída (vermelho) e, opcionalmente, marca a posição atual do jogador em azul.

### 3. Navegação e Motor de Regras

O pacote valida cada movimento para garantir que o jogador não atravesse paredes e mantenha sua orientação correta no espaço.

* **`aplicar_comando`**: Recebe comandos básicos (F: Frente, L: Virar à Esquerda, R: Virar à Direita) e atualiza o estado interno (linha, coluna, direção). Verifica colisões e checa se o jogador alcançou o portal de saída (valor `3` na matriz).

* **`possui_percurso`**: Um algoritmo de busca em largura (BFS - Breadth-First Search) que valida, logo no início, se o labirinto carregado realmente tem uma rota possível que conecta a entrada à saída, garantindo que o jogo não seja impossível.

* **`celula_labirinto`**: Função de parsing que busca no banco de dados qual é o estado atual de uma coordenada (0 = Corredor, 1 = Parede, 2 = Entrada, 3 = Saída).

### 4. Gestão de Escala e Viewport

* O motor é responsivo. Funções como `fator_escala`, `escalar_x`, `escalar_y` e `escalar_dimensao` adaptam as proporções lógicas da visão (baseadas numa tela abstrata de 1800x1200) para qualquer tamanho de viewport requisitado pelo frontend APEX, mantendo o *aspect ratio* correto em navegadores e dispositivos móveis.

## Estrutura de Banco de Dados

* **`LABIRINTOS`**: Tabela de cabeçalho contendo o ID e a descrição dos desafios.

* **`LABIRINTOS_MATRIZ`**: Armazena as 14 linhas de layout (`VARCHAR2(14)`) para cada labirinto.

* **`scalable_vector_graphics`**: Uma package PL/SQL utilitária de baixo nível responsável por montar as tags literais do padrão SVG 1.1 de forma programática.

## Como Utilizar

1. Execute o script PL/SQL para criar as tabelas `LABIRINTOS` e `LABIRINTOS_MATRIZ`.

2. Insira as matrizes fornecidas no script (`MERGE INTO...`).

3. Compile a package base `scalable_vector_graphics` e em seguida a `pkg_labirinto`.

4. Importe a página APEX `f48032_page_21.sql` na sua aplicação Oracle APEX.

### 5. Desenvolvimento

Para este desenvolvimento, foram utilizados o VSCodroid (um port do VSCode para Android) com integração ao GitHub Copilot Pro, usando o GPT-6 Luna além do apoio do Google Gemini Pro. Foi executado na plataforma Oracle APEX 26, para a visualização gráfica dos labirintos. Tudo isso em um tablet Lenovo Tab Plus.

As IAs foram orientadas a converter o programa original em PHP para uma versão em PL/SQL. Assim como, construir toda a mecânica de navegação pelos labirintos.

### 6. Exemplo da imagem gerada:

![Labirinto](img/pagina.png?raw=true)

### 7. Referências:

- BALES, D. J. *Beginning Oracle PL/SQL, 2nd Edition*. Apress, 2015.

- BELLAMY-ROYDS, A.; CAGLE, K. *SVG Colors, Patterns & Gradients: Painting Vector Graphics*. O'Reilly, 2016.

- BELLAMY-ROYDS, A.; CAGLE, K.; STOREY, D. *Using SVG with CSS3 and HTML5: Vector Graphics for Web Design, Second Release*. O'Reilly, 2018.

- DUNN, F.; PARBERRY, I. *3D Math Primer for Graphics and Game Development, Second Edition*. CRC Press, 2011.

- EISENBERG, J. D.; BELLAMY-ROYDS, A. *SVG Essentials, Second Edition*. O'Reilly, 2015.

- HAN, J. *3D Graphics for Game Programming*. CRC Press, 2011.

- JUNEAU, J.; ARENA, M. *Oracle and PL/SQL Recipes: A Problem-Solution Approach*. Apress, 2010.

- LAMPTON, C. *Gardens of Imagination: Programming 3D Maze Games in Borland C++*. Waite Group Press, 1994.

- LENGYEL, E. *Mathematics for 3D Game Programming and Computer Graphics, 3rd Edition*. Course Technology, Cengage Learning, 2012.

- LIBBY, A. *Beginning SVG: A Practical Introduction to SVG using Real-World Examples*. Apress, 2018.

- MACDONALD, M. *Mastering C++ Game Development: Create professional and realistic 3D games using C++ 17*. Packt Publishing, 2018.

- MADHAV, S. *Game Programming in C++: Creating 3D Games*. Pearson Addison-Wesley, 2018.

- MCDONALD, C. et col. *Mastering Oracle PL/SQL: Practical Solutions*. APress Media, LLC, 2004.

- MORIN, L. *Oracle Database Database PL/SQL Language Reference, 19c*. E96448-03, Oracle, August 2020.

- MURACH, J. *Murach's Oracle SQL and PL/SQL for Developers, 2nd Edition*. Mike Murach & Associates, 2014.

- ROSENZWEIG, B.; RAKHIMOV, E. S. *Oracle PL/SQL by example, 4th Edition*. Pearson Education, Inc., 2009.

- W3C *Scalable Vector Graphics (SVG) 1.1 (Second Edition)*, W3C Recommendation 16 August 2011. Available in: <https://www.w3.org/TR/SVG11/>
