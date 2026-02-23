



-- Tabela de Tags
create table tags (
    id int not null,
    nome_tag varchar(50) not null,
    primary key (id)
);

-- Tabela de Jogos_Tags (Relacionamento N:N)
create table jogos_tags (
    id_jogo int not null,
    id_tag int not null,
    numero_votos int default 0,
    primary key (id_jogo, id_tag)
);

-- Tabela de Idiomas
create table idiomas (
    id int not null,
    nome_idioma varchar(50) not null,
    primary key (id)
);

-- Tabela de Jogos_Idiomas
create table jogos_idiomas (
    id_jogo int not null,
    id_idioma int not null,
    dublado_bool boolean,
    legendado_bool boolean,
    primary key (id_jogo, id_idioma)
);

-- Tabela de Requisitos_Sistema
create table requisitos_sistema (
    id int not null,
    id_jogo int not null,
    tipo varchar(10) not null, -- 'Min' ou 'Rec'
    cpu varchar(100),
    gpu varchar(100),
    ram varchar(20),
    os varchar(50),
    primary key (id)
);
