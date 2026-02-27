CREATE TABLE item_base (
    id INT not null,
    nome VARCHAR(50),
    raridade VARCHAR(50),
    id_jogo_origem INT
);

CREATE TABLE inventario_usuario (
    id INT not null,
    id_item_base INT not null,
    id_usuario_dono INT not null
);

CREATE TABLE mercado_anuncio  (
    id INT not null,
    id_serial_item INT not null,
    preco_venda DECIMAL,
    id_vendedor INT not null
);

CREATE TABLE mercado_historico (
    id INT not null,
    id_item_base INT not null,
    valor_venda DECIMAL,
    data_venda TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE oferta_troca (
    id INT not null,
    id_remetente INT not null,
    id_destinatario INT not null,
    status VARCHAR(50)
);

CREATE TABLE item_oferta_troca (
    id_oferta INT not null,
    id_serial_item INT not null,
    PRIMARY KEY (id_oferta)
);

CREATE TABLE insignia (
    id INT not null,
    nome VARCHAR(50),
    xp_recompensa INT,
    id_jogo INT
);

CREATE TABLE insignia_usuario (
    id_usuario INT not null,
    id_insignia INT not null,
    nivel INT not null,
    PRIMARY KEY (id_usuario)
);
