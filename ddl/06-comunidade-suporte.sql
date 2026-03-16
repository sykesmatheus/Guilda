create table avaliacao (
	id int not null primary key,
	id_usuario int not null,
	id_jogo int not null,
	texto varchar(500),
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
	mensagem varchar(500)
);

create table banimento (
id int not null primary key,
id_usuario int not null,
motivo_banimento varchar(200),
data_expiracao date
); 


ALTER TABLE avaliacao 
ADD CONSTRAINT fk_usuario_avaliacao FOREIGN KEY (id_usuario) REFERENCES usuario(id);

ALTER TABLE ticket_suporte 
ADD CONSTRAINT fk_usuario_ticket FOREIGN KEY (id_usuario) REFERENCES usuario(id);

ALTER TABLE banimento 
ADD CONSTRAINT fk_usuario_banimento FOREIGN KEY (id_usuario) REFERENCES usuario(id);

ALTER TABLE mensagem_ticket 
ADD CONSTRAINT fk_ticket_mensagem FOREIGN KEY (id_ticket) REFERENCES ticket_suporte(id); 
