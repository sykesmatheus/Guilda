CREATE TABLE avaliacoes (
    id INT NOT NULL PRIMARY KEY,
    id_usuario INT NOT NULL,
    id_jogo INT NOT NULL,
    texto_avaliacao TEXT,
    recomendado_bool BOOLEAN,
    data_postagem DATE
);

CREATE TABLE oficinas_mods (
    id INT NOT NULL PRIMARY KEY,
    id_jogo INT NOT NULL,
    id_autor INT NOT NULL,
    nome_mod VARCHAR(100),
    link_arquivo VARCHAR(300)
);

CREATE TABLE tickets_suporte (
    id INT NOT NULL PRIMARY KEY,
    id_usuario INT NOT NULL,
    assunto VARCHAR(200),
    status_ticket VARCHAR(50)
);

CREATE TABLE mensagens_tickets (
    id INT NOT NULL PRIMARY KEY,
    id_ticket INT NOT NULL,
    remetente_tipo VARCHAR(50),
    mensagem TEXT
);

CREATE TABLE banimentos (
    id_usuario INT NOT NULL PRIMARY KEY,
    motivo_banimento TEXT,
    data_expiracao DATE
);
