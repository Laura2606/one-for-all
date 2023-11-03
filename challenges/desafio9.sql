SELECT
COUNT(h.musica_id) AS musicas_no_historico
FROM tabela_historico h
JOIN tabela_usuario u ON h.usuario_id = u.usuario_id
WHERE nome_usuario = 'Barbara Liskov';