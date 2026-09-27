CREATE OR REPLACE PACKAGE pkg_labirinto
-- =================================================================================================
-- Author:      Daniel Madeira
-- Create date: 26/09/2026
-- Description: A package to generate the labyrinth based on the SVG package.
-- Version:     1.1
-- License:     https://opensource.org/licenses/GPL-3.0 GNU General Public License version 3
-- =================================================================================================
AS
  -- =================================================================================================
  -- Author:      Daniel Madeira
  -- Create date: 27/09/2026
  -- Description: Checks whether a registered labyrinth has a traversable route from entrance to exit.
  --
  -- Parameters:
  --   @p_labirinto_id = Identifier registered in LABIRINTOS with a complete matrix.
  -- Returns:
  --   TRUE when exactly one valid entrance and exit are connected; otherwise FALSE.
  --   Raises -20012 when the labyrinth or its matrix is missing/incomplete.
  --
  -- Change History:
  --   27/09/26 Daniel Madeira: Route validation added
  --
  -- =================================================================================================
  FUNCTION possui_percurso (
    p_labirinto_id IN PLS_INTEGER DEFAULT 1
  )
  RETURN BOOLEAN;

  -- =================================================================================================
  -- Author:      Daniel Madeira
  -- Create date: 27/09/2026
  -- Description: Generates a 100x100 SVG top-down thumbnail of a registered labyrinth.
  --
  -- Parameters:
  --   @p_labirinto_id = Identifier registered in LABIRINTOS with a complete matrix.
  --   @p_linha, @p_coluna = Optional current zero-based position; supply both or neither.
  -- Returns:
  --   SVG document as CLOB; walls, corridors, entrance, and exit use distinct colors.
  --   The current position, when supplied, is highlighted in blue.
  --   Raises -20012 when the labyrinth or its matrix is missing/incomplete.
  --
  -- Change History:
  --   27/09/26 Daniel Madeira: Top-down thumbnail added
  --
  -- =================================================================================================
  FUNCTION gerar_miniatura (
    p_labirinto_id IN PLS_INTEGER DEFAULT 1
  , p_linha        IN PLS_INTEGER DEFAULT NULL
  , p_coluna       IN PLS_INTEGER DEFAULT NULL
  )
  RETURN CLOB;

  -- =================================================================================================
  -- Author:      Daniel Madeira
  -- Create date: 27/09/2026
  -- Description: Returns an initial property for a registered labyrinth.
  --
  -- Parameters:
  --   @p_parametro    = LARGURA, WIDTH, P_WIDTH, LINHA, COLUNA, DIRECAO, or LABIRINTO.
  --   @p_labirinto_id = Identifier registered in LABIRINTOS with a complete matrix.
  -- Returns:
  --   The requested property as VARCHAR2; raises an application error for invalid input or no entrance.
  --
  -- Change History:
  --   27/09/26 Daniel Madeira: Documentation added
  --
  -- =================================================================================================
  FUNCTION posicao_inicial (
    p_parametro    IN VARCHAR2
  , p_labirinto_id IN PLS_INTEGER DEFAULT 1
  )
  RETURN VARCHAR2;

  -- =================================================================================================
  -- Author:      Daniel Madeira
  -- Create date: 27/09/2026
  -- Description: Generates the SVG perspective view for the selected labyrinth and player position.
  --
  -- Parameters:
  --   @p_width        = Output width, default is 1800.
  --   @p_height       = Output height; when omitted, defaults to p_width * 2 / 3.
  --   @p_linha        = Current zero-based row; provide together with p_coluna.
  --   @p_coluna       = Current zero-based column; provide together with p_linha.
  --   @p_direcao      = N, S, E, or W; defaults to the entrance-facing direction.
  --   @p_labirinto_id = Identifier registered in LABIRINTOS and backed by 14 matrix rows.
  -- Returns:
  --   SVG document as CLOB; invalid coordinates or direction raise an application error.
  --
  -- Change History:
  --   27/09/26 Daniel Madeira: Documentation added
  --
  -- =================================================================================================
  FUNCTION gerar_conteudo_dinamico (
    p_width        IN PLS_INTEGER DEFAULT 1800
  , p_height       IN PLS_INTEGER DEFAULT NULL
  , p_linha        IN PLS_INTEGER DEFAULT NULL
  , p_coluna       IN PLS_INTEGER DEFAULT NULL
  , p_direcao      IN VARCHAR2    DEFAULT NULL
  , p_labirinto_id IN PLS_INTEGER DEFAULT 1
  )
  RETURN CLOB;

  -- =================================================================================================
  -- Author:      Daniel Madeira
  -- Create date: 27/09/2026
  -- Description: Renders the compass face and directional labels for the current heading.
  --
  -- Parameters:
  --   @p_direcao = N, S, E, or W.
  --   @p_width   = Canvas width.
  --   @p_height  = Canvas height.
  -- Returns:
  --   SVG fragment as VARCHAR2; invalid dimensions or heading raise an application error.
  --
  -- Change History:
  --   27/09/26 Daniel Madeira: Documentation added
  --
  -- =================================================================================================
  FUNCTION gerar_bussola (
    p_direcao IN VARCHAR2
  , p_width   IN PLS_INTEGER
  , p_height  IN PLS_INTEGER
  )
  RETURN VARCHAR2;

  -- =================================================================================================
  -- Author:      Daniel Madeira
  -- Create date: 27/09/2026
  -- Description: Applies one movement or turn to the player state.
  --
  -- Parameters:
  --   @p_comando      = F (forward), L (turn left), or R (turn right).
  --   @p_linha        = Mutable zero-based row.
  --   @p_coluna       = Mutable zero-based column.
  --   @p_direcao      = Mutable orientation: N, S, E, or W.
  --   @p_concluido    = TRUE when moving forward reaches the exit.
  --   @p_labirinto_id = Identifier registered in LABIRINTOS with a complete matrix.
  --   State persistence between requests is the caller's responsibility.
  --
  -- Change History:
  --   27/09/26 Daniel Madeira: Documentation added
  --
  -- =================================================================================================
  PROCEDURE aplicar_comando (
    p_comando      IN VARCHAR2
  , p_linha        IN OUT PLS_INTEGER
  , p_coluna       IN OUT PLS_INTEGER
  , p_direcao      IN OUT VARCHAR2
  , p_concluido    OUT BOOLEAN
  , p_labirinto_id IN PLS_INTEGER DEFAULT 1
  );

  -- =================================================================================================
  -- Author:      Daniel Madeira
  -- Create date: 27/09/2026
  -- Description: Applies a command and returns the resulting view or completion screen.
  --
  -- Parameters:
  --   @p_comando      = F (forward), L (left), or R (right).
  --   @p_linha        = Optional current zero-based row.
  --   @p_coluna       = Optional current zero-based column; provide together with p_linha.
  --   @p_direcao      = Optional current orientation: N, S, E, or W.
  --   @p_width        = Output width, default is 1800.
  --   @p_height       = Output height; when omitted, defaults to p_width * 2 / 3.
  --   @p_labirinto_id = Identifier registered in LABIRINTOS with a complete matrix.
  -- Returns:
  --   SVG document as CLOB.
  --
  -- Change History:
  --   27/09/26 Daniel Madeira: Documentation added
  --
  -- =================================================================================================
  FUNCTION navegar (
    p_comando      IN VARCHAR2    DEFAULT 'F'
  , p_linha        IN PLS_INTEGER DEFAULT NULL
  , p_coluna       IN PLS_INTEGER DEFAULT NULL
  , p_direcao      IN VARCHAR2    DEFAULT NULL
  , p_width        IN PLS_INTEGER DEFAULT 1800
  , p_height       IN PLS_INTEGER DEFAULT NULL
  , p_labirinto_id IN PLS_INTEGER DEFAULT 1
  )
  RETURN CLOB;
 
END pkg_labirinto;
/

CREATE OR REPLACE PACKAGE BODY pkg_labirinto
AS
  -- =================================================================================================
  -- Author:      Daniel Madeira
  -- Create date: 27/09/2026
  -- Description: Formats a number for safe use in SVG attributes.
  --
  -- Parameters:
  --   @p_valor = Numeric value to format.
  -- Returns:
  --   Formatted number as VARCHAR2, using a period as the decimal separator.
  --
  -- Change History:
  --   27/09/26 Daniel Madeira: Documentation added
  --
  -- =================================================================================================
  FUNCTION formatar_numero_svg (
    p_valor IN NUMBER
  )
  RETURN VARCHAR2
  IS
  BEGIN
    RETURN TO_CHAR ( p_valor
                   , 'TM9'
                   , 'NLS_NUMERIC_CHARACTERS=''.,''' );
  END formatar_numero_svg;

  -- =================================================================================================
  -- Author:      Daniel Madeira
  -- Create date: 27/09/2026
  -- Description: Calculates the uniform scale that fits the logical canvas.
  --
  -- Parameters:
  --   @p_width  = Output canvas width.
  --   @p_height = Output canvas height.
  -- Returns:
  --   Scale factor constrained by the logical 1800x1200 canvas and both output dimensions.
  --
  -- Change History:
  --   27/09/26 Daniel Madeira: Documentation added
  --
  -- =================================================================================================
  FUNCTION fator_escala (
    p_width  IN PLS_INTEGER
  , p_height IN NUMBER
  )
  RETURN NUMBER
  IS
  BEGIN
    RETURN LEAST ( p_width / 1800, p_height / 1200 );
  END fator_escala;

  -- =================================================================================================
  -- Author:      Daniel Madeira
  -- Create date: 27/09/2026
  -- Description: Validates a labyrinth registration and its matrix completeness.
  --
  -- Parameters:
  --   @p_labirinto_id = Identifier to check in LABIRINTOS and LABIRINTOS_MATRIZ.
  -- Returns:
  --   No value. Raises -20012 when the identifier is absent or its 14 matrix rows are incomplete.
  --
  -- Change History:
  --   27/09/26 Daniel Madeira: Documentation added
  --
  -- =================================================================================================
  PROCEDURE validar_labirinto (
    p_labirinto_id IN PLS_INTEGER
  )
  IS
    l_quantidade PLS_INTEGER;
  BEGIN
    SELECT COUNT(*)
      INTO l_quantidade
      FROM labirintos
     WHERE labirinto_id = p_labirinto_id;

    IF l_quantidade = 0 THEN
      RAISE_APPLICATION_ERROR ( -20012, 'Identificador de labirinto inexistente na tabela LABIRINTOS.' );
    END IF;

    SELECT COUNT(*)
      INTO l_quantidade
      FROM labirintos_matriz
     WHERE labirinto_id = p_labirinto_id
       AND linha BETWEEN 0 AND 13;

    IF l_quantidade <> 14 THEN
      RAISE_APPLICATION_ERROR ( -20012, 'O labirinto não possui as 14 linhas da matriz.' );
    END IF;
  END validar_labirinto;

  -- =================================================================================================
  -- Author:      Daniel Madeira
  -- Create date: 27/09/2026
  -- Description: Scales and horizontally centers a logical X coordinate.
  --
  -- Parameters:
  --   @p_valor  = Logical X coordinate.
  --   @p_width  = Output canvas width.
  --   @p_height = Output canvas height.
  -- Returns:
  --   Scaled SVG coordinate as VARCHAR2.
  --
  -- Change History:
  --   27/09/26 Daniel Madeira: Documentation added
  --
  -- =================================================================================================
  FUNCTION escalar_x (
    p_valor  IN NUMBER
  , p_width  IN PLS_INTEGER
  , p_height IN NUMBER
  )
  RETURN VARCHAR2
  IS
  BEGIN
    RETURN formatar_numero_svg (
      (p_width - 1800 * fator_escala ( p_width, p_height )) / 2 +
       p_valor * fator_escala ( p_width, p_height ) );
  END escalar_x;

  -- =================================================================================================
  -- Author:      Daniel Madeira
  -- Create date: 27/09/2026
  -- Description: Scales and vertically centers a logical Y coordinate.
  --
  -- Parameters:
  --   @p_valor  = Logical Y coordinate.
  --   @p_width  = Output canvas width.
  --   @p_height = Output canvas height.
  -- Returns:
  --   Scaled SVG coordinate as VARCHAR2.
  --
  -- Change History:
  --   27/09/26 Daniel Madeira: Documentation added
  --
  -- =================================================================================================
  FUNCTION escalar_y (
    p_valor  IN NUMBER
  , p_width  IN PLS_INTEGER
  , p_height IN NUMBER
  )
  RETURN VARCHAR2
  IS
  BEGIN
    RETURN formatar_numero_svg (
      (p_height - 1200 * fator_escala ( p_width, p_height )) / 2 +
       p_valor * fator_escala ( p_width, p_height ) );
  END escalar_y;

  -- =================================================================================================
  -- Author:      Daniel Madeira
  -- Create date: 27/09/2026
  -- Description: Scales a stroke width using the scene's uniform scale factor.
  --
  -- Parameters:
  --   @p_valor  = Logical stroke width.
  --   @p_width  = Output canvas width.
  --   @p_height = Output canvas height.
  -- Returns:
  --   Scaled SVG stroke width as VARCHAR2.
  --
  -- Change History:
  --   27/09/26 Daniel Madeira: Documentation added
  --
  -- =================================================================================================
  FUNCTION escalar_traco (
    p_valor  IN NUMBER
  , p_width  IN PLS_INTEGER
  , p_height IN NUMBER
  )
  RETURN VARCHAR2
  IS
  BEGIN
    RETURN formatar_numero_svg ( p_valor * fator_escala ( p_width, p_height ) );
  END escalar_traco;

  -- =================================================================================================
  -- Author:      Daniel Madeira
  -- Create date: 27/09/2026
  -- Description: Scales a logical length or dimension using the uniform canvas factor.
  --
  -- Parameters:
  --   @p_valor  = Logical dimension.
  --   @p_width  = Output canvas width.
  --   @p_height = Output canvas height.
  -- Returns:
  --   Scaled SVG dimension as VARCHAR2.
  --
  -- Change History:
  --   27/09/26 Daniel Madeira: Documentation added
  --
  -- =================================================================================================
  FUNCTION escalar_dimensao (
    p_valor  IN NUMBER
  , p_width  IN PLS_INTEGER
  , p_height IN NUMBER
  )
  RETURN VARCHAR2
  IS
  BEGIN
    RETURN formatar_numero_svg ( p_valor * fator_escala ( p_width, p_height ) );
  END escalar_dimensao;

  -- =================================================================================================
  -- Author:      Daniel Madeira
  -- Create date: 27/09/2026
  -- Description: Builds compass SVG elements for the viewer's current orientation.
  --
  -- Parameters:
  --   @p_direcao = Heading: N, S, E, or W.
  --   @p_width   = Canvas width.
  --   @p_height  = Canvas height.
  -- Returns:
  --   Compass SVG fragment as VARCHAR2; invalid dimensions or heading raise an application error.
  --
  -- Change History:
  --   27/09/26 Daniel Madeira: Documentation added
  --
  -- =================================================================================================
  FUNCTION gerar_bussola (
    p_direcao IN VARCHAR2
  , p_width   IN PLS_INTEGER
  , p_height  IN PLS_INTEGER
  )
  RETURN VARCHAR2
  IS
    l_direcao VARCHAR2(1) := UPPER ( TRIM ( p_direcao ) );
    l_radius  NUMBER;
    l_margin  NUMBER;
    l_center_x NUMBER;
    l_center_y NUMBER;
    l_font_size NUMBER;
    l_top_label VARCHAR2(1);
    l_right_label VARCHAR2(1);
    l_bottom_label VARCHAR2(1);
    l_left_label VARCHAR2(1);
    l_tip_x NUMBER;
    l_tip_y NUMBER;
    l_arrow_points VARCHAR2(500);
    l_svg VARCHAR2(4000);
  BEGIN
    IF p_width IS NULL OR p_width <= 0 OR p_height IS NULL OR p_height <= 0 THEN
      RAISE_APPLICATION_ERROR ( -20010, 'As dimensões da bússola devem ser maiores que zero.' );
    END IF;
    IF l_direcao IS NULL OR l_direcao NOT IN ('N', 'S', 'E', 'W') THEN
      RAISE_APPLICATION_ERROR ( -20011, 'A direção da bússola deve ser N, S, E ou W.' );
    END IF;

    l_radius := LEAST ( 36, p_width * 0.08, p_height * 0.12 );
    l_margin := LEAST ( 16, LEAST ( p_width, p_height ) * 0.04 );
    l_center_x := p_width - l_margin - l_radius;
    l_center_y := l_margin + l_radius;
    l_font_size := l_radius * 0.36;

    CASE l_direcao
      WHEN 'N' THEN
        l_top_label := 'N'; l_right_label := 'E'; l_bottom_label := 'S'; l_left_label := 'W';
      WHEN 'E' THEN
        l_top_label := 'E'; l_right_label := 'S'; l_bottom_label := 'W'; l_left_label := 'N';
      WHEN 'S' THEN
        l_top_label := 'S'; l_right_label := 'W'; l_bottom_label := 'N'; l_left_label := 'E';
      WHEN 'W' THEN
        l_top_label := 'W'; l_right_label := 'N'; l_bottom_label := 'E'; l_left_label := 'S';
    END CASE;
    l_tip_x := l_center_x;
    l_tip_y := l_center_y - l_radius * 0.36;
    l_arrow_points := formatar_numero_svg ( l_tip_x ) || ',' || formatar_numero_svg ( l_tip_y ) || ' ' ||
                      formatar_numero_svg ( l_center_x + l_radius * 0.12 ) || ',' || formatar_numero_svg ( l_center_y + l_radius * 0.18 ) || ' ' ||
                      formatar_numero_svg ( l_center_x - l_radius * 0.12 ) || ',' || formatar_numero_svg ( l_center_y + l_radius * 0.18 );

    l_svg := scalable_vector_graphics.circle_element (
               p_cx => formatar_numero_svg ( l_center_x ),
               p_cy => formatar_numero_svg ( l_center_y ),
               p_r => formatar_numero_svg ( l_radius ),
               p_presentation => scalable_vector_graphics.presentation_attribute (
                                   p_fill => 'white', p_fill_opacity => '0.88',
                                   p_stroke => '#374c8b', p_stroke_width => formatar_numero_svg ( GREATEST ( 1, l_radius * 0.05 ) ) ) );

    l_svg := l_svg ||
             scalable_vector_graphics.text_element (
               p_content => l_top_label,
               p_x => formatar_numero_svg ( l_center_x ),
               p_y => formatar_numero_svg ( l_center_y - l_radius * 0.62 ),
               p_presentation => scalable_vector_graphics.presentation_attribute (
                 p_text_anchor => 'middle', p_fill => '#374c8b', p_font_size => formatar_numero_svg ( l_font_size ),
                 p_font_weight => 'bold' ) );
    l_svg := l_svg ||
             scalable_vector_graphics.text_element (
               p_content => l_right_label,
               p_x => formatar_numero_svg ( l_center_x + l_radius * 0.72 ),
               p_y => formatar_numero_svg ( l_center_y + l_font_size * 0.35 ),
               p_presentation => scalable_vector_graphics.presentation_attribute (
                                   p_text_anchor => 'middle', p_fill => '#374c8b', p_font_size => formatar_numero_svg ( l_font_size ),
                                   p_font_weight => 'bold' ) );
    l_svg := l_svg ||
             scalable_vector_graphics.text_element (
               p_content => l_bottom_label,
               p_x => formatar_numero_svg ( l_center_x ),
               p_y => formatar_numero_svg ( l_center_y + l_radius * 0.80 ),
               p_presentation => scalable_vector_graphics.presentation_attribute (
                                   p_text_anchor => 'middle', p_fill => '#374c8b', p_font_size => formatar_numero_svg ( l_font_size ),
                                   p_font_weight => 'bold' ) );
    l_svg := l_svg ||
             scalable_vector_graphics.text_element (
               p_content => l_left_label,
               p_x => formatar_numero_svg ( l_center_x - l_radius * 0.72 ),
               p_y => formatar_numero_svg ( l_center_y + l_font_size * 0.35 ),
               p_presentation => scalable_vector_graphics.presentation_attribute (
                                   p_text_anchor => 'middle', p_fill => '#374c8b', p_font_size => formatar_numero_svg ( l_font_size ),
                                   p_font_weight => 'bold' ) );
    l_svg := l_svg ||
             scalable_vector_graphics.polygon_element (
               p_points => l_arrow_points,
               p_presentation => scalable_vector_graphics.presentation_attribute (
                                   p_fill => 'firebrick', p_stroke => 'firebrick',
                                   p_stroke_width => formatar_numero_svg ( GREATEST ( 1, l_radius * 0.03 ) ),
                                   p_stroke_linejoin => 'round' ) );

    RETURN l_svg;
  END gerar_bussola;

  -- =================================================================================================
  -- Author:      Daniel Madeira
  -- Create date: 27/09/2026
  -- Description: Reads one cell from the selected labyrinth matrix.
  --
  -- Parameters:
  --   @p_linha        = Zero-based matrix row.
  --   @p_coluna       = Zero-based matrix column.
  --   @p_labirinto_id = Labyrinth identifier.
  -- Returns:
  --   0 for corridor, 1 for wall, 2 for entrance, or 3 for exit. Out-of-range coordinates return a wall.
  --
  -- Change History:
  --   27/09/26 Daniel Madeira: Documentation added
  --
  -- =================================================================================================
  FUNCTION celula_labirinto (
    p_linha        IN PLS_INTEGER
  , p_coluna       IN PLS_INTEGER
  , p_labirinto_id IN PLS_INTEGER
  ) RETURN PLS_INTEGER IS
    l_layout VARCHAR2(14);
  BEGIN
    IF (p_linha < 0) OR (p_linha > 13)
    OR (p_coluna < 0) OR (p_coluna > 13) THEN
        RETURN 1;
    END IF;

    SELECT layout
      INTO l_layout
      FROM labirintos_matriz
     WHERE labirinto_id = p_labirinto_id
       AND linha = p_linha;

    RETURN TO_NUMBER(SUBSTR(l_layout, p_coluna + 1, 1));

  EXCEPTION
    WHEN NO_DATA_FOUND THEN
        RAISE_APPLICATION_ERROR(-20012, 'Identificador de labirinto ou linha inválido.');
  END celula_labirinto;

  -- =================================================================================================
  -- Author:      Daniel Madeira
  -- Create date: 27/09/2026
  -- Description: Checks route connectivity between the unique entrance and exit using breadth-first search.
  --
  -- Parameters:
  --   @p_labirinto_id = Identifier registered in LABIRINTOS with a complete matrix.
  -- Returns:
  --   TRUE when exactly one non-corner perimeter entrance and exit are connected through non-wall cells;
  --   otherwise FALSE. Raises -20012 when the labyrinth or its matrix is missing/incomplete.
  --
  -- Change History:
  --   27/09/26 Daniel Madeira: Route validation added
  --
  -- =================================================================================================
  FUNCTION possui_percurso (
    p_labirinto_id IN PLS_INTEGER DEFAULT 1
  )
  RETURN BOOLEAN
  IS
    TYPE t_fila IS TABLE OF PLS_INTEGER INDEX BY PLS_INTEGER;
    TYPE t_visitados IS TABLE OF BOOLEAN INDEX BY PLS_INTEGER;
    l_fila             t_fila;
    l_visitados        t_visitados;
    l_inicio_linha     PLS_INTEGER;
    l_inicio_coluna    PLS_INTEGER;
    l_fim_linha        PLS_INTEGER;
    l_fim_coluna       PLS_INTEGER;
    l_quantidade_inicio PLS_INTEGER := 0;
    l_quantidade_fim   PLS_INTEGER := 0;
    l_inicio           PLS_INTEGER;
    l_fim              PLS_INTEGER;
    l_cabeca           PLS_INTEGER := 1;
    l_cauda            PLS_INTEGER := 0;
    l_atual            PLS_INTEGER;
    l_linha            PLS_INTEGER;
    l_coluna           PLS_INTEGER;

    PROCEDURE adicionar_vizinho (
      p_linha  IN PLS_INTEGER
    , p_coluna IN PLS_INTEGER
    )
    IS
      l_indice PLS_INTEGER;
    BEGIN
      IF p_linha BETWEEN 0 AND 13
         AND p_coluna BETWEEN 0 AND 13
         AND celula_labirinto ( p_linha, p_coluna, p_labirinto_id ) <> 1
      THEN
        l_indice := p_linha * 14 + p_coluna;
        IF NOT l_visitados.EXISTS ( l_indice ) THEN
          l_visitados ( l_indice ) := TRUE;
          l_cauda := l_cauda + 1;
          l_fila ( l_cauda ) := l_indice;
        END IF;
      END IF;
    END adicionar_vizinho;
  BEGIN
    validar_labirinto ( p_labirinto_id );

    FOR l_linha IN 0 .. 13 LOOP
      FOR l_coluna IN 0 .. 13 LOOP
        CASE celula_labirinto ( l_linha, l_coluna, p_labirinto_id )
          WHEN 2 THEN
            l_quantidade_inicio := l_quantidade_inicio + 1;
            l_inicio_linha := l_linha;
            l_inicio_coluna := l_coluna;
          WHEN 3 THEN
            l_quantidade_fim := l_quantidade_fim + 1;
            l_fim_linha := l_linha;
            l_fim_coluna := l_coluna;
          ELSE
            NULL;
        END CASE;
      END LOOP;
    END LOOP;

    IF l_quantidade_inicio <> 1 OR l_quantidade_fim <> 1 THEN
      RETURN FALSE;
    END IF;

    IF NOT (l_inicio_linha IN (0, 13) OR l_inicio_coluna IN (0, 13))
       OR (l_inicio_linha IN (0, 13) AND l_inicio_coluna IN (0, 13))
       OR NOT (l_fim_linha IN (0, 13) OR l_fim_coluna IN (0, 13))
       OR (l_fim_linha IN (0, 13) AND l_fim_coluna IN (0, 13))
    THEN
      RETURN FALSE;
    END IF;

    l_inicio := l_inicio_linha * 14 + l_inicio_coluna;
    l_fim := l_fim_linha * 14 + l_fim_coluna;
    l_visitados ( l_inicio ) := TRUE;
    l_cauda := 1;
    l_fila ( l_cauda ) := l_inicio;

    WHILE l_cabeca <= l_cauda LOOP
      l_atual := l_fila ( l_cabeca );
      l_cabeca := l_cabeca + 1;

      IF l_atual = l_fim THEN
        RETURN TRUE;
      END IF;

      l_linha := TRUNC ( l_atual / 14 );
      l_coluna := MOD ( l_atual, 14 );
      adicionar_vizinho ( l_linha - 1, l_coluna );
      adicionar_vizinho ( l_linha + 1, l_coluna );
      adicionar_vizinho ( l_linha, l_coluna - 1 );
      adicionar_vizinho ( l_linha, l_coluna + 1 );
    END LOOP;

    RETURN FALSE;
  END possui_percurso;

  -- =================================================================================================
  -- Author:      Daniel Madeira
  -- Create date: 27/09/2026
  -- Description: Generates a 100x100 SVG top-down thumbnail of a registered labyrinth.
  --
  -- Parameters:
  --   @p_labirinto_id = Identifier registered in LABIRINTOS with a complete matrix.
  -- Returns:
  --   SVG document as CLOB; walls, corridors, entrance, and exit use distinct colors.
  --   Raises -20012 when the labyrinth or its matrix is missing/incomplete.
  --
  -- Change History:
  --   27/09/26 Daniel Madeira: Top-down thumbnail added
  --
  -- =================================================================================================
  FUNCTION gerar_miniatura (
    p_labirinto_id IN PLS_INTEGER DEFAULT 1
  , p_linha        IN PLS_INTEGER DEFAULT NULL
  , p_coluna       IN PLS_INTEGER DEFAULT NULL
  )
  RETURN CLOB
  IS
    l_linha          PLS_INTEGER := 0;
    l_coluna         PLS_INTEGER;
    l_tamanho_celula NUMBER := 100 / 14;
    l_x              NUMBER;
    l_y              NUMBER;
    l_valor          VARCHAR2(1);
    l_cor            VARCHAR2(7);
    l_conteudo       CLOB;
    l_elemento       VARCHAR2(4000);
    l_svg            CLOB;
    l_temporario_criado BOOLEAN := FALSE;
  BEGIN
    validar_labirinto ( p_labirinto_id );

    IF (p_linha IS NULL AND p_coluna IS NOT NULL)
       OR (p_linha IS NOT NULL AND p_coluna IS NULL)
    THEN
      RAISE_APPLICATION_ERROR ( -20003, 'Informe linha e coluna juntas para a posição atual.' );
    END IF;

    IF p_linha IS NOT NULL
       AND (p_linha < 0 OR p_linha > 13 OR p_coluna < 0 OR p_coluna > 13
            OR celula_labirinto ( p_linha, p_coluna, p_labirinto_id ) NOT IN (0, 2))
    THEN
      RAISE_APPLICATION_ERROR ( -20004, 'A posição atual informada não é um corredor válido.' );
    END IF;

    DBMS_LOB.CREATETEMPORARY ( l_conteudo, TRUE );
    l_temporario_criado := TRUE;

    FOR r IN (
      SELECT linha, layout
        FROM labirintos_matriz
       WHERE labirinto_id = p_labirinto_id
       ORDER BY linha
    ) LOOP
      IF r.linha <> l_linha THEN
        RAISE_APPLICATION_ERROR ( -20012, 'A matriz do labirinto deve conter exatamente as linhas de 0 a 13.' );
      END IF;
      IF LENGTH ( r.layout ) <> 14 THEN
        RAISE_APPLICATION_ERROR ( -20012, 'Cada linha da matriz do labirinto deve conter exatamente 14 células.' );
      END IF;

      FOR l_coluna IN 0 .. 13 LOOP
        l_valor := SUBSTR ( r.layout, l_coluna + 1, 1 );
        IF p_linha = l_linha AND p_coluna = l_coluna THEN
          l_cor := '#2563eb';
        ELSE
          l_cor := CASE l_valor
                     WHEN '1' THEN '#374151'
                     WHEN '2' THEN '#16a34a'
                     WHEN '3' THEN '#dc2626'
                     WHEN '0' THEN '#f9fafb'
                     ELSE NULL
                   END;
        END IF;
        IF l_cor IS NULL THEN
          RAISE_APPLICATION_ERROR ( -20014, 'A matriz contém um valor de célula inválido.' );
        END IF;
        l_x := l_coluna * l_tamanho_celula;
        l_y := l_linha * l_tamanho_celula;

        l_elemento := scalable_vector_graphics.rect_element (
          p_x => formatar_numero_svg ( l_x ),
          p_y => formatar_numero_svg ( l_y ),
          p_width => formatar_numero_svg ( l_tamanho_celula ),
          p_height => formatar_numero_svg ( l_tamanho_celula ),
          p_presentation => scalable_vector_graphics.presentation_attribute (
            p_fill => l_cor,
            p_stroke => 'white',
            p_stroke_width => '0.5' ) );
          DBMS_LOB.WRITEAPPEND ( l_conteudo, LENGTH ( l_elemento ), l_elemento );
      END LOOP;

      l_linha := l_linha + 1;
    END LOOP;

    l_svg := scalable_vector_graphics.svg_element (
      p_content => l_conteudo,
      p_width => '100px',
      p_height => '100px',
      p_viewbox => '0 0 100 100',
      p_preserveaspectratio => 'xMidYMid meet',
      p_style => 'display: block;' );

    DBMS_LOB.FREETEMPORARY ( l_conteudo );
    l_temporario_criado := FALSE;
    RETURN l_svg;
  EXCEPTION
    WHEN OTHERS THEN
      IF l_temporario_criado THEN
        DBMS_LOB.FREETEMPORARY ( l_conteudo );
      END IF;
      RAISE;
  END gerar_miniatura;

  -- =================================================================================================
  -- Author:      Daniel Madeira
  -- Create date: 27/09/2026
  -- Description: Finds the entrance on the perimeter and derives the inward-facing direction.
  --
  -- Parameters:
  --   @p_labirinto_id = Labyrinth identifier to search.
  -- Outputs:
  --   @p_linha   = Entrance row.
  --   @p_coluna  = Entrance column.
  --   @p_direcao = Direction facing into the maze.
  --   @p_valido  = TRUE when a valid entrance was found; otherwise FALSE.
  --
  -- Change History:
  --   27/09/26 Daniel Madeira: Documentation added
  --
  -- =================================================================================================
  PROCEDURE localizar_inicio (
    p_linha        OUT PLS_INTEGER
  , p_coluna       OUT PLS_INTEGER
  , p_direcao      OUT VARCHAR2
  , p_valido       OUT BOOLEAN
  , p_labirinto_id IN PLS_INTEGER
  )
  IS
  BEGIN
    p_linha := 0;
    p_coluna := 0;
    p_direcao := NULL;
    p_valido := FALSE;

    FOR l IN 0 .. 13 LOOP
      FOR c IN 0 .. 13 LOOP
        IF celula_labirinto ( l, c, p_labirinto_id ) = 2
           AND (l = 0 OR c = 0 OR l = 13 OR c = 13)
           AND NOT ((l = 0 OR l = 13) AND (c = 0 OR c = 13))
        THEN
          p_linha := l;
          p_coluna := c;
          p_direcao := CASE WHEN l = 0 THEN 'S'
                            WHEN l = 13 THEN 'N'
                            WHEN c = 0 THEN 'E'
                            ELSE 'W'
                       END;
          p_valido := TRUE;
          RETURN;
        END IF;
      END LOOP;
    END LOOP;
    
  END localizar_inicio;

  -- =================================================================================================
  -- Author:      Daniel Madeira
  -- Create date: 27/09/2026
  -- Description: Resolves an initial property after validating the labyrinth and its entrance.
  --
  -- Parameters:
  --   @p_parametro    = LARGURA, WIDTH, P_WIDTH, LINHA, COLUNA, DIRECAO, or LABIRINTO.
  --   @p_labirinto_id = Identifier registered in LABIRINTOS.
  -- Returns:
  --   Requested property as VARCHAR2; invalid input or missing entrance raises an application error.
  --
  -- Change History:
  --   27/09/26 Daniel Madeira: Documentation added
  --
  -- =================================================================================================
  FUNCTION posicao_inicial (
    p_parametro    IN VARCHAR2
  , p_labirinto_id IN PLS_INTEGER DEFAULT 1
  )
  RETURN VARCHAR2
  IS
    v_linha   PLS_INTEGER;
    v_coluna  PLS_INTEGER;
    v_direcao VARCHAR2(1);
    v_valido  BOOLEAN;
    v_campo   VARCHAR2(30) := UPPER ( TRIM ( p_parametro ) );
    
  BEGIN
    validar_labirinto ( p_labirinto_id );

    IF v_campo IN ('LARGURA', 'WIDTH', 'P_WIDTH') THEN
      RETURN '1800';
    END IF;

    localizar_inicio ( v_linha, v_coluna, v_direcao, v_valido, p_labirinto_id );
    IF NOT v_valido THEN
      RAISE_APPLICATION_ERROR ( -20007, 'O labirinto não possui uma posição inicial válida.' );
    END IF;

    CASE v_campo
      WHEN 'LINHA' THEN
        RETURN TO_CHAR ( v_linha );
      WHEN 'COLUNA' THEN
        RETURN TO_CHAR ( v_coluna );
      WHEN 'DIRECAO' THEN
        RETURN v_direcao;
      WHEN 'LABIRINTO' THEN
        RETURN TO_CHAR ( p_labirinto_id );
    END CASE;

    RAISE_APPLICATION_ERROR ( -20008, 'Parâmetro inválido. Use LARGURA, LINHA, COLUNA, DIRECAO ou LABIRINTO.' );

  END posicao_inicial;

  -- =================================================================================================
  -- Author:      Daniel Madeira
  -- Create date: 27/09/2026
  -- Description: Looks ahead until a wall, portal, or maximum viewing distance is reached.
  --
  -- Parameters:
  --   @p_linha        = Current zero-based row.
  --   @p_coluna       = Current zero-based column.
  --   @p_direcao      = Viewing direction: N, S, E, or W.
  --   @p_labirinto_id = Labyrinth identifier.
  -- Outputs:
  --   @p_fundo_linha  = Row of the stopping cell.
  --   @p_fundo_coluna = Column of the stopping cell.
  --   @p_distancia    = Number of cells viewed ahead.
  --
  -- Change History:
  --   27/09/26 Daniel Madeira: Documentation added
  --
  -- =================================================================================================
  PROCEDURE localizar_fundo (
    p_linha        IN PLS_INTEGER
  , p_coluna       IN PLS_INTEGER
  , p_direcao      IN VARCHAR2
  , p_fundo_linha  OUT PLS_INTEGER
  , p_fundo_coluna OUT PLS_INTEGER
  , p_distancia    OUT PLS_INTEGER
  , p_labirinto_id IN PLS_INTEGER
  )
  IS
    l_linha  PLS_INTEGER;
    l_coluna PLS_INTEGER;
  BEGIN
    FOR i IN 1 .. 12 LOOP
      l_linha := p_linha;
      l_coluna := p_coluna;

      CASE p_direcao
        WHEN 'N' THEN l_linha := p_linha - i;
        WHEN 'S' THEN l_linha := p_linha + i;
        WHEN 'E' THEN l_coluna := p_coluna + i;
        WHEN 'W' THEN l_coluna := p_coluna - i;
      END CASE;

      IF celula_labirinto ( l_linha, l_coluna, p_labirinto_id ) IN (1, 2, 3) OR i = 12 THEN
        p_fundo_linha := l_linha;
        p_fundo_coluna := l_coluna;
        p_distancia := i;
        RETURN;
      END IF;
    END LOOP;
  END localizar_fundo;

  -- =================================================================================================
  -- Author:      Daniel Madeira
  -- Create date: 27/09/2026
  -- Description: Detects a side opening at the far cell for the perspective rendering.
  --
  -- Parameters:
  --   @p_linha        = Far-cell row.
  --   @p_coluna       = Far-cell column.
  --   @p_direcao      = Viewing direction: N, S, E, or W.
  --   @p_labirinto_id = Labyrinth identifier.
  -- Returns:
  --   TRUE when either checked side is open; otherwise FALSE.
  --
  -- Change History:
  --   27/09/26 Daniel Madeira: Documentation added
  --
  -- =================================================================================================
  FUNCTION fundo_em_curva (
    p_linha        IN PLS_INTEGER
  , p_coluna       IN PLS_INTEGER
  , p_direcao      IN VARCHAR2
  , p_labirinto_id IN PLS_INTEGER
  )
  RETURN BOOLEAN
  IS
  BEGIN
    CASE p_direcao
      WHEN 'N' THEN
        RETURN celula_labirinto ( p_linha + 1, p_coluna + 1, p_labirinto_id ) <> 1
          OR celula_labirinto ( p_linha + 1, p_coluna - 1, p_labirinto_id ) <> 1;
      WHEN 'S' THEN
        RETURN celula_labirinto ( p_linha - 1, p_coluna - 1, p_labirinto_id ) <> 1
          OR celula_labirinto ( p_linha - 1, p_coluna + 1, p_labirinto_id ) <> 1;
      WHEN 'E' THEN
        RETURN celula_labirinto ( p_linha + 1, p_coluna - 1, p_labirinto_id ) <> 1
          OR celula_labirinto ( p_linha - 1, p_coluna - 1, p_labirinto_id ) <> 1;
      WHEN 'W' THEN
        RETURN celula_labirinto ( p_linha - 1, p_coluna + 1, p_labirinto_id ) <> 1
          OR celula_labirinto ( p_linha + 1, p_coluna + 1, p_labirinto_id ) <> 1;
    END CASE;
    RETURN FALSE;
  END fundo_em_curva;

  -- =================================================================================================
  -- Author:      Daniel Madeira
  -- Create date: 27/09/2026
  -- Description: Checks whether the projected corridor's right side is a wall.
  --
  -- Parameters:
  --   @p_linha        = Far-cell row.
  --   @p_coluna       = Far-cell column.
  --   @p_indice       = Depth offset.
  --   @p_direcao      = Viewing direction: N, S, E, or W.
  --   @p_labirinto_id = Labyrinth identifier.
  -- Returns:
  --   TRUE when the sampled cell is a wall; otherwise FALSE.
  --
  -- Change History:
  --   27/09/26 Daniel Madeira: Documentation added
  --
  -- =================================================================================================
  FUNCTION parede_direita (
    p_linha        IN PLS_INTEGER
  , p_coluna       IN PLS_INTEGER
  , p_indice       IN PLS_INTEGER
  , p_direcao      IN VARCHAR2
  , p_labirinto_id IN PLS_INTEGER
  )
  RETURN BOOLEAN
  IS
  BEGIN
    CASE p_direcao
      WHEN 'N' THEN RETURN celula_labirinto ( p_linha + p_indice, p_coluna + 1, p_labirinto_id ) = 1;
      WHEN 'S' THEN RETURN celula_labirinto ( p_linha - p_indice, p_coluna - 1, p_labirinto_id ) = 1;
      WHEN 'E' THEN RETURN celula_labirinto ( p_linha + 1, p_coluna - p_indice, p_labirinto_id ) = 1;
      WHEN 'W' THEN RETURN celula_labirinto ( p_linha - 1, p_coluna + p_indice, p_labirinto_id ) = 1;
    END CASE;
    RETURN FALSE;
  END parede_direita;

  -- =================================================================================================
  -- Author:      Daniel Madeira
  -- Create date: 27/09/2026
  -- Description: Checks whether the projected corridor's left side is a wall.
  --
  -- Parameters:
  --   @p_linha        = Far-cell row.
  --   @p_coluna       = Far-cell column.
  --   @p_indice       = Depth offset.
  --   @p_direcao      = Viewing direction: N, S, E, or W.
  --   @p_labirinto_id = Labyrinth identifier.
  -- Returns:
  --   TRUE when the sampled cell is a wall; otherwise FALSE.
  --
  -- Change History:
  --   27/09/26 Daniel Madeira: Documentation added
  --
  -- =================================================================================================
  FUNCTION parede_esquerda (
    p_linha        IN PLS_INTEGER
  , p_coluna       IN PLS_INTEGER
  , p_indice       IN PLS_INTEGER
  , p_direcao      IN VARCHAR2
  , p_labirinto_id IN PLS_INTEGER
  )
  RETURN BOOLEAN
  IS
  BEGIN
    CASE p_direcao
      WHEN 'N' THEN RETURN celula_labirinto ( p_linha + p_indice, p_coluna - 1, p_labirinto_id ) = 1;
      WHEN 'S' THEN RETURN celula_labirinto ( p_linha - p_indice, p_coluna + 1, p_labirinto_id ) = 1;
      WHEN 'E' THEN RETURN celula_labirinto ( p_linha - 1, p_coluna - p_indice, p_labirinto_id ) = 1;
      WHEN 'W' THEN RETURN celula_labirinto ( p_linha + 1, p_coluna + p_indice, p_labirinto_id ) = 1;
    END CASE;
    RETURN FALSE;
  END parede_esquerda;

  -- =================================================================================================
  -- Author:      Daniel Madeira
  -- Create date: 27/09/2026
  -- Description: Calculates the perspective shrink percentage for a depth index.
  --
  -- Parameters:
  --   @p_distancia = Number of cells into the scene.
  -- Returns:
  --   Perspective percentage from 0 to 100.
  --
  -- Change History:
  --   27/09/26 Daniel Madeira: Documentation added
  --
  -- =================================================================================================
  FUNCTION percentual_perspectiva (
    p_distancia IN PLS_INTEGER
  )
  RETURN NUMBER
  IS
  BEGIN
    RETURN 100 / POWER ( 1.45, p_distancia );
  END percentual_perspectiva;

  -- =================================================================================================
  -- Author:      Daniel Madeira
  -- Create date: 27/09/2026
  -- Description: Converts a logical point to a scaled SVG coordinate pair.
  --
  -- Parameters:
  --   @p_x      = Logical X coordinate.
  --   @p_y      = Logical Y coordinate.
  --   @p_width  = Output canvas width.
  --   @p_height = Output canvas height.
  -- Returns:
  --   Comma-separated SVG coordinate pair as VARCHAR2.
  --
  -- Change History:
  --   27/09/26 Daniel Madeira: Documentation added
  --
  -- =================================================================================================
  FUNCTION ponto_svg (
    p_x      IN NUMBER
  , p_y      IN NUMBER
  , p_width  IN PLS_INTEGER
  , p_height IN NUMBER
  )
  RETURN VARCHAR2
  IS
  BEGIN
        RETURN escalar_x ( p_x, p_width, p_height ) || ',' ||
          escalar_y ( p_y, p_width, p_height );
  END ponto_svg;

  -- =================================================================================================
  -- Author:      Daniel Madeira
  -- Create date: 27/09/2026
  -- Description: Creates the four vertices of the perspective square at a given depth.
  --
  -- Parameters:
  --   @p_indice = Perspective depth.
  --   @p_width  = Output canvas width.
  --   @p_height = Output canvas height.
  -- Returns:
  --   Space-separated SVG polygon points.
  --
  -- Change History:
  --   27/09/26 Daniel Madeira: Documentation added
  --
  -- =================================================================================================
  FUNCTION quadrado_perspectiva (
    p_indice IN PLS_INTEGER
  , p_width  IN PLS_INTEGER
  , p_height IN NUMBER
  )
  RETURN VARCHAR2
  IS
    l_meia_aresta NUMBER := 600 * percentual_perspectiva ( p_indice ) / 100;
  BEGIN
    RETURN ponto_svg ( 900 - l_meia_aresta, 600 - l_meia_aresta, p_width, p_height ) || ' ' ||
           ponto_svg ( 900 + l_meia_aresta, 600 - l_meia_aresta, p_width, p_height ) || ' ' ||
           ponto_svg ( 900 + l_meia_aresta, 600 + l_meia_aresta, p_width, p_height ) || ' ' ||
           ponto_svg ( 900 - l_meia_aresta, 600 + l_meia_aresta, p_width, p_height );
  END quadrado_perspectiva;

  -- =================================================================================================
  -- Author:      Daniel Madeira
  -- Create date: 27/09/2026
  -- Description: Creates the projected polygon for a right-side wall or open side.
  --
  -- Parameters:
  --   @p_indice         = Perspective depth.
  --   @p_width          = Output canvas width.
  --   @p_height         = Output canvas height.
  --   @p_parede_externa = TRUE to extend to the outer right boundary.
  -- Returns:
  --   Space-separated SVG polygon points.
  --
  -- Change History:
  --   27/09/26 Daniel Madeira: Documentation added
  --
  -- =================================================================================================
  FUNCTION trapezio_direito (
    p_indice IN PLS_INTEGER
  , p_width  IN PLS_INTEGER
  , p_height IN NUMBER
  , p_parede_externa IN BOOLEAN DEFAULT FALSE
  )
  RETURN VARCHAR2
  IS
    l_perto NUMBER := 600 * percentual_perspectiva ( p_indice + 1 ) / 100;
    l_longe NUMBER := 600 * percentual_perspectiva ( p_indice ) / 100;
    l_points VARCHAR2(4000);
  BEGIN
    l_points := ponto_svg ( 900 + l_perto, 600 - l_perto, p_width, p_height ) || ' ' ||
                ponto_svg ( 900 + l_longe, 600 - l_longe, p_width, p_height );
    IF p_parede_externa THEN
      l_points := l_points || ' ' || ponto_svg ( 1800, 2, p_width, p_height ) ||
                  ' ' || ponto_svg ( 1800, 1200, p_width, p_height );
    END IF;
    RETURN l_points || ' ' ||
           ponto_svg ( 900 + l_longe, 600 + l_longe, p_width, p_height ) || ' ' ||
           ponto_svg ( 900 + l_perto, 600 + l_perto, p_width, p_height );
  END trapezio_direito;

  -- =================================================================================================
  -- Author:      Daniel Madeira
  -- Create date: 27/09/2026
  -- Description: Creates the projected polygon for a left-side wall.
  --
  -- Parameters:
  --   @p_indice = Perspective depth.
  --   @p_width  = Output canvas width.
  --   @p_height = Output canvas height.
  -- Returns:
  --   Space-separated SVG polygon points.
  --
  -- Change History:
  --   27/09/26 Daniel Madeira: Documentation added
  --
  -- =================================================================================================
  FUNCTION trapezio_esquerdo (
    p_indice IN PLS_INTEGER
  , p_width  IN PLS_INTEGER
  , p_height IN NUMBER
  )
  RETURN VARCHAR2
  IS
    l_perto NUMBER := 600 * percentual_perspectiva ( p_indice + 1 ) / 100;
    l_longe NUMBER := 600 * percentual_perspectiva ( p_indice ) / 100;
  BEGIN
    RETURN ponto_svg ( 900 - l_longe, 600 - l_longe, p_width, p_height ) || ' ' ||
           ponto_svg ( 900 - l_perto, 600 - l_perto, p_width, p_height ) || ' ' ||
           ponto_svg ( 900 - l_perto, 600 + l_perto, p_width, p_height ) || ' ' ||
           ponto_svg ( 900 - l_longe, 600 + l_longe, p_width, p_height );
  END trapezio_esquerdo;

  -- =================================================================================================
  -- Author:      Daniel Madeira
  -- Create date: 27/09/2026
  -- Description: Creates the projected polygon for an open right-side segment.
  --
  -- Parameters:
  --   @p_indice = Perspective depth.
  --   @p_width  = Output canvas width.
  --   @p_height = Output canvas height.
  -- Returns:
  --   Space-separated SVG polygon points.
  --
  -- Change History:
  --   27/09/26 Daniel Madeira: Documentation added
  --
  -- =================================================================================================
  FUNCTION retangulo_direito (
    p_indice IN PLS_INTEGER
  , p_width  IN PLS_INTEGER
  , p_height IN NUMBER
  )
  RETURN VARCHAR2
  IS
    l_perto NUMBER := 600 * percentual_perspectiva ( p_indice + 1 ) / 100;
    l_longe NUMBER := 600 * percentual_perspectiva ( p_indice ) / 100;
  BEGIN
    IF p_indice = 0 THEN
      RETURN ponto_svg ( 900 + l_perto, 600 - l_perto, p_width, p_height ) || ' ' ||
             ponto_svg ( 1800, 600 - l_perto, p_width, p_height ) || ' ' ||
             ponto_svg ( 1800, 600 + l_perto, p_width, p_height ) || ' ' ||
             ponto_svg ( 900 + l_perto, 600 + l_perto, p_width, p_height );
    END IF;
    RETURN ponto_svg ( 900 + l_perto, 600 - l_perto, p_width, p_height ) || ' ' ||
           ponto_svg ( 900 + l_longe, 600 - l_perto, p_width, p_height ) || ' ' ||
           ponto_svg ( 900 + l_longe, 600 + l_perto, p_width, p_height ) || ' ' ||
           ponto_svg ( 900 + l_perto, 600 + l_perto, p_width, p_height );
  END retangulo_direito;

  -- =================================================================================================
  -- Author:      Daniel Madeira
  -- Create date: 27/09/2026
  -- Description: Creates the projected polygon for an open left-side segment.
  --
  -- Parameters:
  --   @p_indice = Perspective depth.
  --   @p_width  = Output canvas width.
  --   @p_height = Output canvas height.
  -- Returns:
  --   Space-separated SVG polygon points.
  --
  -- Change History:
  --   27/09/26 Daniel Madeira: Documentation added
  --
  -- =================================================================================================
  FUNCTION retangulo_esquerdo (
    p_indice IN PLS_INTEGER
  , p_width  IN PLS_INTEGER
  , p_height IN NUMBER
  )
  RETURN VARCHAR2
  IS
    l_perto NUMBER := 600 * percentual_perspectiva ( p_indice + 1 ) / 100;
    l_longe NUMBER := 600 * percentual_perspectiva ( p_indice ) / 100;
  BEGIN
    IF p_indice = 0 THEN
      RETURN ponto_svg ( 0, 600 - l_perto, p_width, p_height ) || ' ' ||
             ponto_svg ( 900 - l_perto, 600 - l_perto, p_width, p_height ) || ' ' ||
             ponto_svg ( 900 - l_perto, 600 + l_perto, p_width, p_height ) || ' ' ||
             ponto_svg ( 0, 600 + l_perto, p_width, p_height );
    END IF;
    RETURN ponto_svg ( 900 - l_longe, 600 - l_perto, p_width, p_height ) || ' ' ||
           ponto_svg ( 900 - l_perto, 600 - l_perto, p_width, p_height ) || ' ' ||
           ponto_svg ( 900 - l_perto, 600 + l_perto, p_width, p_height ) || ' ' ||
           ponto_svg ( 900 - l_longe, 600 + l_perto, p_width, p_height );
  END retangulo_esquerdo;

  -- =================================================================================================
  -- Author:      Daniel Madeira
  -- Create date: 26/09/2026
  -- Description: Generates the dynamic content for the page region.
  --
  -- Parameters:
  --   @p_width  = The width of the SVG canvas, default is 1800
  --   @p_height = The height of the SVG canvas; when omitted, defaults to p_width * 2 / 3.
  --   @p_linha, @p_coluna = Current maze cell (zero-based, as in the PHP implementation).
  --   @p_direcao = Direction of view: N, S, E or W.
  --   If p_height is omitted, the default 3:2 aspect ratio is preserved; otherwise
  --   the scene is uniformly scaled and centered in p_width x p_height.
  --   @p_labirinto_id = Identifier registered in LABIRINTOS with a complete matrix.
  -- Returns:
  --   The generated SVG content as a CLOB.
  --
  -- Change History:
  --   26/09/26 Daniel Madeira: Initial release
  --   
  -- =================================================================================================
  FUNCTION gerar_conteudo_dinamico (
    p_width        IN PLS_INTEGER DEFAULT 1800
  , p_height       IN PLS_INTEGER DEFAULT NULL
  , p_linha        IN PLS_INTEGER DEFAULT NULL
  , p_coluna       IN PLS_INTEGER DEFAULT NULL
  , p_direcao      IN VARCHAR2    DEFAULT NULL
  , p_labirinto_id IN PLS_INTEGER DEFAULT 1
  )
  RETURN CLOB
  IS
    v_linha          PLS_INTEGER;
    v_coluna         PLS_INTEGER;
    v_direcao        VARCHAR2(10);
    v_inicio_linha   PLS_INTEGER;
    v_inicio_coluna  PLS_INTEGER;
    v_inicio_direcao VARCHAR2(1);
    v_inicio_valido  BOOLEAN;
    v_fundo_linha    PLS_INTEGER;
    v_fundo_coluna   PLS_INTEGER;
    v_distancia      PLS_INTEGER;
    v_indice         PLS_INTEGER;
    v_valor_fundo    PLS_INTEGER;
    v_height         NUMBER;
    v_content        VARCHAR2(32767);
    v_points         VARCHAR2(4000);
    v_fill           VARCHAR2(30);
    v_stroke         VARCHAR2(30);
    v_svg            CLOB;
  BEGIN
    IF p_width IS NULL OR p_width <= 0 THEN
      RAISE_APPLICATION_ERROR ( -20001, 'A largura do SVG deve ser maior que zero.' );
    END IF;

    v_height := NVL ( p_height, p_width * 2 / 3 );
    IF v_height <= 0 THEN
      RAISE_APPLICATION_ERROR ( -20009, 'A altura do SVG deve ser maior que zero.' );
    END IF;
    v_fill := NULL;
    v_stroke := NULL;

    validar_labirinto ( p_labirinto_id );
    IF NOT possui_percurso ( p_labirinto_id ) THEN
      RAISE_APPLICATION_ERROR ( -20013, 'O labirinto não possui um percurso válido do início ao fim.' );
    END IF;
    localizar_inicio ( v_inicio_linha, v_inicio_coluna, v_inicio_direcao, v_inicio_valido, p_labirinto_id );
    IF NOT v_inicio_valido THEN
      RETURN '<svg xmlns="http://www.w3.org/2000/svg" width="' || formatar_numero_svg ( p_width ) ||
             '" height="' || formatar_numero_svg ( v_height ) || '" viewBox="0 0 ' ||
             formatar_numero_svg ( p_width ) || ' ' || formatar_numero_svg ( v_height ) ||
             '"><text x="' || formatar_numero_svg ( p_width / 2 ) || '" y="' ||
             formatar_numero_svg ( v_height / 2 ) || '" text-anchor="middle">Não há início!</text></svg>';
    END IF;

    IF (p_linha IS NULL AND p_coluna IS NOT NULL)
       OR (p_linha IS NOT NULL AND p_coluna IS NULL)
    THEN
      RAISE_APPLICATION_ERROR ( -20003, 'Informe linha e coluna juntas.' );
    END IF;

    IF p_linha IS NULL THEN
      v_linha := v_inicio_linha;
      v_coluna := v_inicio_coluna;
    ELSE
      v_linha := p_linha;
      v_coluna := p_coluna;
    END IF;

    IF v_linha < 0 OR v_linha > 13 OR v_coluna < 0 OR v_coluna > 13
      OR (celula_labirinto ( v_linha, v_coluna, p_labirinto_id ) <> 0
           AND NOT (v_linha = v_inicio_linha AND v_coluna = v_inicio_coluna))
    THEN
      RAISE_APPLICATION_ERROR ( -20004, 'A posição informada não é um corredor válido.' );
    END IF;

    v_direcao := UPPER ( NVL ( TRIM ( p_direcao ), v_inicio_direcao ) );
    IF v_direcao NOT IN ('N', 'S', 'E', 'W') THEN
      RAISE_APPLICATION_ERROR ( -20005, 'A direção deve ser N, S, E ou W.' );
    END IF;

    localizar_fundo ( v_linha, v_coluna, v_direcao
            , v_fundo_linha, v_fundo_coluna, v_distancia, p_labirinto_id );
    v_valor_fundo := celula_labirinto ( v_fundo_linha, v_fundo_coluna, p_labirinto_id );

    v_content := scalable_vector_graphics.rect_element (
                   p_x => escalar_x ( 2, p_width, v_height ), p_y => escalar_y ( 2, p_width, v_height ),
                   p_width => escalar_dimensao ( 1796, p_width, v_height ),
                   p_height => escalar_dimensao ( 598, p_width, v_height ),
                   p_presentation => scalable_vector_graphics.presentation_attribute (
                                       p_fill => 'azure', p_stroke => 'azure',
                                       p_stroke_width => escalar_traco ( 2, p_width, v_height ) ) );
    v_content := v_content ||
                 scalable_vector_graphics.rect_element (
                   p_x => escalar_x ( 2, p_width, v_height ), p_y => escalar_y ( 600, p_width, v_height ),
                   p_width => escalar_dimensao ( 1796, p_width, v_height ),
                   p_height => escalar_dimensao ( 598, p_width, v_height ),
                   p_presentation => scalable_vector_graphics.presentation_attribute (
                                       p_fill => 'khaki', p_stroke => 'khaki',
                                       p_stroke_width => escalar_traco ( 2, p_width, v_height ) ) );

    IF v_distancia = 12 THEN
      v_fill := 'rgb(224,226,196)';
      v_stroke := 'rgb(224,226,196)';
    ELSIF v_valor_fundo = 2 THEN
      v_fill := 'green';
      v_stroke := 'green';
    ELSIF v_valor_fundo = 3 THEN
      v_fill := 'black';
      v_stroke := 'black';
    ELSIF fundo_em_curva ( v_fundo_linha, v_fundo_coluna, v_direcao, p_labirinto_id ) THEN
      v_fill := 'lavender';
      v_stroke := 'lavender';
    ELSE
      v_fill := 'silver';
      v_stroke := 'silver';
    END IF;

    v_content := v_content ||
                 scalable_vector_graphics.polygon_element (
                   p_points => quadrado_perspectiva ( v_distancia, p_width, v_height ),
                   p_presentation => scalable_vector_graphics.presentation_attribute (
                                       p_fill => v_fill, p_stroke => v_stroke,
                                       p_stroke_width => escalar_traco ( 4, p_width, v_height ),
                                       p_stroke_linejoin => 'bevel' ) );

    FOR i IN 1 .. v_distancia LOOP
      v_indice := v_distancia - i;
      IF parede_direita ( v_fundo_linha, v_fundo_coluna, i, v_direcao, p_labirinto_id ) THEN
        v_points := trapezio_direito ( v_indice, p_width, v_height, i = v_distancia );
        v_fill := 'silver';
        v_stroke := 'silver';
      ELSE
        v_points := retangulo_direito ( v_indice, p_width, v_height );
        v_fill := 'lavender';
        v_stroke := 'lavender';
      END IF;
      v_content := v_content ||
                   scalable_vector_graphics.polygon_element (
                     p_points => v_points,
                     p_presentation => scalable_vector_graphics.presentation_attribute (
                                         p_fill => v_fill, p_stroke => v_stroke,
                                         p_stroke_width => escalar_traco ( 4, p_width, v_height ),
                                         p_stroke_linejoin => 'bevel' ) );
    END LOOP;

    FOR i IN 1 .. v_distancia LOOP
      v_indice := v_distancia - i;
      IF parede_esquerda ( v_fundo_linha, v_fundo_coluna, i, v_direcao, p_labirinto_id ) THEN
        v_points := trapezio_esquerdo ( v_indice, p_width, v_height );
        IF i = v_distancia THEN
          v_points := v_points || ' ' || ponto_svg ( 0, 1200, p_width, v_height ) ||
                      ' ' || ponto_svg ( 0, 0, p_width, v_height );
        END IF;
        v_fill := 'silver';
        v_stroke := 'silver';
      ELSE
        v_points := retangulo_esquerdo ( v_indice, p_width, v_height );
        v_fill := 'lavender';
        v_stroke := 'lavender';
      END IF;
      v_content := v_content || scalable_vector_graphics.polygon_element (
                     p_points => v_points,
                     p_presentation => scalable_vector_graphics.presentation_attribute (
                                         p_fill => v_fill, p_stroke => v_stroke,
                                         p_stroke_width => escalar_traco ( 4, p_width, v_height ),
                                         p_stroke_linejoin => 'bevel' ) );
    END LOOP;

    v_content := v_content ||
                 scalable_vector_graphics.rect_element (
                   p_x => escalar_x ( 2, p_width, v_height ), p_y => escalar_y ( 2, p_width, v_height ),
                   p_width => escalar_dimensao ( 1796, p_width, v_height ),
                   p_height => escalar_dimensao ( 1196, p_width, v_height ),
                   p_presentation => scalable_vector_graphics.presentation_attribute (
                                       p_fill => 'none', p_stroke => 'silver',
                                       p_stroke_width => escalar_traco ( 4, p_width, v_height ) ) );

    v_content := v_content || gerar_bussola ( v_direcao, p_width, v_height );

    v_svg := scalable_vector_graphics.svg_element (
               p_content => TO_CLOB ( v_content ),
               p_width => formatar_numero_svg ( p_width ),
               p_height => formatar_numero_svg ( v_height ),
               p_viewbox => '0 0 ' || formatar_numero_svg ( p_width ) || ' ' || formatar_numero_svg ( v_height ),
               p_preserveaspectratio => 'xMidYMid meet',
               p_xlink => TRUE,
               p_style => 'display: block; margin: auto;' );

    RETURN v_svg;
  
  END gerar_conteudo_dinamico;

  -- =================================================================================================
  -- Author:      Daniel Madeira
  -- Create date: 27/09/2026
  -- Description: Validates and applies one movement or turn command to the player state.
  --
  -- Parameters:
  --   @p_comando      = F (forward), L (left), or R (right).
  --   @p_linha        = Mutable zero-based row.
  --   @p_coluna       = Mutable zero-based column.
  --   @p_direcao      = Mutable heading: N, S, E, or W.
  --   @p_concluido    = TRUE when moving forward reaches the exit.
  --   @p_labirinto_id = Identifier registered in LABIRINTOS.
  --   Caller is responsible for persisting state between requests.
  --
  -- Change History:
  --   27/09/26 Daniel Madeira: Documentation added
  --
  -- =================================================================================================
  PROCEDURE aplicar_comando (
    p_comando      IN VARCHAR2
  , p_linha        IN OUT PLS_INTEGER
  , p_coluna       IN OUT PLS_INTEGER
  , p_direcao      IN OUT VARCHAR2
  , p_concluido    OUT BOOLEAN
  , p_labirinto_id IN PLS_INTEGER DEFAULT 1
  )
  IS
    v_inicio_l    PLS_INTEGER;
    v_inicio_c    PLS_INTEGER;
    v_inicio_dir  VARCHAR2(1);
    v_inicio_ok   BOOLEAN;
    v_prox_linha  PLS_INTEGER;
    v_prox_coluna PLS_INTEGER;
    v_direcao     VARCHAR2(10);
    v_comando     VARCHAR2(10);
  BEGIN
    validar_labirinto ( p_labirinto_id );
    localizar_inicio ( v_inicio_l, v_inicio_c, v_inicio_dir, v_inicio_ok, p_labirinto_id );
    IF NOT v_inicio_ok THEN
      RAISE_APPLICATION_ERROR ( -20007, 'O labirinto não possui uma entrada válida.' );
    END IF;

    IF (p_linha IS NULL AND p_coluna IS NOT NULL)
       OR (p_linha IS NOT NULL AND p_coluna IS NULL)
    THEN
      RAISE_APPLICATION_ERROR ( -20003, 'Informe linha e coluna juntas.' );
    END IF;

    p_linha := NVL ( p_linha, v_inicio_l );
    p_coluna := NVL ( p_coluna, v_inicio_c );
    v_direcao := UPPER ( NVL ( TRIM ( p_direcao ), v_inicio_dir ) );
    v_comando := UPPER ( TRIM ( p_comando ) );
    p_concluido := FALSE;

    IF v_direcao NOT IN ('N', 'S', 'E', 'W') THEN
      RAISE_APPLICATION_ERROR ( -20005, 'A direção deve ser N, S, E ou W.' );
    END IF;
    IF p_linha < 0 OR p_linha > 13 OR p_coluna < 0 OR p_coluna > 13
      OR celula_labirinto ( p_linha, p_coluna, p_labirinto_id ) NOT IN (0, 2)
    THEN
      RAISE_APPLICATION_ERROR ( -20004, 'A posição informada não é um corredor válido.' );
    END IF;

    CASE v_comando
      WHEN 'L' THEN
        v_direcao := CASE v_direcao WHEN 'N' THEN 'W' WHEN 'W' THEN 'S'
                                    WHEN 'S' THEN 'E' ELSE 'N' END;
      WHEN 'R' THEN
        v_direcao := CASE v_direcao WHEN 'N' THEN 'E' WHEN 'E' THEN 'S'
                                    WHEN 'S' THEN 'W' ELSE 'N' END;
      WHEN 'F' THEN
        v_prox_linha := p_linha;
        v_prox_coluna := p_coluna;
        CASE v_direcao
          WHEN 'N' THEN v_prox_linha := p_linha - 1;
          WHEN 'S' THEN v_prox_linha := p_linha + 1;
          WHEN 'E' THEN v_prox_coluna := p_coluna + 1;
          WHEN 'W' THEN v_prox_coluna := p_coluna - 1;
        END CASE;

        IF celula_labirinto ( v_prox_linha, v_prox_coluna, p_labirinto_id ) = 3 THEN
          p_concluido := TRUE;
        ELSIF celula_labirinto ( v_prox_linha, v_prox_coluna, p_labirinto_id ) IN (0, 2) THEN
          p_linha := v_prox_linha;
          p_coluna := v_prox_coluna;
        END IF;
      ELSE
        RAISE_APPLICATION_ERROR ( -20006, 'O comando deve ser F (frente), L (esquerda) ou R (direita).' );
    END CASE;

    p_direcao := v_direcao;
  END aplicar_comando;

  -- =================================================================================================
  -- Author:      Daniel Madeira
  -- Create date: 27/09/2026
  -- Description: Applies a command and returns the resulting view or completion screen.
  --
  -- Parameters:
  --   @p_comando      = F (forward), L (left), or R (right).
  --   @p_linha        = Optional current zero-based row.
  --   @p_coluna       = Optional current zero-based column; provide together with p_linha.
  --   @p_direcao      = Optional current heading: N, S, E, or W.
  --   @p_width        = Output width; default is 1800.
  --   @p_height       = Output height; when omitted, defaults to p_width * 2 / 3.
  --   @p_labirinto_id = Identifier registered in LABIRINTOS.
  -- Returns:
  --   SVG document as CLOB.
  --
  -- Change History:
  --   27/09/26 Daniel Madeira: Documentation added
  --
  -- =================================================================================================
  FUNCTION navegar (
    p_comando      IN VARCHAR2    DEFAULT 'F'
  , p_linha        IN PLS_INTEGER DEFAULT NULL
  , p_coluna       IN PLS_INTEGER DEFAULT NULL
  , p_direcao      IN VARCHAR2    DEFAULT NULL
  , p_width        IN PLS_INTEGER DEFAULT 1800
  , p_height       IN PLS_INTEGER DEFAULT NULL
  , p_labirinto_id IN PLS_INTEGER DEFAULT 1
  )
  RETURN CLOB
  IS
    v_linha     PLS_INTEGER := p_linha;
    v_coluna    PLS_INTEGER := p_coluna;
    v_direcao   VARCHAR2(10) := p_direcao;
    v_concluido BOOLEAN;
    v_height    NUMBER;
  BEGIN
    IF p_width IS NULL OR p_width <= 0 THEN
      RAISE_APPLICATION_ERROR ( -20001, 'A largura do SVG deve ser maior que zero.' );
    END IF;
    v_height := NVL ( p_height, p_width * 2 / 3 );
    IF v_height <= 0 THEN
      RAISE_APPLICATION_ERROR ( -20009, 'A altura do SVG deve ser maior que zero.' );
    END IF;

    aplicar_comando ( p_comando, v_linha, v_coluna, v_direcao, v_concluido, p_labirinto_id );
    IF v_concluido THEN
      RETURN '<svg xmlns="http://www.w3.org/2000/svg" width="' || formatar_numero_svg ( p_width ) ||
             '" height="' || formatar_numero_svg ( v_height ) || '" viewBox="0 0 ' ||
             formatar_numero_svg ( p_width ) || ' ' || formatar_numero_svg ( v_height ) || '">' ||
             '<rect width="' || formatar_numero_svg ( p_width ) || '" height="' ||
             formatar_numero_svg ( v_height ) || '" fill="khaki"/><text x="' ||
             formatar_numero_svg ( p_width / 2 ) || '" y="' || formatar_numero_svg ( v_height / 2 ) ||
             '" text-anchor="middle" font-size="' || escalar_traco ( 64, p_width, v_height ) ||
             '">Labirinto concluído!</text></svg>';
    END IF;

    RETURN gerar_conteudo_dinamico ( p_width => p_width,
                                     p_height => v_height,
                                     p_linha => v_linha,
                                     p_coluna => v_coluna,
                                     p_direcao => v_direcao,
                                     p_labirinto_id => p_labirinto_id );
  END navegar;
  
END pkg_labirinto;
/

