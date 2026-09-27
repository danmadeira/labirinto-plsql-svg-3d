BEGIN

-- 1. Inserção dos cabeçalhos dos Labirintos
MERGE INTO labirintos destino USING (SELECT 1 AS labirinto_id, 'Espiral Contínua' AS descricao FROM dual) origem ON (destino.labirinto_id = origem.labirinto_id) WHEN MATCHED THEN UPDATE SET destino.descricao = origem.descricao WHEN NOT MATCHED THEN INSERT (labirinto_id, descricao) VALUES (origem.labirinto_id, origem.descricao);
MERGE INTO labirintos destino USING (SELECT 2 AS labirinto_id, 'Corredores Cegos à Direita' AS descricao FROM dual) origem ON (destino.labirinto_id = origem.labirinto_id) WHEN MATCHED THEN UPDATE SET destino.descricao = origem.descricao WHEN NOT MATCHED THEN INSERT (labirinto_id, descricao) VALUES (origem.labirinto_id, origem.descricao);
MERGE INTO labirintos destino USING (SELECT 3 AS labirinto_id, 'Câmaras Centrais Isoladas' AS descricao FROM dual) origem ON (destino.labirinto_id = origem.labirinto_id) WHEN MATCHED THEN UPDATE SET destino.descricao = origem.descricao WHEN NOT MATCHED THEN INSERT (labirinto_id, descricao) VALUES (origem.labirinto_id, origem.descricao);
MERGE INTO labirintos destino USING (SELECT 4 AS labirinto_id, 'Labirinto Concêntrico (Ilhas)' AS descricao FROM dual) origem ON (destino.labirinto_id = origem.labirinto_id) WHEN MATCHED THEN UPDATE SET destino.descricao = origem.descricao WHEN NOT MATCHED THEN INSERT (labirinto_id, descricao) VALUES (origem.labirinto_id, origem.descricao);
MERGE INTO labirintos destino USING (SELECT 5 AS labirinto_id, 'Quebra de Visão (Xadrez)' AS descricao FROM dual) origem ON (destino.labirinto_id = origem.labirinto_id) WHEN MATCHED THEN UPDATE SET destino.descricao = origem.descricao WHEN NOT MATCHED THEN INSERT (labirinto_id, descricao) VALUES (origem.labirinto_id, origem.descricao);
MERGE INTO labirintos destino USING (SELECT 6 AS labirinto_id, 'Assimetria Forçada' AS descricao FROM dual) origem ON (destino.labirinto_id = origem.labirinto_id) WHEN MATCHED THEN UPDATE SET destino.descricao = origem.descricao WHEN NOT MATCHED THEN INSERT (labirinto_id, descricao) VALUES (origem.labirinto_id, origem.descricao);
MERGE INTO labirintos destino USING (SELECT 7 AS labirinto_id, 'O Pente (Caminhos Falsos)' AS descricao FROM dual) origem ON (destino.labirinto_id = origem.labirinto_id) WHEN MATCHED THEN UPDATE SET destino.descricao = origem.descricao WHEN NOT MATCHED THEN INSERT (labirinto_id, descricao) VALUES (origem.labirinto_id, origem.descricao);
MERGE INTO labirintos destino USING (SELECT 8 AS labirinto_id, 'Serpente Dupla' AS descricao FROM dual) origem ON (destino.labirinto_id = origem.labirinto_id) WHEN MATCHED THEN UPDATE SET destino.descricao = origem.descricao WHEN NOT MATCHED THEN INSERT (labirinto_id, descricao) VALUES (origem.labirinto_id, origem.descricao);
MERGE INTO labirintos destino USING (SELECT 9 AS labirinto_id, 'Estrangulamento' AS descricao FROM dual) origem ON (destino.labirinto_id = origem.labirinto_id) WHEN MATCHED THEN UPDATE SET destino.descricao = origem.descricao WHEN NOT MATCHED THEN INSERT (labirinto_id, descricao) VALUES (origem.labirinto_id, origem.descricao);
MERGE INTO labirintos destino USING (SELECT 10 AS labirinto_id, 'Múltiplas Rotas Enganosas' AS descricao FROM dual) origem ON (destino.labirinto_id = origem.labirinto_id) WHEN MATCHED THEN UPDATE SET destino.descricao = origem.descricao WHEN NOT MATCHED THEN INSERT (labirinto_id, descricao) VALUES (origem.labirinto_id, origem.descricao);
MERGE INTO labirintos destino USING (SELECT 11 AS labirinto_id, 'A Grande Bifurcação' AS descricao FROM dual) origem ON (destino.labirinto_id = origem.labirinto_id) WHEN MATCHED THEN UPDATE SET destino.descricao = origem.descricao WHEN NOT MATCHED THEN INSERT (labirinto_id, descricao) VALUES (origem.labirinto_id, origem.descricao);
MERGE INTO labirintos destino USING (SELECT 12 AS labirinto_id, 'Ziguezague Cerrado' AS descricao FROM dual) origem ON (destino.labirinto_id = origem.labirinto_id) WHEN MATCHED THEN UPDATE SET destino.descricao = origem.descricao WHEN NOT MATCHED THEN INSERT (labirinto_id, descricao) VALUES (origem.labirinto_id, origem.descricao);
MERGE INTO labirintos destino USING (SELECT 13 AS labirinto_id, 'Falsa Promessa' AS descricao FROM dual) origem ON (destino.labirinto_id = origem.labirinto_id) WHEN MATCHED THEN UPDATE SET destino.descricao = origem.descricao WHEN NOT MATCHED THEN INSERT (labirinto_id, descricao) VALUES (origem.labirinto_id, origem.descricao);
MERGE INTO labirintos destino USING (SELECT 14 AS labirinto_id, 'Quatro Quadrantes' AS descricao FROM dual) origem ON (destino.labirinto_id = origem.labirinto_id) WHEN MATCHED THEN UPDATE SET destino.descricao = origem.descricao WHEN NOT MATCHED THEN INSERT (labirinto_id, descricao) VALUES (origem.labirinto_id, origem.descricao);
MERGE INTO labirintos destino USING (SELECT 15 AS labirinto_id, 'Anéis Entrelaçados' AS descricao FROM dual) origem ON (destino.labirinto_id = origem.labirinto_id) WHEN MATCHED THEN UPDATE SET destino.descricao = origem.descricao WHEN NOT MATCHED THEN INSERT (labirinto_id, descricao) VALUES (origem.labirinto_id, origem.descricao);
MERGE INTO labirintos destino USING (SELECT 16 AS labirinto_id, 'Labirinto Diagonal' AS descricao FROM dual) origem ON (destino.labirinto_id = origem.labirinto_id) WHEN MATCHED THEN UPDATE SET destino.descricao = origem.descricao WHEN NOT MATCHED THEN INSERT (labirinto_id, descricao) VALUES (origem.labirinto_id, origem.descricao);
MERGE INTO labirintos destino USING (SELECT 17 AS labirinto_id, 'O Labirinto do Minotauro' AS descricao FROM dual) origem ON (destino.labirinto_id = origem.labirinto_id) WHEN MATCHED THEN UPDATE SET destino.descricao = origem.descricao WHEN NOT MATCHED THEN INSERT (labirinto_id, descricao) VALUES (origem.labirinto_id, origem.descricao);
MERGE INTO labirintos destino USING (SELECT 18 AS labirinto_id, 'Ilusão de Ótica' AS descricao FROM dual) origem ON (destino.labirinto_id = origem.labirinto_id) WHEN MATCHED THEN UPDATE SET destino.descricao = origem.descricao WHEN NOT MATCHED THEN INSERT (labirinto_id, descricao) VALUES (origem.labirinto_id, origem.descricao);
MERGE INTO labirintos destino USING (SELECT 19 AS labirinto_id, 'Duas Cidades' AS descricao FROM dual) origem ON (destino.labirinto_id = origem.labirinto_id) WHEN MATCHED THEN UPDATE SET destino.descricao = origem.descricao WHEN NOT MATCHED THEN INSERT (labirinto_id, descricao) VALUES (origem.labirinto_id, origem.descricao);
MERGE INTO labirintos destino USING (SELECT 20 AS labirinto_id, 'Espiral Cega' AS descricao FROM dual) origem ON (destino.labirinto_id = origem.labirinto_id) WHEN MATCHED THEN UPDATE SET destino.descricao = origem.descricao WHEN NOT MATCHED THEN INSERT (labirinto_id, descricao) VALUES (origem.labirinto_id, origem.descricao);

COMMIT;

-- 2. Inserção das linhas da matriz
-- Labirinto 1
MERGE INTO labirintos_matriz destino USING (
   SELECT 1 AS labirinto_id, 0 AS linha, '12111111111111' AS layout FROM dual
   UNION ALL SELECT 1, 1, '10000100000001' FROM dual
   UNION ALL SELECT 1, 2, '11110101111101' FROM dual
   UNION ALL SELECT 1, 3, '10000100010001' FROM dual
   UNION ALL SELECT 1, 4, '10111111010111' FROM dual
   UNION ALL SELECT 1, 5, '10100000010001' FROM dual
   UNION ALL SELECT 1, 6, '10101111111101' FROM dual
   UNION ALL SELECT 1, 7, '10001000000101' FROM dual
   UNION ALL SELECT 1, 8, '11111011110101' FROM dual
   UNION ALL SELECT 1, 9, '10000010000101' FROM dual
   UNION ALL SELECT 1, 10, '10111110111101' FROM dual
   UNION ALL SELECT 1, 11, '10000000100001' FROM dual
   UNION ALL SELECT 1, 12, '11111111101101' FROM dual
   UNION ALL SELECT 1, 13, '11111111111131' FROM dual
) origem ON (destino.labirinto_id = origem.labirinto_id AND destino.linha = origem.linha)
WHEN MATCHED THEN UPDATE SET destino.layout = origem.layout
WHEN NOT MATCHED THEN INSERT (labirinto_id, linha, layout) VALUES (origem.labirinto_id, origem.linha, origem.layout);

-- Labirinto 2
MERGE INTO labirintos_matriz destino USING (
   SELECT 2 AS labirinto_id, 0 AS linha, '11111111111121' AS layout FROM dual
   UNION ALL SELECT 2, 1, '10001000000001' FROM dual
   UNION ALL SELECT 2, 2, '10101011111111' FROM dual
   UNION ALL SELECT 2, 3, '10100010000001' FROM dual
   UNION ALL SELECT 2, 4, '10111110111101' FROM dual
   UNION ALL SELECT 2, 5, '10000000100001' FROM dual
   UNION ALL SELECT 2, 6, '11111110101111' FROM dual
   UNION ALL SELECT 2, 7, '10000010100001' FROM dual
   UNION ALL SELECT 2, 8, '10111010111101' FROM dual
   UNION ALL SELECT 2, 9, '10100010001001' FROM dual
   UNION ALL SELECT 2, 10, '10101111101011' FROM dual
   UNION ALL SELECT 2, 11, '10101000001001' FROM dual
   UNION ALL SELECT 2, 12, '10100011111101' FROM dual
   UNION ALL SELECT 2, 13, '13111111111111' FROM dual
) origem ON (destino.labirinto_id = origem.labirinto_id AND destino.linha = origem.linha)
WHEN MATCHED THEN UPDATE SET destino.layout = origem.layout
WHEN NOT MATCHED THEN INSERT (labirinto_id, linha, layout) VALUES (origem.labirinto_id, origem.linha, origem.layout);

-- Labirinto 3
MERGE INTO labirintos_matriz destino USING (
   SELECT 3 AS labirinto_id, 0 AS linha, '12111111111111' AS layout FROM dual
   UNION ALL SELECT 3, 1, '10100010000001' FROM dual
   UNION ALL SELECT 3, 2, '10101011111101' FROM dual
   UNION ALL SELECT 3, 3, '10101000000001' FROM dual
   UNION ALL SELECT 3, 4, '10001011111101' FROM dual
   UNION ALL SELECT 3, 5, '11111010000001' FROM dual
   UNION ALL SELECT 3, 6, '10000010111111' FROM dual
   UNION ALL SELECT 3, 7, '10111110100001' FROM dual
   UNION ALL SELECT 3, 8, '10000010101101' FROM dual
   UNION ALL SELECT 3, 9, '11111010000101' FROM dual
   UNION ALL SELECT 3, 10, '10000010110101' FROM dual
   UNION ALL SELECT 3, 11, '11111010110001' FROM dual
   UNION ALL SELECT 3, 12, '10000000111101' FROM dual
   UNION ALL SELECT 3, 13, '11111111111131' FROM dual
) origem ON (destino.labirinto_id = origem.labirinto_id AND destino.linha = origem.linha)
WHEN MATCHED THEN UPDATE SET destino.layout = origem.layout
WHEN NOT MATCHED THEN INSERT (labirinto_id, linha, layout) VALUES (origem.labirinto_id, origem.linha, origem.layout);

-- Labirinto 4
MERGE INTO labirintos_matriz destino USING (
   SELECT 4 AS labirinto_id, 0 AS linha, '11111111111121' AS layout FROM dual
   UNION ALL SELECT 4, 1, '10000000000001' FROM dual
   UNION ALL SELECT 4, 2, '10101010101011' FROM dual
   UNION ALL SELECT 4, 3, '10101010101011' FROM dual
   UNION ALL SELECT 4, 4, '10101111101011' FROM dual
   UNION ALL SELECT 4, 5, '10100000101011' FROM dual
   UNION ALL SELECT 4, 6, '10101010101011' FROM dual
   UNION ALL SELECT 4, 7, '10101010101011' FROM dual
   UNION ALL SELECT 4, 8, '10101000101011' FROM dual
   UNION ALL SELECT 4, 9, '10101111101011' FROM dual
   UNION ALL SELECT 4, 10, '10100000001011' FROM dual
   UNION ALL SELECT 4, 11, '10111111111011' FROM dual
   UNION ALL SELECT 4, 12, '10000000000001' FROM dual
   UNION ALL SELECT 4, 13, '11111111111131' FROM dual
) origem ON (destino.labirinto_id = origem.labirinto_id AND destino.linha = origem.linha)
WHEN MATCHED THEN UPDATE SET destino.layout = origem.layout
WHEN NOT MATCHED THEN INSERT (labirinto_id, linha, layout) VALUES (origem.labirinto_id, origem.linha, origem.layout);

-- Labirinto 5
MERGE INTO labirintos_matriz destino USING (
   SELECT 5 AS labirinto_id, 0 AS linha, '12111111111111' AS layout FROM dual
   UNION ALL SELECT 5, 1, '10000000000011' FROM dual
   UNION ALL SELECT 5, 2, '11010101010111' FROM dual
   UNION ALL SELECT 5, 3, '10000000000011' FROM dual
   UNION ALL SELECT 5, 4, '11010101010111' FROM dual
   UNION ALL SELECT 5, 5, '10000000000001' FROM dual
   UNION ALL SELECT 5, 6, '10101010101101' FROM dual
   UNION ALL SELECT 5, 7, '10000000000001' FROM dual
   UNION ALL SELECT 5, 8, '10101010101011' FROM dual
   UNION ALL SELECT 5, 9, '10000000000001' FROM dual
   UNION ALL SELECT 5, 10, '11010101010101' FROM dual
   UNION ALL SELECT 5, 11, '10000000000001' FROM dual
   UNION ALL SELECT 5, 12, '10111111111101' FROM dual
   UNION ALL SELECT 5, 13, '11111111111131' FROM dual
) origem ON (destino.labirinto_id = origem.labirinto_id AND destino.linha = origem.linha)
WHEN MATCHED THEN UPDATE SET destino.layout = origem.layout
WHEN NOT MATCHED THEN INSERT (labirinto_id, linha, layout) VALUES (origem.labirinto_id, origem.linha, origem.layout);

-- Labirinto 6
MERGE INTO labirintos_matriz destino USING (
   SELECT 6 AS labirinto_id, 0 AS linha, '12111111111111' AS layout FROM dual
   UNION ALL SELECT 6, 1, '10000001000001' FROM dual
   UNION ALL SELECT 6, 2, '10111101110101' FROM dual
   UNION ALL SELECT 6, 3, '10100000000101' FROM dual
   UNION ALL SELECT 6, 4, '10101101111101' FROM dual
   UNION ALL SELECT 6, 5, '10001101000001' FROM dual
   UNION ALL SELECT 6, 6, '11101111011111' FROM dual
   UNION ALL SELECT 6, 7, '10000000010001' FROM dual
   UNION ALL SELECT 6, 8, '10111111110111' FROM dual
   UNION ALL SELECT 6, 9, '10000000000001' FROM dual
   UNION ALL SELECT 6, 10, '11111111110111' FROM dual
   UNION ALL SELECT 6, 11, '10000000000001' FROM dual
   UNION ALL SELECT 6, 12, '11111111111101' FROM dual
   UNION ALL SELECT 6, 13, '11111111111131' FROM dual
) origem ON (destino.labirinto_id = origem.labirinto_id AND destino.linha = origem.linha)
WHEN MATCHED THEN UPDATE SET destino.layout = origem.layout
WHEN NOT MATCHED THEN INSERT (labirinto_id, linha, layout) VALUES (origem.labirinto_id, origem.linha, origem.layout);

-- Labirinto 7
MERGE INTO labirintos_matriz destino USING (
   SELECT 7 AS labirinto_id, 0 AS linha, '12111111111111' AS layout FROM dual
   UNION ALL SELECT 7, 1, '10010101010101' FROM dual
   UNION ALL SELECT 7, 2, '11010101010101' FROM dual
   UNION ALL SELECT 7, 3, '10000101010101' FROM dual
   UNION ALL SELECT 7, 4, '10110101010101' FROM dual
   UNION ALL SELECT 7, 5, '10100001010101' FROM dual
   UNION ALL SELECT 7, 6, '10101101010101' FROM dual
   UNION ALL SELECT 7, 7, '10101000010101' FROM dual
   UNION ALL SELECT 7, 8, '10101011010101' FROM dual
   UNION ALL SELECT 7, 9, '10101010000101' FROM dual
   UNION ALL SELECT 7, 10, '10101010110101' FROM dual
   UNION ALL SELECT 7, 11, '10101010100001' FROM dual
   UNION ALL SELECT 7, 12, '11111111111101' FROM dual
   UNION ALL SELECT 7, 13, '11111111111131' FROM dual
) origem ON (destino.labirinto_id = origem.labirinto_id AND destino.linha = origem.linha)
WHEN MATCHED THEN UPDATE SET destino.layout = origem.layout
WHEN NOT MATCHED THEN INSERT (labirinto_id, linha, layout) VALUES (origem.labirinto_id, origem.linha, origem.layout);

-- Labirinto 8
MERGE INTO labirintos_matriz destino USING (
   SELECT 8 AS labirinto_id, 0 AS linha, '12111111111111' AS layout FROM dual
   UNION ALL SELECT 8, 1, '10000010000001' FROM dual
   UNION ALL SELECT 8, 2, '11111010111101' FROM dual
   UNION ALL SELECT 8, 3, '10000010000101' FROM dual
   UNION ALL SELECT 8, 4, '10111111110101' FROM dual
   UNION ALL SELECT 8, 5, '10100000000101' FROM dual
   UNION ALL SELECT 8, 6, '10101111101101' FROM dual
   UNION ALL SELECT 8, 7, '10101000000001' FROM dual
   UNION ALL SELECT 8, 8, '10101011111111' FROM dual
   UNION ALL SELECT 8, 9, '10101000000001' FROM dual
   UNION ALL SELECT 8, 10, '10101010111101' FROM dual
   UNION ALL SELECT 8, 11, '10000000000001' FROM dual
   UNION ALL SELECT 8, 12, '10111111111101' FROM dual
   UNION ALL SELECT 8, 13, '11111111111131' FROM dual
) origem ON (destino.labirinto_id = origem.labirinto_id AND destino.linha = origem.linha)
WHEN MATCHED THEN UPDATE SET destino.layout = origem.layout
WHEN NOT MATCHED THEN INSERT (labirinto_id, linha, layout) VALUES (origem.labirinto_id, origem.linha, origem.layout);

-- Labirinto 9
MERGE INTO labirintos_matriz destino USING (
   SELECT 9 AS labirinto_id, 0 AS linha, '12111111111111' AS layout FROM dual
   UNION ALL SELECT 9, 1, '10010000010001' FROM dual
   UNION ALL SELECT 9, 2, '11010111010101' FROM dual
   UNION ALL SELECT 9, 3, '10000100000101' FROM dual
   UNION ALL SELECT 9, 4, '10111101111101' FROM dual
   UNION ALL SELECT 9, 5, '10000001000001' FROM dual
   UNION ALL SELECT 9, 6, '11111101011111' FROM dual
   UNION ALL SELECT 9, 7, '10000001010001' FROM dual
   UNION ALL SELECT 9, 8, '10111111010101' FROM dual
   UNION ALL SELECT 9, 9, '10000100010101' FROM dual
   UNION ALL SELECT 9, 10, '11110101110101' FROM dual
   UNION ALL SELECT 9, 11, '10000000000001' FROM dual
   UNION ALL SELECT 9, 12, '10111111111001' FROM dual
   UNION ALL SELECT 9, 13, '11111111111131' FROM dual
) origem ON (destino.labirinto_id = origem.labirinto_id AND destino.linha = origem.linha)
WHEN MATCHED THEN UPDATE SET destino.layout = origem.layout
WHEN NOT MATCHED THEN INSERT (labirinto_id, linha, layout) VALUES (origem.labirinto_id, origem.linha, origem.layout);

-- Labirinto 10
MERGE INTO labirintos_matriz destino USING (
   SELECT 10 AS labirinto_id, 0 AS linha, '12111111111111' AS layout FROM dual
   UNION ALL SELECT 10, 1, '10000000000001' FROM dual
   UNION ALL SELECT 10, 2, '11011101110101' FROM dual
   UNION ALL SELECT 10, 3, '10000000000001' FROM dual
   UNION ALL SELECT 10, 4, '10101101110111' FROM dual
   UNION ALL SELECT 10, 5, '10000000000001' FROM dual
   UNION ALL SELECT 10, 6, '11110111011101' FROM dual
   UNION ALL SELECT 10, 7, '10000000000001' FROM dual
   UNION ALL SELECT 10, 8, '10111101110111' FROM dual
   UNION ALL SELECT 10, 9, '10000000000001' FROM dual
   UNION ALL SELECT 10, 10, '11011101110101' FROM dual
   UNION ALL SELECT 10, 11, '10000000000001' FROM dual
   UNION ALL SELECT 10, 12, '11111111111101' FROM dual
   UNION ALL SELECT 10, 13, '11111111111131' FROM dual
) origem ON (destino.labirinto_id = origem.labirinto_id AND destino.linha = origem.linha)
WHEN MATCHED THEN UPDATE SET destino.layout = origem.layout
WHEN NOT MATCHED THEN INSERT (labirinto_id, linha, layout) VALUES (origem.labirinto_id, origem.linha, origem.layout);

-- Labirinto 11: A Grande Bifurcação
MERGE INTO labirintos_matriz destino USING (
   SELECT 11 AS labirinto_id, 0 AS linha, '12111111111111' AS layout FROM dual
   UNION ALL SELECT 11, 1, '10000010000001' FROM dual
   UNION ALL SELECT 11, 2, '11111010111101' FROM dual
   UNION ALL SELECT 11, 3, '10001010100001' FROM dual
   UNION ALL SELECT 11, 4, '10101010101111' FROM dual
   UNION ALL SELECT 11, 5, '10100010000001' FROM dual
   UNION ALL SELECT 11, 6, '10111111111101' FROM dual
   UNION ALL SELECT 11, 7, '10100000000001' FROM dual
   UNION ALL SELECT 11, 8, '10101111111101' FROM dual
   UNION ALL SELECT 11, 9, '10001000000001' FROM dual
   UNION ALL SELECT 11, 10, '11111011111101' FROM dual
   UNION ALL SELECT 11, 11, '10000010000001' FROM dual
   UNION ALL SELECT 11, 12, '10111111111101' FROM dual
   UNION ALL SELECT 11, 13, '11111111111131' FROM dual
) origem ON (destino.labirinto_id = origem.labirinto_id AND destino.linha = origem.linha)
WHEN MATCHED THEN UPDATE SET destino.layout = origem.layout
WHEN NOT MATCHED THEN INSERT (labirinto_id, linha, layout) VALUES (origem.labirinto_id, origem.linha, origem.layout);

-- Labirinto 12: Ziguezague Cerrado
MERGE INTO labirintos_matriz destino USING (
   SELECT 12 AS labirinto_id, 0 AS linha, '12111111111111' AS layout FROM dual
   UNION ALL SELECT 12, 1, '10100000000001' FROM dual
   UNION ALL SELECT 12, 2, '10101111111111' FROM dual
   UNION ALL SELECT 12, 3, '10100000000001' FROM dual
   UNION ALL SELECT 12, 4, '10111111111101' FROM dual
   UNION ALL SELECT 12, 5, '10000000000001' FROM dual
   UNION ALL SELECT 12, 6, '10111111111111' FROM dual
   UNION ALL SELECT 12, 7, '10000000000001' FROM dual
   UNION ALL SELECT 12, 8, '11111111111101' FROM dual
   UNION ALL SELECT 12, 9, '10000000000001' FROM dual
   UNION ALL SELECT 12, 10, '10111111111111' FROM dual
   UNION ALL SELECT 12, 11, '10000000000001' FROM dual
   UNION ALL SELECT 12, 12, '11111111111101' FROM dual
   UNION ALL SELECT 12, 13, '11111111111131' FROM dual
) origem ON (destino.labirinto_id = origem.labirinto_id AND destino.linha = origem.linha)
WHEN MATCHED THEN UPDATE SET destino.layout = origem.layout
WHEN NOT MATCHED THEN INSERT (labirinto_id, linha, layout) VALUES (origem.labirinto_id, origem.linha, origem.layout);

-- Labirinto 13: Falsa Promessa
MERGE INTO labirintos_matriz destino USING (
   SELECT 13 AS labirinto_id, 0 AS linha, '12111111111111' AS layout FROM dual
   UNION ALL SELECT 13, 1, '10000000000001' FROM dual
   UNION ALL SELECT 13, 2, '10111111111101' FROM dual
   UNION ALL SELECT 13, 3, '10100000000101' FROM dual
   UNION ALL SELECT 13, 4, '10101111110101' FROM dual
   UNION ALL SELECT 13, 5, '10101000010101' FROM dual
   UNION ALL SELECT 13, 6, '10101011010101' FROM dual
   UNION ALL SELECT 13, 7, '10101001010101' FROM dual
   UNION ALL SELECT 13, 8, '10101111010101' FROM dual
   UNION ALL SELECT 13, 9, '10100000010101' FROM dual
   UNION ALL SELECT 13, 10, '10111111110101' FROM dual
   UNION ALL SELECT 13, 11, '10000000000101' FROM dual
   UNION ALL SELECT 13, 12, '11111111111101' FROM dual
   UNION ALL SELECT 13, 13, '11111111111131' FROM dual
) origem ON (destino.labirinto_id = origem.labirinto_id AND destino.linha = origem.linha)
WHEN MATCHED THEN UPDATE SET destino.layout = origem.layout
WHEN NOT MATCHED THEN INSERT (labirinto_id, linha, layout) VALUES (origem.labirinto_id, origem.linha, origem.layout);

-- Labirinto 14: Quatro Quadrantes
MERGE INTO labirintos_matriz destino USING (
    SELECT 14 AS labirinto_id, 0 AS linha, '12111111111111' AS layout FROM dual
    UNION ALL SELECT 14, 1, '10000010000001' FROM dual
    UNION ALL SELECT 14, 2, '10111010111101' FROM dual
    UNION ALL SELECT 14, 3, '10100010100001' FROM dual
    UNION ALL SELECT 14, 4, '10101010101111' FROM dual
    UNION ALL SELECT 14, 5, '10001000100001' FROM dual
    UNION ALL SELECT 14, 6, '11111011111101' FROM dual
    UNION ALL SELECT 14, 7, '10000000000001' FROM dual
    UNION ALL SELECT 14, 8, '10111111101111' FROM dual
    UNION ALL SELECT 14, 9, '10000010101001' FROM dual
    UNION ALL SELECT 14, 10, '11111010101011' FROM dual
    UNION ALL SELECT 14, 11, '10001010100001' FROM dual
    UNION ALL SELECT 14, 12, '10101010111101' FROM dual
    UNION ALL SELECT 14, 13, '11111111111131' FROM dual
) origem ON (destino.labirinto_id = origem.labirinto_id AND destino.linha = origem.linha)
WHEN MATCHED THEN UPDATE SET destino.layout = origem.layout
WHEN NOT MATCHED THEN INSERT (labirinto_id, linha, layout) VALUES (origem.labirinto_id, origem.linha, origem.layout);

-- Labirinto 15: Anéis Entrelaçados
MERGE INTO labirintos_matriz destino USING (
    SELECT 15 AS labirinto_id, 0 AS linha, '11111111111121' AS layout FROM dual
    UNION ALL SELECT 15, 1, '10000000000001' FROM dual
    UNION ALL SELECT 15, 2, '10111111111101' FROM dual
    UNION ALL SELECT 15, 3, '10100000000101' FROM dual
    UNION ALL SELECT 15, 4, '10101111110101' FROM dual
    UNION ALL SELECT 15, 5, '10101000010101' FROM dual
    UNION ALL SELECT 15, 6, '10101011010101' FROM dual
    UNION ALL SELECT 15, 7, '10101010010101' FROM dual
    UNION ALL SELECT 15, 8, '10101011110101' FROM dual
    UNION ALL SELECT 15, 9, '10101000000101' FROM dual
    UNION ALL SELECT 15, 10, '10101111111101' FROM dual
    UNION ALL SELECT 15, 11, '10100000000001' FROM dual
    UNION ALL SELECT 15, 12, '10111111111111' FROM dual
    UNION ALL SELECT 15, 13, '13111111111111' FROM dual
) origem ON (destino.labirinto_id = origem.labirinto_id AND destino.linha = origem.linha)
WHEN MATCHED THEN UPDATE SET destino.layout = origem.layout
WHEN NOT MATCHED THEN INSERT (labirinto_id, linha, layout) VALUES (origem.labirinto_id, origem.linha, origem.layout);

-- Labirinto 16: Labirinto Diagonal
MERGE INTO labirintos_matriz destino USING (
    SELECT 16 AS labirinto_id, 0 AS linha, '12111111111111' AS layout FROM dual
    UNION ALL SELECT 16, 1, '10100000000001' FROM dual
    UNION ALL SELECT 16, 2, '10101111111101' FROM dual
    UNION ALL SELECT 16, 3, '10101000000001' FROM dual
    UNION ALL SELECT 16, 4, '10001011111101' FROM dual
    UNION ALL SELECT 16, 5, '11111010000001' FROM dual
    UNION ALL SELECT 16, 6, '10000010101111' FROM dual
    UNION ALL SELECT 16, 7, '10111110100001' FROM dual
    UNION ALL SELECT 16, 8, '10100010101111' FROM dual
    UNION ALL SELECT 16, 9, '10101110100001' FROM dual
    UNION ALL SELECT 16, 10, '10101000111101' FROM dual
    UNION ALL SELECT 16, 11, '10101111100001' FROM dual
    UNION ALL SELECT 16, 12, '10000000101101' FROM dual
    UNION ALL SELECT 16, 13, '11111111111131' FROM dual
) origem ON (destino.labirinto_id = origem.labirinto_id AND destino.linha = origem.linha)
WHEN MATCHED THEN UPDATE SET destino.layout = origem.layout
WHEN NOT MATCHED THEN INSERT (labirinto_id, linha, layout) VALUES (origem.labirinto_id, origem.linha, origem.layout);

-- Labirinto 17: O Labirinto do Minotauro
MERGE INTO labirintos_matriz destino USING (
    SELECT 17 AS labirinto_id, 0 AS linha, '12111111111111' AS layout FROM dual
    UNION ALL SELECT 17, 1, '10000000000001' FROM dual
    UNION ALL SELECT 17, 2, '11111010111101' FROM dual
    UNION ALL SELECT 17, 3, '10000010000101' FROM dual
    UNION ALL SELECT 17, 4, '10111111110101' FROM dual
    UNION ALL SELECT 17, 5, '10100000000101' FROM dual
    UNION ALL SELECT 17, 6, '10101111111101' FROM dual
    UNION ALL SELECT 17, 7, '10101000000101' FROM dual
    UNION ALL SELECT 17, 8, '10101011110101' FROM dual
    UNION ALL SELECT 17, 9, '10101010000101' FROM dual
    UNION ALL SELECT 17, 10, '10101011111101' FROM dual
    UNION ALL SELECT 17, 11, '10100000000001' FROM dual
    UNION ALL SELECT 17, 12, '10111111111101' FROM dual
    UNION ALL SELECT 17, 13, '11111111111131' FROM dual
) origem ON (destino.labirinto_id = origem.labirinto_id AND destino.linha = origem.linha)
WHEN MATCHED THEN UPDATE SET destino.layout = origem.layout
WHEN NOT MATCHED THEN INSERT (labirinto_id, linha, layout) VALUES (origem.labirinto_id, origem.linha, origem.layout);

-- Labirinto 18: Ilusão de Ótica
MERGE INTO labirintos_matriz destino USING (
    SELECT 18 AS labirinto_id, 0 AS linha, '11111111111121' AS layout FROM dual
    UNION ALL SELECT 18, 1, '10001010101001' FROM dual
    UNION ALL SELECT 18, 2, '10101010101011' FROM dual
    UNION ALL SELECT 18, 3, '10101010100001' FROM dual
    UNION ALL SELECT 18, 4, '10101010111101' FROM dual
    UNION ALL SELECT 18, 5, '10101010000001' FROM dual
    UNION ALL SELECT 18, 6, '10101011111101' FROM dual
    UNION ALL SELECT 18, 7, '10101000000001' FROM dual
    UNION ALL SELECT 18, 8, '10101111111101' FROM dual
    UNION ALL SELECT 18, 9, '10100000000001' FROM dual
    UNION ALL SELECT 18, 10, '10111111111111' FROM dual
    UNION ALL SELECT 18, 11, '10000000000001' FROM dual
    UNION ALL SELECT 18, 12, '10101010101011' FROM dual
    UNION ALL SELECT 18, 13, '13111111111111' FROM dual
) origem ON (destino.labirinto_id = origem.labirinto_id AND destino.linha = origem.linha)
WHEN MATCHED THEN UPDATE SET destino.layout = origem.layout
WHEN NOT MATCHED THEN INSERT (labirinto_id, linha, layout) VALUES (origem.labirinto_id, origem.linha, origem.layout);

-- Labirinto 19: Duas Cidades
MERGE INTO labirintos_matriz destino USING (
    SELECT 19 AS labirinto_id, 0 AS linha, '12111111111111' AS layout FROM dual
    UNION ALL SELECT 19, 1, '10000000000001' FROM dual
    UNION ALL SELECT 19, 2, '10110101111101' FROM dual
    UNION ALL SELECT 19, 3, '10000101000001' FROM dual
    UNION ALL SELECT 19, 4, '11111101011111' FROM dual
    UNION ALL SELECT 19, 5, '10000001000001' FROM dual
    UNION ALL SELECT 19, 6, '11111101111111' FROM dual
    UNION ALL SELECT 19, 7, '10000101000001' FROM dual
    UNION ALL SELECT 19, 8, '10110101011101' FROM dual
    UNION ALL SELECT 19, 9, '10110101011101' FROM dual
    UNION ALL SELECT 19, 10, '10000101000001' FROM dual
    UNION ALL SELECT 19, 11, '11111101111111' FROM dual
    UNION ALL SELECT 19, 12, '10000000000001' FROM dual
    UNION ALL SELECT 19, 13, '11111111111131' FROM dual
) origem ON (destino.labirinto_id = origem.labirinto_id AND destino.linha = origem.linha)
WHEN MATCHED THEN UPDATE SET destino.layout = origem.layout
WHEN NOT MATCHED THEN INSERT (labirinto_id, linha, layout) VALUES (origem.labirinto_id, origem.linha, origem.layout);

-- Labirinto 20: Espiral Cega
MERGE INTO labirintos_matriz destino USING (
    SELECT 20 AS labirinto_id, 0 AS linha, '12111111111111' AS layout FROM dual
    UNION ALL SELECT 20, 1, '10000000000001' FROM dual
    UNION ALL SELECT 20, 2, '10111111111101' FROM dual
    UNION ALL SELECT 20, 3, '10100000000101' FROM dual
    UNION ALL SELECT 20, 4, '10101111110101' FROM dual
    UNION ALL SELECT 20, 5, '10101000010101' FROM dual
    UNION ALL SELECT 20, 6, '10101011010101' FROM dual
    UNION ALL SELECT 20, 7, '10101000010101' FROM dual
    UNION ALL SELECT 20, 8, '10101111110101' FROM dual
    UNION ALL SELECT 20, 9, '10100000000101' FROM dual
    UNION ALL SELECT 20, 10, '10111111111101' FROM dual
    UNION ALL SELECT 20, 11, '10000000000001' FROM dual
    UNION ALL SELECT 20, 12, '11111111111101' FROM dual
    UNION ALL SELECT 20, 13, '11111111111131' FROM dual
) origem ON (destino.labirinto_id = origem.labirinto_id AND destino.linha = origem.linha)
WHEN MATCHED THEN UPDATE SET destino.layout = origem.layout
WHEN NOT MATCHED THEN INSERT (labirinto_id, linha, layout) VALUES (origem.labirinto_id, origem.linha, origem.layout);

COMMIT;

END;
/
