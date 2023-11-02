SELECT
u.nome_usuario AS pessoa_usuaria,
CASE 
WHEN MAX(h.data_reproducao) >= '2021-01-01' THEN 'Ativa'
ELSE 'Inativa'
END AS status_pessoa_usuaria
FROM
tabela_usuario u
LEFT JOIN
tabela_historico h ON u.usuario_id = h.usuario_id
GROUP BY
u.nome_usuario
ORDER BY
pessoa_usuaria;