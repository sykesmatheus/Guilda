create table moeda (
	id_moeda int not null,
	codigo_moeda varchar(3) not null ,
	simbolo_moeda varchar(5),
	primary key (id_moeda)
);

create table preco_regional (
	id_jogo int not null,
	id_moeda int not null,
	valor_localizado decimal (10,2),
	primary key (id_jogo, id_moeda)
);

create table metodo_pagamento (
	id_metodo int not null,
	nome_metodo varchar(50) not null,
	primary key (id_metodo)
);

create table transacao (
	id_transacao int not null,
	id_usuario int not null,
	id_metodo int not null ,
	valor_total decimal(10,2),
	data_transacao timestamp,
	status_transacao varchar(20),
	primary key (id_transacao)
);

create table iten_transacao(
	id_transacao int not null,
	id_jogo int not null,
	preco_vendido decimal(10,2),
	primary key (id_transacao, id_jogo)
);

create table lista_desejo(
	id_usuario int not null,
	id_jogo int not null,
	data_adicao date,
	primary key (id_usuario, id_jogo)
);

create table cupom (
	id_cupom int not null,
	codigo_cupom varchar(20) not null,
	desconto_percentual int,
	id_usuario_dono int not null,
	primary key (id_cupom)
);

create table reembolso (
	id_reembolso int not null,
	id_transacao int not null,
	motivo_reembolso text,
	status_aprovacao varchar(20),
	primary key (id_reembolso)
);
