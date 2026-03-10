
CREATE TABLE moeda (
    id INT NOT NULL PRIMARY KEY,
    codigo VARCHAR(3) NOT NULL,
    simbolo VARCHAR(5)
);

CREATE TABLE metodo_pagamento (
    id INT NOT NULL PRIMARY KEY,
    nome VARCHAR(50) NOT NULL
);


CREATE TABLE preco_regional (
    id INT NOT NULL PRIMARY KEY, 
    id_jogo INT NOT NULL,
    id_moeda INT NOT NULL,
    valor_localizado DECIMAL(10,2)
);

CREATE TABLE item_transacao (
    id INT NOT NULL PRIMARY KEY, 
    id_transacao INT NOT NULL,
    id_jogo INT NOT NULL,
    preco_vendido DECIMAL(10,2)
);

CREATE TABLE lista_desejo (
    id INT NOT NULL PRIMARY KEY, 
    id_usuario INT NOT NULL,
    id_jogo INT NOT NULL,
    data_adicao DATE
);


CREATE TABLE transacao (
    id INT NOT NULL PRIMARY KEY,
    id_usuario INT NOT NULL,
    id_metodo INT NOT NULL,
    valor_total DECIMAL(10,2),
    data_transacao TIMESTAMP,
    status VARCHAR(20)
);

CREATE TABLE cupom (
    id INT NOT NULL PRIMARY KEY,
    codigo VARCHAR(20) NOT NULL,
    desconto_percentual INT,
    id_usuario INT NOT NULL
);

CREATE TABLE reembolso (
    id INT NOT NULL PRIMARY KEY,
    id_transacao INT NOT NULL,
    motivo VARCHAR(500),
    status_aprovacao VARCHAR(20)
);

ALTER TABLE preco_regional ADD CONSTRAINT fk_jogo_preco FOREIGN KEY (id_jogo) REFERENCES jogo(id);
ALTER TABLE preco_regional ADD CONSTRAINT fk_moeda_preco FOREIGN KEY (id_moeda) REFERENCES moeda(id);


ALTER TABLE transacao ADD CONSTRAINT fk_usuario_transacao FOREIGN KEY (id_usuario) REFERENCES usuario(id);
ALTER TABLE transacao ADD CONSTRAINT fk_metodo_transacao FOREIGN KEY (id_metodo) REFERENCES metodo_pagamento(id);


ALTER TABLE item_transacao ADD CONSTRAINT fk_transacao_item FOREIGN KEY (id_transacao) REFERENCES transacao(id);
ALTER TABLE item_transacao ADD CONSTRAINT fk_jogo_item FOREIGN KEY (id_jogo) REFERENCES jogo(id);


ALTER TABLE lista_desejo ADD CONSTRAINT fk_usuario_desejo FOREIGN KEY (id_usuario) REFERENCES usuario(id);
ALTER TABLE lista_desejo ADD CONSTRAINT fk_jogo_desejo FOREIGN KEY (id_jogo) REFERENCES jogo(id);


ALTER TABLE cupom ADD CONSTRAINT fk_usuario_cupom FOREIGN KEY (id_usuario) REFERENCES usuario(id);
ALTER TABLE reembolso ADD CONSTRAINT fk_transacao_reembolso FOREIGN KEY (id_transacao) REFERENCES transacao(id);
