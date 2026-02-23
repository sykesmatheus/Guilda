CREATE TABLE itens_bases (
    id SERIAL PRIMARY KEY,
    nome TEXT,
    raridade TEXT,
    id_jogo_origem INT
);

CREATE TABLE inventarios_usuarios (
    id_serial SERIAL PRIMARY KEY,
    id_item_base INT,
    id_usuario_dono INT
);

CREATE TABLE mercados_anuncios (
    id SERIAL PRIMARY KEY,
    id_serial_item INT,
    preco_venda DECIMAL,
    id_vendedor INT
);

CREATE TABLE mercados_historicos (
    id SERIAL PRIMARY KEY,
    id_item_base INT,
    valor_venda DECIMAL,
    data_venda TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE ofertas_trocas (
    id SERIAL PRIMARY KEY,
    id_remetente INT,
    id_destinatario INT,
    status TEXT
);

CREATE TABLE itens_ofertas_trocas (
    id_oferta INT,
    id_serial_item INT,
    PRIMARY KEY (id_oferta, id_serial_item)
);

CREATE TABLE insignias (
    id SERIAL PRIMARY KEY,
    nome TEXT,
    xp_recompensa INT,
    id_jogo INT
);

CREATE TABLE insignias_usuarios (
    id_usuario INT,
    id_insignia INT,
    nivel INT,
    PRIMARY KEY (id_usuario, id_insignia)
);
