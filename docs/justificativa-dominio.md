📝 Justificativa do Domínio: Ecossistema de Jogos Digitais (Steam Clone)

A escolha do domínio de uma plataforma de distribuição de jogos digitais justifica-se pela alta densidade e variedade de tipos de dados, o que exige uma modelagem rigorosa para garantir a integridade e o desempenho do sistema.

Os principais desafios técnicos abordados nesta modelagem são:

    Complexidade de Relacionamentos: O sistema lida com diversos relacionamentos N:N (Muitos para Muitos), como a associação de jogos a múltiplas tags, gêneros e idiomas, além do sistema de trocas de itens entre usuários.

    Gestão Financeira e Regional: A necessidade de lidar com múltiplas moedas (decimal 16,2), preços regionalizados e rastreabilidade de transações exige uma estrutura de tabelas financeira robusta.

    Escalabilidade Social: O domínio abrange desde interações simples (amizades) até estruturas complexas de comunidades (grupos, notificações e sistemas de banimento).

    Consistência de Dados de Progresso: Gerenciar bibliotecas extensas, conquistas e estatísticas em tempo real é um excelente exercício para aplicar normalização e evitar redundâncias.

    Mercado e Inventário: A inclusão de um mercado de itens introduz a necessidade de controle de propriedade (ID_Serial_Item), onde um item base se transforma em uma instância única no inventário de um usuário.

Em resumo, este domínio foi selecionado por representar um cenário real de Big Data e E-commerce, permitindo ao grupo aplicar conceitos de DDL que vão muito além de um CRUD básico, explorando a fundo a organização da informação.
