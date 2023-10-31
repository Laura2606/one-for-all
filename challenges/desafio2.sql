SELECT
(SELECT COUNT(*) FROM tabela_musicas) AS cancoes,
(SELECT COUNT(DISTINCT artista_id) FROM tabela_artista) AS artistas,
(SELECT COUNT(*) FROM tabela_album) AS albuns;