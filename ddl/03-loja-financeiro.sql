DROP TABLE IF EXISTS reembolso CASCADE;
DROP TABLE IF EXISTS item_transacao CASCADE;
DROP TABLE IF EXISTS transacao CASCADE;
DROP TABLE IF EXISTS lista_desejo CASCADE;
DROP TABLE IF EXISTS preco_regional CASCADE;
DROP TABLE IF EXISTS cupom CASCADE;
DROP TABLE IF EXISTS metodo_pagamento CASCADE;
DROP TABLE IF EXISTS moeda CASCADE;

CREATE TABLE moeda (
    id INT NOT NULL PRIMARY KEY,
    codigo_moeda VARCHAR(3) NOT NULL,
    simbolo_moeda VARCHAR(5)
);

CREATE TABLE metodo_pagamento (
    id INT NOT NULL PRIMARY KEY,
    nome_metodo VARCHAR(50) NOT NULL
);

CREATE TABLE preco_regional (
    id INT NOT NULL PRIMARY KEY,
    id_jogo INT NOT NULL,
    id_moeda INT NOT NULL,
    valor_localizado DECIMAL(10,2),
    FOREIGN KEY (id_jogo) REFERENCES jogo(id),
    FOREIGN KEY (id_moeda) REFERENCES moeda(id),
    UNIQUE (id_jogo, id_moeda)
);

CREATE TABLE transacao (
    id INT NOT NULL PRIMARY KEY,
    id_usuario INT NOT NULL,
    id_metodo INT NOT NULL,
    valor_total DECIMAL(10,2),
    data_transacao TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    status_transacao VARCHAR(20),
    FOREIGN KEY (id_usuario) REFERENCES usuario(id),
    FOREIGN KEY (id_metodo) REFERENCES metodo_pagamento(id)
);

CREATE TABLE item_transacao (
    id INT NOT NULL PRIMARY KEY,
    id_transacao INT NOT NULL,
    id_jogo INT NOT NULL,
    preco_vendido DECIMAL(10,2),
    FOREIGN KEY (id_transacao) REFERENCES transacao(id),
    FOREIGN KEY (id_jogo) REFERENCES jogo(id),
    UNIQUE (id_transacao, id_jogo)
);

CREATE TABLE lista_desejo (
    id INT NOT NULL PRIMARY KEY,
    id_usuario INT NOT NULL,
    id_jogo INT NOT NULL,
    data_adicao DATE,
    FOREIGN KEY (id_usuario) REFERENCES usuario(id),
    FOREIGN KEY (id_jogo) REFERENCES jogo(id),
    UNIQUE (id_usuario, id_jogo)
);

CREATE TABLE cupom (
    id INT NOT NULL PRIMARY KEY,
    codigo_cupom VARCHAR(20) NOT NULL UNIQUE,
    desconto_percentual INT CHECK (desconto_percentual BETWEEN 1 AND 100),
    id_usuario_dono INT NOT NULL,
    FOREIGN KEY (id_usuario_dono) REFERENCES usuario(id)
);

CREATE TABLE reembolso (
    id INT NOT NULL PRIMARY KEY,
    id_transacao INT NOT NULL UNIQUE,
    motivo_reembolso VARCHAR(500),
    status_aprovacao VARCHAR(20),
    FOREIGN KEY (id_transacao) REFERENCES transacao(id)
);

INSERT INTO moeda (id, codigo_moeda, simbolo_moeda) VALUES
(1, 'BRL', 'R$'),
(2, 'USD', '$'),
(3, 'EUR', '€'),
(4, 'ARS', '$');

INSERT INTO metodo_pagamento (id, nome_metodo) VALUES
(1, 'Pix'),
(2, 'Cartão de Crédito'),
(3, 'Boleto Bancário'),
(4, 'PayPal');

-- 3.2 Tabelas Principais (Min. 30)

-- Preços Regionais (Ex: 30 jogos configurados para BRL)
INSERT INTO preco_regional (id, id_jogo, id_moeda, valor_localizado) VALUES
(1, 1, 1, 199.90), (2, 2, 1, 249.00), (3, 3, 1, 50.00), (4, 4, 1, 120.50), (5, 5, 1, 299.99),
(6, 6, 1, 15.99), (7, 7, 1, 89.90), (8, 8, 1, 149.90), (9, 9, 1, 19.99), (10, 10, 1, 350.00),
(11, 11, 1, 199.90), (12, 12, 1, 249.00), (13, 13, 1, 50.00), (14, 14, 1, 120.50), (15, 15, 1, 299.99),
(16, 16, 1, 15.99), (17, 17, 1, 89.90), (18, 18, 1, 149.90), (19, 19, 1, 19.99), (20, 20, 1, 350.00),
(21, 21, 1, 199.90), (22, 22, 1, 249.00), (23, 23, 1, 50.00), (24, 24, 1, 120.50), (25, 25, 1, 299.99),
(26, 26, 1, 15.99), (27, 27, 1, 89.90), (28, 28, 1, 149.90), (29, 29, 1, 19.99), (30, 30, 1, 350.00);

-- Cupons de Desconto (30 registros)
INSERT INTO cupom (id, codigo_cupom, desconto_percentual, id_usuario_dono) VALUES
(1, 'BEMVINDO10', 10, 1), (2, 'NINJA20', 20, 2), (3, 'VERAO15', 15, 3), (4, 'INVERNO30', 30, 4), (5, 'GAMER50', 50, 5),
(6, 'PROMO5', 5, 6), (7, 'VIP25', 25, 7), (8, 'NATAL40', 40, 8), (9, 'PASCOA10', 10, 9), (10, 'BLACK70', 70, 10),
(11, 'BEMVINDO11', 10, 11), (12, 'NINJA12', 20, 12), (13, 'VERAO13', 15, 13), (14, 'INVERNO14', 30, 14), (15, 'GAMER15', 50, 15),
(16, 'PROMO16', 5, 16), (17, 'VIP17', 25, 17), (18, 'NATAL18', 40, 18), (19, 'PASCOA19', 10, 19), (20, 'BLACK20', 70, 20),
(21, 'BEMVINDO21', 10, 21), (22, 'NINJA22', 20, 22), (23, 'VERAO23', 15, 23), (24, 'INVERNO24', 30, 24), (25, 'GAMER25', 50, 25),
(26, 'PROMO26', 5, 26), (27, 'VIP27', 25, 27), (28, 'NATAL28', 40, 28), (29, 'PASCOA29', 10, 29), (30, 'BLACK30', 70, 30);

-- Transações (30 registros)
INSERT INTO transacao (id, id_usuario, id_metodo, valor_total, status_transacao) VALUES
(1, 1, 1, 199.90, 'Aprovada'), (2, 2, 2, 249.00, 'Aprovada'), (3, 3, 3, 50.00, 'Pendente'), (4, 4, 1, 120.50, 'Aprovada'), (5, 5, 4, 299.99, 'Recusada'),
(6, 6, 1, 15.99, 'Aprovada'), (7, 7, 2, 89.90, 'Aprovada'), (8, 8, 3, 149.90, 'Pendente'), (9, 9, 1, 19.99, 'Aprovada'), (10, 10, 4, 350.00, 'Aprovada'),
(11, 11, 1, 199.90, 'Aprovada'), (12, 12, 2, 249.00, 'Aprovada'), (13, 13, 3, 50.00, 'Pendente'), (14, 14, 1, 120.50, 'Aprovada'), (15, 15, 4, 299.99, 'Recusada'),
(16, 16, 1, 15.99, 'Aprovada'), (17, 17, 2, 89.90, 'Aprovada'), (18, 18, 3, 149.90, 'Pendente'), (19, 19, 1, 19.99, 'Aprovada'), (20, 20, 4, 350.00, 'Aprovada'),
(21, 21, 1, 199.90, 'Aprovada'), (22, 22, 2, 249.00, 'Aprovada'), (23, 23, 3, 50.00, 'Pendente'), (24, 24, 1, 120.50, 'Aprovada'), (25, 25, 4, 299.99, 'Recusada'),
(26, 26, 1, 15.99, 'Aprovada'), (27, 27, 2, 89.90, 'Aprovada'), (28, 28, 3, 149.90, 'Pendente'), (29, 29, 1, 19.99, 'Aprovada'), (30, 30, 4, 350.00, 'Aprovada');

-- Itens das Transações (30 registros ligando transações e jogos)
INSERT INTO item_transacao (id, id_transacao, id_jogo, preco_vendido) VALUES
(1, 1, 5, 199.90), (2, 2, 12, 249.00), (3, 3, 3, 50.00), (4, 4, 20, 120.50), (5, 5, 8, 299.99),
(6, 6, 15, 15.99), (7, 7, 22, 89.90), (8, 8, 30, 149.90), (9, 9, 2, 19.99), (10, 10, 18, 350.00),
(11, 11, 1, 199.90), (12, 12, 7, 249.00), (13, 13, 14, 50.00), (14, 14, 25, 120.50), (15, 15, 9, 299.99),
(16, 16, 4, 15.99), (17, 17, 11, 89.90), (18, 18, 19, 149.90), (19, 19, 27, 19.99), (20, 20, 6, 350.00),
(21, 21, 13, 199.90), (22, 22, 21, 249.00), (23, 23, 28, 50.00), (24, 24, 10, 120.50), (25, 25, 17, 299.99),
(26, 26, 24, 15.99), (27, 27, 29, 89.90), (28, 28, 16, 149.90), (29, 29, 26, 19.99), (30, 30, 23, 350.00);

-- Lista de Desejos (30 registros)
INSERT INTO lista_desejo (id, id_usuario, id_jogo, data_adicao) VALUES
(1, 1, 10, '2024-01-10'), (2, 2, 15, '2024-01-15'), (3, 3, 5, '2024-02-20'), (4, 4, 22, '2024-03-05'), (5, 5, 8, '2024-03-12'),
(6, 6, 1, '2024-01-10'), (7, 7, 2, '2024-01-15'), (8, 8, 3, '2024-02-20'), (9, 9, 4, '2024-03-05'), (10, 10, 6, '2024-03-12'),
(11, 11, 11, '2024-01-10'), (12, 12, 12, '2024-01-15'), (13, 13, 13, '2024-02-20'), (14, 14, 14, '2024-03-05'), (15, 15, 16, '2024-03-12'),
(16, 16, 17, '2024-01-10'), (17, 17, 18, '2024-01-15'), (18, 18, 19, '2024-02-20'), (19, 19, 20, '2024-03-05'), (20, 20, 21, '2024-03-12'),
(21, 21, 23, '2024-01-10'), (22, 22, 24, '2024-01-15'), (23, 23, 25, '2024-02-20'), (24, 24, 26, '2024-03-05'), (25, 25, 27, '2024-03-12'),
(26, 26, 28, '2024-01-10'), (27, 27, 29, '2024-01-15'), (28, 28, 30, '2024-02-20'), (29, 29, 7, '2024-03-05'), (30, 30, 9, '2024-03-12');

-- Reembolsos (30 registros)
INSERT INTO reembolso (id, id_transacao, motivo_reembolso, status_aprovacao) VALUES
(1, 1, 'Meu PC não rodou, travou no tutorial', 'Aprovado'), 
(2, 2, 'Comprei achando que era um RPG estilo Vampiro A Máscara, mas não é', 'Aprovado'), 
(3, 3, 'Não consegui passar do primeiro boss', 'Recusado'), 
(4, 4, 'Comprei errado, era pra ser outro jogo', 'Aprovado'), 
(5, 5, 'Jogo com muitos bugs de colisão', 'Em Análise'),
(6, 6, 'Achei a mecânica repetitiva', 'Aprovado'), 
(7, 7, 'Muito curto, zerei em 2 horas', 'Aprovado'), 
(8, 8, 'Não gostei dos gráficos', 'Recusado'), 
(9, 9, 'Estava na promoção no dia seguinte', 'Aprovado'), 
(10, 10, 'Meu controle não funcionou nativamente', 'Em Análise'),
(11, 11, 'Esperava uma vibe tipo Ordem Paranormal, decepcionou', 'Aprovado'), 
(12, 12, 'Não tem legendas em PT-BR como prometido', 'Aprovado'), 
(13, 13, 'Meus amigos pararam de jogar', 'Recusado'), 
(14, 14, 'Crianças compraram sem autorização', 'Aprovado'), 
(15, 15, 'Sistema de combate muito travado', 'Em Análise'),
(16, 16, 'Arrependimento da compra', 'Aprovado'), 
(17, 17, 'Achei o jogo muito fácil', 'Aprovado'), 
(18, 18, 'Péssima otimização de RAM', 'Aprovado'), 
(19, 19, 'O modo online está deserto', 'Aprovado'), 
(20, 20, 'Faltam opções de acessibilidade', 'Em Análise'),
(21, 21, 'Servidores caem toda hora', 'Aprovado'), 
(22, 22, 'História muito chata', 'Recusado'), 
(23, 23, 'Fui banido injustamente do modo online', 'Recusado'), 
(24, 24, 'Problemas com a resolução do monitor', 'Aprovado'), 
(25, 25, 'Microtransações abusivas', 'Aprovado'),
(26, 26, 'Incompatível com meu sistema operacional', 'Aprovado'), 
(27, 27, 'Tive tontura de movimento jogando', 'Aprovado'), 
(28, 28, 'Não roda no Steam Deck direito', 'Em Análise'), 
(29, 29, 'Salves corrompidos frequentemente', 'Aprovado'), 
(30, 30, 'Jogo não atendeu as minhas expectativas', 'Aprovado');

