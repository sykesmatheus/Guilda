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

