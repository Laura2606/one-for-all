SELECT
m.nome AS cancao,
COUNT(h.usuario_id) AS reproducoes
FROM 
tabela_musicas m
JOIN 
tabela_historico h ON m.musica_id = h.musica_id
GROUP BY
m.nome
ORDER BY
reproducoes DESC, cancao
LIMIT 2;

