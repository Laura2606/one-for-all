

SELECT 
u.nome_usuario AS pessoa_usuaria,
COUNT(h.musica_id) AS musicas_ouvidas,
ROUND(SUM(m.duracao_segundos) / 60, 2) AS total_minutos
FROM tabela_usuario u
JOIN tabela_historico h ON u.usuario_id = h.usuario_id
JOIN tabela_musicas m ON h.musica_id = m.musica_id
GROUP BY
u.nome_usuario
ORDER BY 
pessoa_usuaria;