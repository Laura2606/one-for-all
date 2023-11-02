SELECT 
a.nome AS artista,
al.nome_album AS album
FROM tabela_artista a
JOIN tabela_album al ON a.artista_id = al.artista
WHERE a.nome = 'Elis Regina'
ORDER BY
al.nome_album;