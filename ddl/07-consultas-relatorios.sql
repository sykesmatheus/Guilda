
SELECT c.nome AS categoria, j.nome AS jogo
FROM jogo j
RIGHT JOIN categoria c ON j.id_categoria = c.id;

SELECT u.profile_name, j.nome AS jogo_na_biblioteca
FROM biblioteca b
INNER JOIN usuario u ON b.id_usuario = u.id
INNER JOIN jogo j ON b.id_jogo = j.id;

SELECT u.profile_name, m.id AS id_transacao_mercado, m.valor
FROM usuario u
LEFT JOIN mercado m ON u.id = m.id_usuario;

SELECT i.nome AS item_inventario, j.nome AS jogo_origem
FROM inventario i
INNER JOIN jogo j ON i.id_jogo = j.id;

SELECT t.titulo AS topico_forum, u.profile_name AS autor_discussao
FROM forum t
INNER JOIN usuario u ON t.id_usuario = u.id;

SELECT j.nome AS jogo, d.nome AS dlc_vinculada
FROM jogo j
LEFT JOIN dlc d ON j.id = d.id_jogo;

SELECT a.id_usuario, u.profile_name AS nome_amigo
FROM amigo a
INNER JOIN usuario u ON a.id_amigo = u.id;

SELECT m.nome AS item_mercado, r.descricao AS raridade_tipo
FROM mercado m
INNER JOIN raridade r ON m.id_raridade = r.id;

SELECT d.nome AS desenvolvedor, j.nome AS jogo_publicado
FROM jogo j
RIGHT JOIN desenvolvedor d ON j.id_desenvolvedor = d.id;

SELECT t.id AS id_transacao, j.nome AS produto_adquirido, t.valor_total
FROM transacao t
INNER JOIN item_transacao it ON t.id = it.id_transacao
INNER JOIN jogo j ON it.id_jogo = j.id;

SELECT c.nome AS conquista, u.profile_name AS usuario_desbloqueou
FROM conquista c
LEFT JOIN conquista_usuario cu ON c.id = cu.id_conquista
LEFT JOIN usuario u ON cu.id_usuario = u.id;

SELECT j.nome AS titulo_jogo, a.texto AS avaliacao_usuario
FROM jogo j
INNER JOIN avaliacao a ON j.id = a.id_jogo;
