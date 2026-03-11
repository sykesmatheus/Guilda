-- drop tables
   DROP TABLE IF EXISTS biblioteca CASCADE;
   DROP TABLE IF EXISTS conquista CASCADE;
   DROP TABLE IF EXISTS conquista_usuario CASCADE;
   DROP TABLE IF EXISTS save_jogo CASCADE;
   DROP TABLE IF EXISTS historico_sessao CASCADE;

-- tabela biblioteca (jogos adquiridos por usuário)
create table biblioteca (
    id int not null,
    id_usuario int not null,
    id_jogo int not null,
    tempo_jogado_min int,
    data_aquisicao timestamp,
    unique (id_usuario, id_jogo),
    primary key (id),
    foreign key (id_usuario) references usuario(id),
    foreign key (id_jogo) references jogo(id)
);

-- tabela conquista (conquistas por jogo)
create table conquista (
    id int not null,
    id_jogo int not null,
    nome varchar(200) not null,
    descricao varchar(255) not null,
    primary key (id),
    foreign key (id_jogo) references jogo(id)
);

-- tabela conquista_usuario (conquistas desbloqueadas)
create table conquista_usuario (
    id int not null,
    id_usuario int not null,
    id_conquista int not null,
    data_desbloqueio timestamp default now(),
    unique (id_usuario, id_conquista),
    primary key (id),
    foreign key (id_usuario) references usuario(id),
    foreign key (id_conquista) references conquista(id)
);

-- tabela save_jogo (arquivos de save na nuvem)
create table save_jogo (
    id int not null,
    id_usuario int not null,
    id_jogo int not null,
    link_arquivo varchar(500) not null,
    data_sync timestamp default now(),
    primary key (id),
    foreign key (id_usuario) references usuario(id),
    foreign key (id_jogo) references jogo(id)
);

-- tabela historico_sessao (registro de sessões de jogo)
create table historico_sessao (
    id int not null,
    id_usuario int not null,
    id_jogo int not null,
    data_inicio timestamp not null,
    data_fim timestamp,
    primary key (id),
    foreign key (id_usuario) references usuario(id),
    foreign key (id_jogo) references jogo(id)
);

-- Inserir na Biblioteca (Jogos que o usuário possui)
INSERT INTO biblioteca (id, id_usuario, id_jogo, tempo_jogado_min, data_aquisicao) 
VALUES (1, 1, 10, 1500, '2026-03-01 10:00:00');

-- Conquistas 
INSERT INTO conquista (id, id_jogo, nome, descricao) 
VALUES (101, 10, 'Primeiros Passos', 'Complete o tutorial do jogo.');

INSERT INTO conquista (id, id_jogo, nome, descricao) 
VALUES (102, 10, 'Mestre das Sombras', 'Derrote o primeiro chefe secreto.');

INSERT INTO conquista (id, id_jogo, nome, descricao) 
VALUES (201, 11, 'Viciado em Tech', 'Instale seu primeiro implante cibernético.');

-- Conquista do Usuário
INSERT INTO conquista_usuario (id, id_usuario, id_conquista, data_desbloqueio) 
VALUES (1, 1, 101, '2026-03-11 12:00:00');

-- Save na Nuvem
INSERT INTO save_jogo (id, id_usuario, id_jogo, link_arquivo) 
VALUES (1, 1, 10, '/cloud/saves/user1_jogo10.dat');

-- Histórico de Sessão
INSERT INTO historico_sessao (id, id_usuario, id_jogo, data_inicio, data_fim) 
VALUES (1, 1, 10, '2026-03-11 10:00:00', '2026-03-11 12:30:00');
