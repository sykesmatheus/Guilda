DROP TABLE IF EXISTS mensagem_ticket;
DROP TABLE IF EXISTS ticket_suporte;
DROP TABLE IF EXISTS avaliacao;
DROP TABLE IF EXISTS oficina_mod;
DROP TABLE IF EXISTS banimento;


CREATE TABLE banimento (
    id INT NOT NULL PRIMARY KEY,
    id_usuario INT NOT NULL UNIQUE,
    motivo_banimento VARCHAR(500),
    data_expiracao DATE,
    FOREIGN KEY (id_usuario) REFERENCES usuario(id)
);

CREATE TABLE oficina_mod (
    id INT NOT NULL PRIMARY KEY,
    id_jogo INT NOT NULL,
    id_autor INT NOT NULL,
    nome_mod VARCHAR(100),
    link_arquivo VARCHAR(300),
    FOREIGN KEY (id_jogo) REFERENCES jogo(id),
    FOREIGN KEY (id_autor) REFERENCES usuario(id)
);


CREATE TABLE avaliacao (
    id INT NOT NULL PRIMARY KEY,
    id_usuario INT NOT NULL,
    id_jogo INT NOT NULL,
    texto VARCHAR(2000),
    recomendado_bool BOOLEAN,
    data_postagem DATE DEFAULT CURRENT_DATE,
    FOREIGN KEY (id_usuario) REFERENCES usuario(id),
    FOREIGN KEY (id_jogo) REFERENCES jogo(id)
);


CREATE TABLE ticket_suporte (
    id INT NOT NULL PRIMARY KEY,
    id_usuario INT NOT NULL,
    assunto VARCHAR(200),
    status_ticket VARCHAR(50),
    FOREIGN KEY (id_usuario) REFERENCES usuario(id)
);

CREATE TABLE mensagem_ticket (
    id INT NOT NULL PRIMARY KEY,
    id_ticket INT NOT NULL,
    remetente_tipo VARCHAR(50),
    mensagem VARCHAR(1000),
    FOREIGN KEY (id_ticket) REFERENCES ticket_suporte(id)
);


INSERT INTO banimento (id, id_usuario, motivo_banimento, data_expiracao) VALUES
(1, 1, 'Uso de Trapaças (Wallhack)', '2026-12-31'), (2, 2, 'Comportamento Tóxico no Chat', '2024-06-15'),
(3, 3, 'Tentativa de Golpe (Scam)', '2029-01-01'), (4, 4, 'Nome de Perfil Inapropriado', '2024-04-20'),
(5, 5, 'Exploração de Bug em Partida Ranqueada', '2024-05-10'), (6, 6, 'Spam de Links Maliciosos', '2025-11-12'),
(7, 7, 'Uso de Macro Proibido', '2024-08-30'), (8, 8, 'Assédio a outros jogadores', '2024-12-25'),
(9, 9, 'Falsificação de Identidade de Admin', '2030-01-01'), (10, 10, 'Propaganda Política em massa', '2024-05-01'),
(11, 11, 'Uso de Aimbot detectado pelo AC', '2027-01-10'), (12, 12, 'Abuso do sistema de reembolsos', '2024-09-15'),
(13, 13, 'Compartilhamento de conta', '2024-10-10'), (14, 14, 'Griefing sistemático', '2024-06-01'),
(15, 15, 'Racismo no fórum da comunidade', '2026-03-20'), (16, 16, 'Invasão de privacidade', '2025-01-01'),
(17, 17, 'Venda de itens fora do mercado oficial', '2024-11-30'), (18, 18, 'Nacionalismo agressivo', '2024-07-15'),
(19, 19, 'Exposição de dados de terceiros (Doxxing)', '2028-01-01'), (20, 20, 'Uso de software externo não autorizado', '2024-12-12'),
(21, 21, 'Manipulação de Matchmaking', '2024-08-01'), (22, 22, 'Fraude de cartão de crédito', '2035-12-31'),
(23, 23, 'Postagem de conteúdo adulto não autorizado', '2025-02-14'), (24, 24, 'Ameaças na vida real contra equipe', '2040-01-01'),
(25, 25, 'Criação de múltiplas contas para burlar bans', '2027-05-05'), (26, 26, 'Flood de avaliações negativas falsas', '2024-06-20'),
(27, 27, 'Roubo de inventário confirmado', '2030-10-10'), (28, 28, 'Atividade suspeita de bot', '2025-12-01'),
(29, 29, 'Difamação da plataforma', '2024-10-05'), (30, 30, 'Reincidência em toxicidade leve', '2024-05-25');

-- Oficina de Mods (30 itens criados pela comunidade)
INSERT INTO oficina_mod (id, id_jogo, id_autor, nome_mod, link_arquivo) VALUES
(1, 1, 5, 'Texturas 4K Realistas', 'steam.com/files/mod1'), (2, 2, 8, 'Tradução para Português', 'steam.com/files/mod2'),
(3, 3, 12, 'Personagem Shrek no lugar do Boss', 'steam.com/files/mod3'), (4, 4, 15, 'Interface Minimalista', 'steam.com/files/mod4'),
(5, 5, 2, 'Câmera em Primeira Pessoa', 'steam.com/files/mod5'), (6, 6, 20, 'Novas Armas Futuristas', 'steam.com/files/mod6'),
(7, 7, 1, 'Mod de Iluminação Noturna', 'steam.com/files/mod7'), (8, 8, 3, 'Correção de Bugs da Comunidade', 'steam.com/files/mod8'),
(9, 9, 7, 'Músicas de Anime no Menu', 'steam.com/files/mod9'), (10, 10, 14, 'Dificuldade Hardcore Extrema', 'steam.com/files/mod10'),
(11, 11, 11, 'Cheat Menu para Testes', 'steam.com/files/mod11'), (12, 12, 4, 'Skins de Super Heróis', 'steam.com/files/mod12'),
(13, 13, 9, 'Mapa Expandido - Região Norte', 'steam.com/files/mod13'), (14, 14, 18, 'Remover Nevoeiro', 'steam.com/files/mod14'),
(15, 15, 25, 'Multiplayer Local Habilitado', 'steam.com/files/mod15'), (16, 16, 22, 'Cabelos Realistas (PhysX)', 'steam.com/files/mod16'),
(17, 17, 10, 'Novos Itens de Decoração', 'steam.com/files/mod17'), (18, 18, 6, 'Inimigos Invisíveis (Desafio)', 'steam.com/files/mod18'),
(19, 19, 13, 'Radar de Inimigos', 'steam.com/files/mod19'), (20, 20, 28, 'Efeitos de Explosão Melhores', 'steam.com/files/mod20'),
(21, 21, 17, 'Dublagem por IA', 'steam.com/files/mod21'), (22, 22, 19, 'Modo VR Experimental', 'steam.com/files/mod22'),
(23, 23, 21, 'Zumbis Mais Rápidos', 'steam.com/files/mod23'), (24, 24, 24, 'Simulador de Clima Dinâmico', 'steam.com/files/mod24'),
(25, 25, 26, 'Carros de Luxo Adicionados', 'steam.com/files/mod25'), (26, 26, 30, 'Interface Estilo Retrô', 'steam.com/files/mod26'),
(27, 27, 27, 'Remover HUD', 'steam.com/files/mod27'), (28, 28, 23, 'Novas Missões Secundárias', 'steam.com/files/mod28'),
(29, 29, 29, 'Inimigos Estilo Dark Souls', 'steam.com/files/mod29'), (30, 30, 16, 'Pets Companheiros', 'steam.com/files/mod30');

-- Avaliações (30 opiniões dos usuários)
INSERT INTO avaliacao (id, id_usuario, id_jogo, texto, recomendado_bool, data_postagem) VALUES
(1, 1, 1, 'Incrível, me lembrou os tempos de PS2', TRUE, '2024-01-10'),
(2, 2, 2, 'Muito difícil, morri 50 vezes no tutorial', FALSE, '2024-01-12'),
(3, 3, 3, 'A história é uma obra de arte', TRUE, '2024-01-15'),
(4, 4, 4, 'Gráficos ruins para o preço cobrado', FALSE, '2024-02-01'),
(5, 5, 5, 'Melhor RPG que já joguei em anos', TRUE, '2024-02-05'),
(6, 6, 6, 'Simples, mas viciante', TRUE, '2024-02-10'),
(7, 7, 7, 'Otimização péssima no PC', FALSE, '2024-02-15'),
(8, 8, 8, 'Recomendo jogar com amigos', TRUE, '2024-02-20'),
(9, 9, 9, 'Trilha sonora nota 10', TRUE, '2024-03-01'),
(10, 10, 10, 'Pay to win descarado', FALSE, '2024-03-05'),
(11, 11, 11, 'Me senti num filme de terror', TRUE, '2024-03-10'),
(12, 12, 12, 'Mecânicas inovadoras', TRUE, '2024-03-12'),
(13, 13, 13, 'Mundo aberto muito vazio', FALSE, '2024-03-15'),
(14, 14, 14, 'Divertido para passar o tempo', TRUE, '2024-03-18'),
(15, 15, 15, 'Terminei em 2 horas, muito curto', FALSE, '2024-03-20'),
(16, 16, 16, 'A dublagem está excelente', TRUE, '2024-03-22'),
(17, 17, 17, 'Muita propaganda dentro do jogo', FALSE, '2024-03-25'),
(18, 18, 18, 'Nostalgia pura', TRUE, '2024-03-28'),
(19, 19, 19, 'O final é decepcionante', FALSE, '2024-04-01'),
(20, 20, 20, 'Vale cada centavo', TRUE, '2024-04-03'),
(21, 21, 21, 'Demora muito pra carregar', FALSE, '2024-04-05'),
(22, 22, 22, 'Excelente suporte dos devs', TRUE, '2024-04-07'),
(23, 23, 23, 'IA dos inimigos é burra', FALSE, '2024-04-09'),
(24, 24, 24, 'Melhor jogando no controle', TRUE, '2024-04-11'),
(25, 25, 25, 'Servidores instáveis', FALSE, '2024-04-13'),
(26, 26, 26, 'Um clássico instantâneo', TRUE, '2024-04-15'),
(27, 27, 27, 'Preço abusivo para uma DLC', FALSE, '2024-04-17'),
(28, 28, 28, 'Arte visual deslumbrante', TRUE, '2024-04-19'),
(29, 29, 29, 'Cheio de cheaters no online', FALSE, '2024-04-21'),
(30, 30, 30, 'Zerei e quero jogar de novo', TRUE, '2024-04-23');

-- Tickets de Suporte (30 pedidos de ajuda)
INSERT INTO ticket_suporte (id, id_usuario, assunto, status_ticket) VALUES
(1, 1, 'Jogo não inicia após atualização', 'Fechado'), (2, 2, 'Problema com pagamento recusado', 'Aberto'),
(3, 3, 'Minha conta foi invadida', 'Em Espera'), (4, 4, 'Erro 404 ao abrir a loja', 'Fechado'),
(5, 5, 'Desejo apagar meus dados pessoais (LGPD)', 'Aberto'), (6, 6, 'Itens do inventário sumiram', 'Em Espera'),
(7, 7, 'Denúncia de jogador tóxico', 'Fechado'), (8, 8, 'Bug na conquista "Mestre do SQL"', 'Aberto'),
(9, 9, 'Sugestão de melhoria na interface', 'Fechado'), (10, 10, 'Reembolso de compra duplicada', 'Aberto'),
(11, 11, 'Como trocar o e-mail da conta?', 'Fechado'), (12, 12, 'DLC não aparece na biblioteca', 'Em Espera'),
(13, 13, 'Problemas com o Steam Guard', 'Aberto'), (14, 14, 'Código de ativação inválido', 'Fechado'),
(15, 15, 'Lentidão no download', 'Em Espera'), (16, 16, 'Erro de sincronização na nuvem', 'Aberto'),
(17, 17, 'Não recebi meus pontos da loja', 'Fechado'), (18, 18, 'Como configurar controle de PS5?', 'Fechado'),
(19, 19, 'Minha insígnia sumiu', 'Em Espera'), (20, 20, 'Erro de VAC injusto', 'Aberto'),
(21, 21, 'Problema com streaming doméstico', 'Fechado'), (22, 22, 'O chat não carrega', 'Aberto'),
(23, 23, 'Como ser um curador?', 'Fechado'), (24, 24, 'Relato de vulnerabilidade de segurança', 'Aberto'),
(25, 25, 'Minha análise foi removida', 'Em Espera'), (26, 26, 'Problema com Workshop', 'Fechado'),
(27, 27, 'Dúvida sobre compartilhamento familiar', 'Aberto'), (28, 28, 'Não consigo adicionar amigos', 'Fechado'),
(29, 29, 'Erro no Mercado da Comunidade', 'Em Espera'), (30, 30, 'Pedido de desbanimento', 'Aberto');

-- Mensagens dos Tickets (30 interações entre usuários e suporte)
INSERT INTO mensagem_ticket (id, id_ticket, remetente_tipo, mensagem) VALUES
(1, 1, 'Usuario', 'Sempre que clico em jogar, o processo fecha sozinho.'),
(2, 1, 'Suporte', 'Tente verificar a integridade dos arquivos na biblioteca.'),
(3, 1, 'Usuario', 'Funcionou! Muito obrigado.'),
(4, 2, 'Usuario', 'Tentei comprar com Pix e o dinheiro saiu da conta mas o jogo não veio.'),
(5, 2, 'Suporte', 'Pode nos enviar o comprovante de transferência?'),
(6, 3, 'Usuario', 'Alguém da Rússia trocou minha senha.'),
(7, 3, 'Suporte', 'Precisamos que você confirme o primeiro e-mail da conta.'),
(8, 4, 'Usuario', 'A loja está dando erro 404 em todos os jogos.'),
(9, 4, 'Suporte', 'Houve uma instabilidade momentânea, já foi resolvido.'),
(10, 5, 'Usuario', 'Quero que excluam todos os meus registros conforme a lei.'),
(11, 6, 'Usuario', 'Meus itens de CS sumiram depois de um trade.'),
(12, 7, 'Usuario', 'O jogador X me xingou de tudo quanto é nome.'),
(13, 8, 'Usuario', 'Eu fiz os requisitos mas a conquista não desbloqueou.'),
(14, 9, 'Usuario', 'Acho que o azul do menu poderia ser mais escuro.'),
(15, 10, 'Usuario', 'Cliquei duas vezes sem querer e cobrou duas vezes.'),
(16, 11, 'Usuario', 'Perdi acesso ao e-mail antigo, como faço?'),
(17, 12, 'Usuario', 'Comprei o passe de batalha mas ele não ativou.'),
(18, 13, 'Usuario', 'Meu celular formatou e perdi o autenticador.'),
(19, 14, 'Usuario', 'Comprei o card na loja e o código está ilegível.'),
(20, 15, 'Usuario', 'Minha internet é de 1GB mas baixa a 10kbps.'),
(21, 16, 'Usuario', 'Perdi meu progresso de 50 horas de jogo.'),
(22, 17, 'Usuario', 'Gastei 100 reais e não ganhei os tokens.'),
(23, 18, 'Usuario', 'O jogo reconhece o controle como se fosse de Xbox.'),
(24, 19, 'Usuario', 'Eu era nível 50 e agora sou nível 1.'),
(25, 20, 'Usuario', 'Não uso hack e fui banido por engano.'),
(26, 21, 'Usuario', 'O lag está impossível jogando na TV via rede.'),
(27, 22, 'Usuario', 'Fica só rodando a bolinha e não abre as conversas.'),
(28, 23, 'Usuario', 'Quais os requisitos para ser curador oficial?'),
(29, 24, 'Usuario', 'Achei uma forma de duplicar itens no mercado.'),
(30, 25, 'Usuario', 'Por que minha review foi marcada como spam?')

