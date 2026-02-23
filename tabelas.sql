
-- Tabela biblioteca (jogos adquiridos por usuário)
CREATE TABLE biblioteca (
    id_usuario INTEGER NOT NULL,
    id_jogo INTEGER NOT NULL,
    tempo_jogado_min INTEGER DEFAULT 0,
    data_aquisicao TIMESTAMP DEFAULT NOW(),
    PRIMARY KEY (id_usuario, id_jogo)
);

-- Tabela conquista (conquitas por jogo)
CREATE TABLE conquista (
    id SERIAL PRIMARY KEY,
    id_jogo INTEGER NOT NULL,
    nome VARCHAR(200) NOT NULL,
    descricao TEXT
);

-- Tabela conquista_usuario (conquistas desbloqueadas)
CREATE TABLE conquista_usuario (
    id_usuario INTEGER NOT NULL,
    id_conquista INTEGER NOT NULL,
    data_desbloqueio TIMESTAMP DEFAULT NOW(),
    PRIMARY KEY (id_usuario, id_conquista)
);

-- Tabela save_jogo (arquivos de save na nuvem)
CREATE TABLE save_jogo (
    id SERIAL PRIMARY KEY,
    id_usuario INTEGER NOT NULL,
    id_jogo INTEGER NOT NULL,
    link_arquivo VARCHAR(500) NOT NULL,
    data_sync TIMESTAMP DEFAULT NOW()
);

-- Tabela categoria_biblioteca (categorias personalizadas do usuário)
CREATE TABLE categoria_biblioteca (
    id_usuario INTEGER NOT NULL,
    nome_categoria VARCHAR(100) NOT NULL,
    PRIMARY KEY (id_usuario, nome_categoria)
);

-- Tabela biblioteca_categoria (relaciona jogos da biblioteca com categorias)
CREATE TABLE biblioteca_categoria (
    id_usuario_categoria INTEGER NOT NULL,   -- usuário dono da categoria
    nome_categoria VARCHAR(100) NOT NULL,    -- nome da categoria
    id_jogo INTEGER NOT NULL,                 -- jogo categorizado
    PRIMARY KEY (id_usuario_categoria, nome_categoria, id_jogo)
);

-- Tabela historico_sessao (registro de sessões de jogo)
CREATE TABLE historico_sessao (
    id SERIAL PRIMARY KEY,
    id_usuario INTEGER NOT NULL,
    id_jogo INTEGER NOT NULL,
    data_inicio TIMESTAMP NOT NULL,
    data_fim TIMESTAMP
);

-- Tabela estatistica_jogo (estatísticas variadas por jogo)
CREATE TABLE estatistica_jogo (
    id_usuario INTEGER NOT NULL,
    id_jogo INTEGER NOT NULL,
    nome_estatistica VARCHAR(100) NOT NULL,
    valor NUMERIC,
    PRIMARY KEY (id_usuario, id_jogo, nome_estatistica)
);


create table avaliacao (
	id int not null primary key,
	id_usuario int not null,
	id_jogo int not null,
	texto text,
	recomendado_bool boolean,
	data_postagem date
);

create table oficina_mod (
	id int not null primary key,
	id_jogo int not null,
	id_autor int not null,
	nome_mod varchar(100),
	link_arquivo varchar(300)
);

create table ticket_suporte (
	id int not null primary key,
	id_usuario int not null,
	assunto varchar(200),
	status_ticket varchar(50)
);

create table mensagem_ticket (
	id int not null primary key,
	id_ticket int not null,
	remetente_tipo varchar (50),
	mensagem text
);

create table banimento (
id_usuario int not null primary key,
motivo_banimento text,
data_expiracao date
); 
>>>>>>> 2730d8f5e5e1dbcd36e5cba29cd8beac6c9da799
