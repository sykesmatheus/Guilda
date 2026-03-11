-- Tabela de Publicadoras
create table publicadora(
    DROP TABLE IF EXISTS publicadora;
    id int not null,
    nome varchar(50) not null,
    sede varchar(50) not null,
    primary key (id)
);

-- Tabela de Jogos
create table jogo (
    DROP TABLE IF EXISTS jogo;
    id int not null,
    titulo varchar(60),
    resumo varchar(800),
    preco_base decimal (10,2),
    primary key (id)
);

-- Tabela de DLCs
create table dlc (
    DROP TABLE IF EXISTS dlc;
    id int not null,
    titulo varchar(60),
    preco decimal (10,2),
    primary key (id)
);

-- Tabela de generos
create table genero (
    DROP TABLE IF EXISTS genero;
    id int not null,
    nome_genero varchar(40),
    primary key (id)
);

-- Tabela de Tags
create table tag (
    DROP TABLE IF EXISTS tag;
    id int not null,
    nome_tag varchar(50) not null,
    primary key (id)
);

-- Tabela de jogo_genero (relacionamento N:N)
create table jogo_genero (
    DROP TABLE IF EXISTS jogo_genero;
    id int not null,
    id_jogo int,
    id_genero int,
    primary key (id)
    );

-- Tabela de Jogos_Tags (Relacionamento N:N)
create table jogo_tag (
    DROP TABLE IF EXISTS jogo_tag;
    id int not null,
    id_jogo int not null,
    id_tag int not null,
    numero_votos int default 0,
    primary key (id)
);

-- Tabela de Idiomas
create table idioma (
    DROP TABLE IF EXISTS idioma;
    id int not null,
    nome_idioma varchar(50) not null,
    primary key (id)
);

-- Tabela de Jogos_Idiomas
create table jogo_idioma (
    DROP TABLE IF EXISTS jogo_idioma;
    id int not null,
    id_jogo int not null,
    id_idioma int not null,
    dublado_bool boolean,
    legendado_bool boolean,
    primary key (id)
);

-- Tabela de Requisitos_Sistema
create table requisito_sistema (
    DROP TABLE IF EXISTS requisito_sistema;
    id int not null,
    id_jogo int not null,
    tipo varchar(10) not null, -- 'Min' ou 'Rec'
    cpu varchar(100),
    gpu varchar(100),
    ram varchar(20),
    os varchar(50),
    primary key (id)
);
