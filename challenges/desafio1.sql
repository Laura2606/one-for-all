-- Descomente e altere as linhas abaixo:
DROP DATABASE IF EXISTS SpotifyClone;
CREATE DATABASE IF NOT EXISTS SpotifyClone;
USE SpotifyClone;

CREATE TABLE tabela_artista (
    artista_id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(255)
) engine = InnoDB;

CREATE TABLE tabela_plano(
   plano_id INT PRIMARY KEY AUTO_INCREMENT,
   nome ENUM('gratuito', 'familiar', 'universitario', 'pessoal'),
  valor_plano DECIMAL(3,2)
) engine = InnoDB;

CREATE TABLE tabela_album(
   album_id INT PRIMARY KEY AUTO_INCREMENT,
   nome_album VARCHAR(255),
  artista INT,
  FOREIGN KEY (artista) REFERENCES tabela_artista(artista_id)
) engine = InnoDB;

CREATE TABLE tabela_musicas(
   musica_id INT PRIMARY KEY AUTO_INCREMENT,
   nome VARCHAR(255),
   album INT,
  duracao_segundos INT,
FOREIGN KEY (album) REFERENCES tabela_album(album_id)
) engine = InnoDB;

CREATE TABLE tabela_usuario (
    usuario_id INT PRIMARY KEY AUTO_INCREMENT,
    nome_usuario VARCHAR(255),
    data_assinatura DATE,
  plano_id INT,
    FOREIGN KEY (plano_id) REFERENCES tabela_plano(plano_id),
    idade INT
) engine = InnoDB;

CREATE TABLE tabela_historico (
    usuario_id INT,
    musica_id INT,
    data_reproducao DATETIME,
    FOREIGN KEY (usuario_id) REFERENCES tabela_usuario(usuario_id),
    FOREIGN KEY (musica_id) REFERENCES tabela_musicas(musica_id),
    PRIMARY KEY (usuario_id, data_reproducao)
) engine = InnoDB;


CREATE TABLE tabela_seguindo_artista(
   usuario_id INT,
   artista_id INT,
   PRIMARY KEY (usuario_id, artista_id),
    FOREIGN KEY (usuario_id) REFERENCES tabela_usuario(usuario_id),
    FOREIGN KEY (artista_id) REFERENCES tabela_artista(artista_id)
) engine = InnoDB;



INSERT INTO tabela_artista (nome)
VALUES
('Beyoncé'),
('Queen'),
('Elis Regina'),
('Baco Exu do Blues'),
('Blind Guardian'),
('Nina Simone');


INSERT INTO tabela_plano (nome, valor_plano)
VALUES
('gratuito', "0"),
('familiar', "7.99"),
('universitario', "5.99"),
('pessoal', "6.99");

INSERT INTO tabela_album (nome_album, artista)
VALUES
('Renaissance', 1),
('Jazz', 2),
('Hot Space', 2),
('Falso Brilhante', 3),
('Vento de Maio', 3),
('QVVJFA?', 4),
('Somewhere Far Beyond', 5),
('I Put A Spell On You', 6);

INSERT INTO tabela_musicas (nome, album, duracao_segundos)
VALUES
('Break my soul', 1, 279),
("Virgo\'s groove", 1, 369),
('Alien superstar', 1, 116),
("Don't stop me now", 2, 203),
('Under Pressure', 2, 152),
('Como nossos pais', 4, 105),
('O medo de amar é o medo de ser livre', 5, 207),
('Samba em Paris', 6, 267),
("The Bard\'s Song", 7, 244),
('Feeling Good', 8, 100);


INSERT INTO tabela_usuario (nome_usuario, data_assinatura, plano_id, idade)
VALUES
  ('Barbara Liskov', '2019-10-20', 1, 82),
  ('Robert Cecil Martin', '2017-01-06', 1, 58),
 ('Ada Lovelace', '2017-12-30', 2, 37),
 ('Martin Fowler', '2017-01-17', 2, 46),
 ('Sandi Metz', '2018-04-29', 2, 58),
 ('Paulo Freire', '2018-02-14', 3, 19),
 ('Bell Hooks', '2018-01-05', 3, 26),
 ('Christopher Alexander', '2019-06-05', 4, 85),
 ('Judith Butler', '2020-05-13', 4, 45),
 ('Jorge Amado', '2017-02-17', 4, 58);
 

 INSERT INTO tabela_historico (usuario_id, musica_id, data_reproducao)
VALUES
(1, 8, "2022-02-28 10:45:55"),
(1, 2,	"2020-05-02 05:30:35"),
(1, 10,	"2020-03-06 11:22:33"),
(2, 10,	"2022-08-05 08:05:17"),
(2, 7,	"2020-12-05 18:38:30"),
(3, 2,	"2020-11-13 16:55:13"),
(3, 10, 	"2020-12-05 18:38:30"),
(4,	8, "2021-08-15 17:10:10"),
(5,	8,	"2022-01-09 01:44:33"),
(5,	5,	"2020-08-06 15:23:43"),
(6,	7,	"2017-01-24 00:31:17"),
(6,	1,	"2017-10-12 12:35:20"),
(7,	4,	"2011-12-15 22:30:49"),
(8,	4,	"2012-03-17 14:56:41"),
(9,	9,	"2022-02-24 21:14:22"),
(10, 3,	"2015-12-13 08:30:22");



INSERT INTO tabela_seguindo_artista (usuario_id, artista_id)
VALUES
(1,1),
(1,2),
(1,3),
(2,1),
(2,3),
(3,2),
(4,4),
(5,5),
(5,6),
(6,6),
(6,1),
(7,6),
(9,3),
(10,2);





