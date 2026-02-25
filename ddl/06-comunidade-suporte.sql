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
