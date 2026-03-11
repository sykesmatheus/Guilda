DROP TABLE IF EXISTS publicadora CASCADE;
DROP TABLE IF EXISTS jogo CASCADE;
DROP TABLE IF EXISTS dlc CASCADE;
DROP TABLE IF EXISTS genero CASCADE;
DROP TABLE IF EXISTS tag CASCADE;
DROP TABLE IF EXISTS jogo_genero CASCADE;
DROP TABLE IF EXISTS jogo_tag CASCADE;
DROP TABLE IF EXISTS idioma CASCADE;
DROP TABLE IF EXISTS jogo_idioma cascade;
DROP TABLE IF EXISTS requisito_sistema CASCADE;


-- Tabela de Publicadoras
create table publicadora(
    id int not null,
    nome varchar(50) not null,
    sede varchar(50) not null,
    primary key (id)
);

-- Tabela de Jogos
create table jogo (
    id int not null,
    id_publicadora int not null,
    titulo varchar(60),
    resumo varchar(800),
    preco_base decimal (10,2),
    primary key (id),
    foreign key (id_publicadora) references publicadora(id)
);

-- Tabela de DLCs (Relacionamento 1:N)
create table dlc (
    id int not null,
    titulo varchar(60),
    preco decimal (10,2),
    id_jogo int,
    primary key (id),
    foreign key (id_jogo) references jogo(id)
);

-- Tabela de generos
create table genero (
    id int not null,
    nome_genero varchar(40),
    primary key (id)
);

-- Tabela de Tags
create table tag (
    id int not null,
    nome_tag varchar(50) not null,
    primary key (id)
);

-- Tabela de Idiomas
create table idioma (
    id int not null,
    nome_idioma varchar(50) not null,
    primary key (id)
);

-- Tabela de jogo_genero (relacionamento N:N)
create table jogo_genero (
    id int not null,
    id_jogo int,
    id_genero int,
    primary key (id),
    foreign key (id_jogo) references jogo(id),
    foreign key (id_genero) references genero(id)
    );

-- Tabela de Jogos_Tags (Relacionamento N:N)
create table jogo_tag (
    id int not null,
    id_jogo int not null,
    id_tag int not null,
    numero_votos int default 0,
    primary key (id),
    foreign key (id_jogo) references jogo(id),
    foreign key (id_tag) references tag(id)
);

-- Tabela de Jogos_Idiomas
create table jogo_idioma (
    id int not null,
    id_jogo int not null,
    id_idioma int not null,
    dublado_bool boolean,
    legendado_bool boolean,
    primary key (id),
    foreign key (id_jogo) references jogo(id),
    foreign key (id_idioma) references idioma(id)
);

-- Tabela de Requisitos_Sistema
create table requisito_sistema (
    id int not null,
    id_jogo int not null,
    tipo varchar(10) not null, -- 'Min' ou 'Rec'
    cpu varchar(100),
    gpu varchar(100),
    ram varchar(20),
    os varchar(50),
    primary key (id),
    foreign key (id_jogo) references jogo(id)
);

-- Tabelas Pai

-- Publicadoras
INSERT INTO publicadora (id, nome, sede) VALUES 
(1, 'FromSoftware', 'Tóquio, Japão'),
(2, 'CD Projekt Red', 'Varsóvia, Polônia');

-- Jogos
INSERT INTO jogo (id, titulo, resumo, preco_base, id_publicadora) VALUES 
(10, 'Elden Ring', 'Um RPG de ação em um mundo de fantasia sombria.', 249.90, 1),
(11, 'Cyberpunk 2077', 'Um RPG de mundo aberto futurista.', 199.90, 2);

-- Gêneros
INSERT INTO genero (id, nome_genero) VALUES 
(1, 'RPG'),
(2, 'Ação'),
(3, 'Soulslike');

-- Tags
INSERT INTO tag (id, nome_tag) VALUES 
(1, 'Mundo Aberto'),
(2, 'Difícil'),
(3, 'Cyberpunk');

-- Idiomas
INSERT INTO idioma (id, nome_idioma) VALUES 
(1, 'Português-BR'),
(2, 'Inglês'),
(3, 'Japonês');

-- DLCs
INSERT INTO dlc (id, titulo, preco, id_jogo) VALUES 
(1, 'Shadow of the Erdtree', 150.00, 10),
(2, 'Phantom Liberty', 99.00, 11);

-- Jogo_Gênero (Vínculos N:N)
INSERT INTO jogo_genero (id, id_jogo, id_genero) VALUES 
(1, 10, 1), -- Elden Ring é RPG
(2, 10, 3), -- Elden Ring é Soulslike
(3, 11, 1); -- Cyberpunk é RPG

-- Jogo_Tag (Vínculos N:N)
INSERT INTO jogo_tag (id, id_jogo, id_tag, numero_votos) VALUES 
(1, 10, 1, 5000), -- Elden Ring: Mundo Aberto
(2, 10, 2, 8000), -- Elden Ring: Difícil
(3, 11, 3, 4500); -- Cyberpunk: Cyberpunk

-- Jogo_Idioma (Vínculos N:N)
INSERT INTO jogo_idioma (id, id_jogo, id_idioma, dublado_bool, legendado_bool) VALUES 
(1, 10, 1, false, true), -- Elden Ring: Legendas em PT-BR
(2, 11, 1, true, true);  -- Cyberpunk: Dublado e Legendado em PT-BR

-- Requisitos de Sistema
INSERT INTO requisito_sistema (id, id_jogo, tipo, cpu, gpu, ram, os) VALUES 
(1, 10, 'Min', 'Intel Core i5-8400', 'NVIDIA GTX 1060', '12GB', 'Windows 10'),
(2, 10, 'Rec', 'Intel Core i7-8700K', 'NVIDIA RTX 3070', '16GB', 'Windows 11');
