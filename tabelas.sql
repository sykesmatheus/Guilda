
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


-- Nucleo de usuario
	
-- Tabela de Usuários
create table usuarios (
	id int not null,
	email varchar(150) not null,
	senha_hash varchar(150) not null,
	data_criacao datatime not null,
	saldo_carteira decimal(10,2) default,
	primary key (id)
)

-- Tabela de Perfis
create table perfis (
	id_usuarios int not null,
	nick_name varchar(50) not null,
	bio varchar(250),
	avatar_url varchar (2083),
	nivel_atual int default 1,
)

-- Tabela de Amizades
create table amizades (
	id_usuario_a int not null
	id_usuario_b int not null
	data_inicio datatime not null,
	status varchar(20) not null
	primary key (id_usuario_a, id_usuario_b)
)
-- Tabela de Lista de Bloqueio
create table lista_bloqueio (
	id_usuario int not null,
	id_usuario_bloqueado int not null,
	primary key (id_usuario, id_usuario_bloqueado)
)

-- Tabela de Grupos
create table grupos (
    id int not null,
    nome varchar(100) not null,
    descricao varchar(255),
    id_criador int not null,
    primary key (id)
);

-- Tabela de Membros do Grupo
create table membros_grupo (
    id_grupo int not null,
    id_usuario int not null,
    cargo varchar(50) not null,
    primary key (id_grupo, id_usuario)
);

-- Tabela de Notificacoes
create table notificacoes (
    id int not null,
    id_usuario int not null,
    mensagem varchar(255) not null,
    lida_bool boolean,
    data datetime not null,
    primary key (id)
);

-- Fim nucleo de Usuarios


-- Catálogo de Jogos e Conteúdo




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
-- Fim do Catálogo de Jogos e Conteúdo

















