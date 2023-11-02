SELECT a.nome AS artista,
al.nome_album AS album,
COUNT(sa.usuario_id) AS pessoas_seguidoras
FROM tabela_artista a
JOIN tabela_album al ON a.artista_id = al.artista
LEFT JOIN tabela_seguindo_artista sa ON a.artista_id = sa.artista_id
GROUP BY
a.nome, al.nome_album
ORDER BY
pessoas_seguidoras DESC, a.nome, al.nome_album;
