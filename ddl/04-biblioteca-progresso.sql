-- tabela biblioteca (jogos adquiridos por usuário)
create table biblioteca (
    id int primary key,
    id_usuario int not null,
    id_jogo int not null,
    tempo_jogado_min int,
    data_aquisicao timestamp,
    unique (id_usuario, id_jogo),
    constraint fk_biblioteca_usuario
        foreign key (id_usuario)
        references usuario(id)
        on delete cascade,
    constraint fk_biblioteca_jogo
        foreign key (id_jogo)
        references jogo(id)
        on delete cascade
);

-- tabela conquista (conquistas por jogo)
create table conquista (
    id int primary key,
    id_jogo int not null,
    nome varchar(200) not null,
    descricao varchar(255) not null,
    constraint fk_conquista_jogo
        foreign key (id_jogo)
        references jogo(id)
        on delete cascade
);

-- tabela conquista_usuario (conquistas desbloqueadas)
create table conquista_usuario (
    id int primary key,
    id_usuario int not null,
    id_conquista int not null,
    data_desbloqueio timestamp default now(),
    unique (id_usuario, id_conquista),
    constraint fk_conquista_usuario_usuario
        foreign key (id_usuario)
        references usuario(id)
        on delete cascade,
    constraint fk_conquista_usuario_conquista
        foreign key (id_conquista)
        references conquista(id)
        on delete cascade
);

-- tabela save_jogo (arquivos de save na nuvem)
create table save_jogo (
    id int primary key,
    id_usuario int not null,
    id_jogo int not null,
    link_arquivo varchar(500) not null,
    data_sync timestamp default now(),
    constraint fk_save_jogo_usuario
        foreign key (id_usuario)
        references usuario(id)
        on delete cascade,
    constraint fk_save_jogo_jogo
        foreign key (id_jogo)
        references jogo(id) 
);

-- tabela historico_sessao (registro de sessões de jogo)
create table historico_sessao (
    id int primary key,
    id_usuario int not null,
    id_jogo int not null,
    data_inicio timestamp not null,
    data_fim timestamp,
    constraint fk_sessao_usuario
        foreign key (id_usuario)
        references usuario(id),
    constraint fk_sessao_jogo
        foreign key (id_jogo)
        references jogo(id)      
);
