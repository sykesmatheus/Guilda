-- limpeza do banco (drop table)

DROP TABLE IF EXISTS notificacao CASCADE;
DROP TABLE IF EXISTS membro_grupo CASCADE;
DROP TABLE IF EXISTS grupo CASCADE;
DROP TABLE IF EXISTS lista_bloqueio CASCADE;
DROP TABLE IF EXISTS amizade CASCADE;
DROP TABLE IF EXISTS perfil CASCADE;
DROP TABLE IF EXISTS usuario CASCADE;

-- tabela pai principal
create table usuario (
    id serial primary key,
    email varchar(150) not null unique,
    senha_hash varchar(255) not null,
    data_criacao timestamp not null default current_timestamp,
    saldo_carteira decimal(10,2) not null default 0.00
);

-- tabela de perfil
create table perfil (
    id_usuario int primary key,
    nick_name varchar(50) not null unique,
    bio varchar(250),
    avatar_url varchar(2083),
    nivel_atual int not null default 1,
    constraint fk_perfil_usuario foreign key (id_usuario) references usuario(id) on delete cascade
);

-- tabela de amizade
create table amizade (
    id serial primary key,
    id_usuario_a int not null,
    id_usuario_b int not null,
    data_inicio timestamp not null default current_timestamp,
    status varchar(20) not null check (status in ('pendente', 'aceito', 'bloqueado')),
    constraint fk_amizade_a foreign key (id_usuario_a) references usuario(id) on delete cascade,
    constraint fk_amizade_b foreign key (id_usuario_b) references usuario(id) on delete cascade,
    constraint check_usuarios_distintos check (id_usuario_a <> id_usuario_b)
);

-- tabela de lista de bloqueio
create table lista_bloqueio (
    id serial primary key,
    id_usuario int not null,
    id_usuario_bloqueado int not null,
    data_bloqueio timestamp default current_timestamp,
    constraint fk_bloqueador foreign key (id_usuario) references usuario(id) on delete cascade,
    constraint fk_bloqueado foreign key (id_usuario_bloqueado) references usuario(id) on delete cascade
);

-- tabela de grupo
create table grupo (
    id serial primary key,
    nome varchar(100) not null,
    descricao varchar(255),
    id_criador int not null,
    data_criacao timestamp default current_timestamp,
    constraint fk_grupo_criador foreign key (id_criador) references usuario(id)
);

-- tabela de membro do grupo
create table membro_grupo (
    id serial primary key,
    id_grupo int not null,
    id_usuario int not null,
    cargo varchar(50) not null default 'membro',
    data_adesao timestamp default current_timestamp,
    constraint fk_membro_grupo_origem foreign key (id_grupo) references grupo(id) on delete cascade,
    constraint fk_membro_usuario_origem foreign key (id_usuario) references usuario(id) on delete cascade
);

-- tabela de notificacao
create table notificacao (
    id serial primary key,
    id_usuario int not null,
    mensagem varchar(255) not null,
    lida_bool boolean default false,
    data_envio timestamp not null default current_timestamp,
    constraint fk_notif_usuario_origem foreign key (id_usuario) references usuario(id) on delete cascade
);


-- inserção de dados (30 registros por tabela)


-- .1) inserts em usuario
insert into usuario (email, senha_hash, saldo_carteira) values
('ana.silva@email.com', 'hash_123', 50.00), ('bruno.melo@email.com', 'hash_124', 120.50),
('carla.dias@email.com', 'hash_125', 10.00), ('diego.souza@email.com', 'hash_126', 0.00),
('elena.martins@email.com', 'hash_127', 350.00), ('fabio.lima@email.com', 'hash_128', 45.00),
('gabriel.vaz@email.com', 'hash_129', 15.00), ('helena.rocha@email.com', 'hash_130', 88.00),
('igor.nunes@email.com', 'hash_131', 12.00), ('julia.ferreira@email.com', 'hash_132', 200.00),
('kevin.santos@email.com', 'hash_133', 5.50), ('lara.gomes@email.com', 'hash_134', 90.00),
('marcos.oliveira@email.com', 'hash_135', 150.00), ('nina.castro@email.com', 'hash_136', 33.00),
('otavio.pinto@email.com', 'hash_137', 0.00), ('paula.leite@email.com', 'hash_138', 75.00),
('quel.ribeiro@email.com', 'hash_139', 120.00), ('rafael.costa@email.com', 'hash_140', 10.00),
('sofia.alves@email.com', 'hash_141', 25.00), ('tiago.mendes@email.com', 'hash_142', 60.00),
('ursula.bezerra@email.com', 'hash_143', 500.00), ('vitor.pereira@email.com', 'hash_144', 42.00),
('wagner.silva@email.com', 'hash_145', 18.00), ('xenia.luz@email.com', 'hash_146', 99.00),
('yago.frota@email.com', 'hash_147', 7.00), ('zilda.reis@email.com', 'hash_148', 130.00),
('arthur.moraes@email.com', 'hash_149', 22.00), ('beatriz.paz@email.com', 'hash_150', 55.00),
('caio.teixeira@email.com', 'hash_151', 80.00), ('dora.viana@email.com', 'hash_152', 11.00);

-- .2) inserts em perfil
insert into perfil (id_usuario, nick_name, bio, nivel_atual) values
(1, 'anas', 'amo games', 5), (2, 'brunom', 'dev fullstack', 10), (3, 'carlad', 'viajante', 2),
(4, 'diegos', 'gamer br', 1), (5, 'elenam', 'artista digital', 15), (6, 'fabiol', 'musico', 4),
(7, 'gabi_vaz', 'café e código', 8), (8, 'helenar', 'fotógrafa', 12), (9, 'igorn', 'esportista', 3),
(10, 'jujufer', 'moda e estilo', 7), (11, 'kev_santos', 'estudante', 1), (12, 'larag', 'cozinheira', 9),
(13, 'marcoso', 'investidor', 11), (14, 'ninac', 'escritora', 6), (15, 'otaviop', 'skater', 2),
(16, 'paulal', 'designer', 14), (17, 'quelr', 'arquiteta', 5), (18, 'rafacosta', 'aventureiro', 8),
(19, 'sofiaa', 'leitora voraz', 13), (20, 'tiagom', 'cineasta', 10), (21, 'ursulab', 'ceo', 20),
(22, 'vitorp', 'trader', 4), (23, 'wagsilva', 'mecânico', 3), (24, 'xenial', 'yoga', 9),
(25, 'yagof', 'surfista', 2), (26, 'zildar', 'aposentada feliz', 5), (27, 'artmoraes', 'historiador', 7),
(28, 'biapaz', 'paz e amor', 1), (29, 'caiotex', 'programador java', 12), (30, 'dorav', 'enfermeira', 6);

-- .3) inserts em grupo
insert into grupo (nome, descricao, id_criador) values
('devs brasil', 'grupo para programadores', 1), ('gamers unidos', 'focado em fps', 2),
('culinária fácil', 'receitas rápidas', 3), ('investimentos', 'dicas financeiras', 5),
('leitura mensal', 'clube do livro', 10), ('trilhas sp', 'passeios na natureza', 8),
('futebol fds', 'marcar peladas', 6), ('música indie', 'compartilhar bandas', 7),
('yoga em casa', 'práticas diárias', 24), ('artesanato', 'dicas de diy', 14),
('cinema cult', 'discussão de filmes', 20), ('designers br', 'portfolio e dicas', 16),
('surf e praia', 'melhores picos', 25), ('marketing digital', 'estratégias', 21),
('história geral', 'fatos históricos', 27), ('skate board', 'manobras', 15),
('arquitetura moderna', 'projetos', 17), ('moda sustentável', 'roupas', 10),
('fotografia mobile', 'fotos de celular', 8), ('trader elite', 'operações diárias', 22),
('escritores', 'dicas de escrita', 14), ('café especial', 'grãos e preparo', 7),
('python pro', 'focado em python', 29), ('javascript', 'ecossistema js', 2),
('caminhada matinal', 'saúde', 30), ('dicas de viagem', 'roteiros', 3),
('desenho realista', 'técnicas', 5), ('anime lovers', 'discussões', 4),
('pet lovers', 'cuidado com bichos', 19), ('corrida de rua', 'treinos', 9);

-- .4) inserts em amizade
insert into amizade (id_usuario_a, id_usuario_b, status) values
(1, 2, 'aceito'), (1, 3, 'aceito'), (2, 4, 'pendente'), (5, 6, 'aceito'),
(7, 8, 'aceito'), (9, 10, 'bloqueado'), (11, 12, 'pendente'), (13, 14, 'aceito'),
(15, 16, 'aceito'), (17, 18, 'aceito'), (19, 20, 'pendente'), (21, 22, 'aceito'),
(23, 24, 'aceito'), (25, 26, 'aceito'), (27, 28, 'pendente'), (29, 30, 'aceito'),
(1, 10, 'aceito'), (2, 11, 'aceito'), (3, 12, 'pendente'), (4, 13, 'bloqueado'),
(5, 14, 'aceito'), (6, 15, 'aceito'), (7, 16, 'pendente'), (8, 17, 'aceito'),
(9, 18, 'aceito'), (20, 21, 'aceito'), (22, 23, 'pendente'), (24, 25, 'aceito'),
(26, 27, 'aceito'), (28, 29, 'aceito');

-- .5) inserts em membro_grupo
insert into membro_grupo (id_grupo, id_usuario, cargo) values
(1, 1, 'admin'), (1, 2, 'membro'), (2, 2, 'admin'), (2, 4, 'membro'),
(3, 3, 'admin'), (3, 12, 'membro'), (4, 5, 'admin'), (4, 13, 'membro'),
(5, 10, 'admin'), (5, 19, 'membro'), (6, 8, 'admin'), (6, 18, 'membro'),
(7, 6, 'admin'), (7, 9, 'membro'), (8, 7, 'admin'), (8, 22, 'membro'),
(9, 24, 'admin'), (9, 23, 'membro'), (10, 14, 'admin'), (10, 28, 'membro'),
(11, 20, 'admin'), (11, 1, 'membro'), (12, 16, 'admin'), (12, 17, 'membro'),
(13, 25, 'admin'), (13, 15, 'membro'), (14, 21, 'admin'), (14, 11, 'membro'),
(15, 27, 'admin'), (15, 30, 'membro');

-- .6) inserts em notificacao
insert into notificacao (id_usuario, mensagem, lida_bool) values
(1, 'você tem um novo pedido de amizade', false), (2, 'bruno curtiu sua foto', true),
(3, 'sua conta foi verificada', true), (4, 'saldo insuficiente para a compra', false),
(5, 'novo nível alcançado!', true), (6, 'você foi adicionado ao grupo futebol', false),
(7, 'mensagem direta de gabi', false), (8, 'alerta de segurança: novo login', true),
(9, 'sua postagem foi removida', true), (10, 'promoção na loja de skins', false),
(11, 'bem-vindo ao sistema!', true), (12, 'lara comentou no seu perfil', false),
(13, 'seu investimento rendeu!', true), (14, 'novo seguidor: nina', false),
(15, 'você foi bloqueado por um usuário', true), (16, 'paula enviou um arquivo', false),
(17, 'reunião de grupo amanhã', false), (18, 'rafa está ao vivo', true),
(19, 'livro do mês disponível', false), (20, 'filme novo em discussão', true),
(21, 'relatório mensal pronto', true), (22, 'dica de trade do dia', false),
(23, 'manutenção do sistema hoje', true), (24, 'nova aula de yoga postada', false),
(25, 'ondas grandes hoje no litoral!', true), (26, 'feliz aniversário!', false),
(27, 'fato histórico do dia', true), (28, 'bia enviou uma mensagem de paz', false),
(29, 'erro no seu código python', false), (30, 'hora do remédio/treino', true);
