-- Inserindo dados de exemplo na tabela Cliente
INSERT INTO Cliente (ClienteID, Nome, Endereco, Email, Telefone)
VALUES (1, 'João Silva', 'Rua A, 123', 'joao@example.com', '123-456-7890');

-- Inserindo dados de exemplo na tabela Material
INSERT INTO Material (MaterialID, Tipo, Descricao, Peso)
VALUES (1, 'Papel', 'Papelão', 5.0);

-- Inserindo dados de exemplo na tabela Coleta
INSERT INTO Coleta (ColetaID, ClienteID, DataHoraSolicitacao, Status, Observacoes)
VALUES (1, 1, '2023-08-30 10:00:00', 'Pendente', 'Coleta agendada');

-- Inserindo dados de exemplo na tabela Funcionario
INSERT INTO Funcionario (FuncionarioID, Nome, Cargo, CPF, DataContratacao)
VALUES (1, 'Maria Souza', 'Operador', '123.456.789-00', '2022-01-15');

-- Inserindo dados de exemplo na tabela Reciclagem
INSERT INTO Reciclagem (ReciclagemID, ColetaID, DataReciclagem, QuantidadeReciclada, FuncionarioID)
VALUES (1, 1, '2023-08-31', 3.0, 1);


-- Populando a tabela Cliente com 50 exemplos
INSERT INTO Cliente (ClienteID, Nome, Endereco, Email, Telefone)
SELECT
    seq,
    CONCAT('Cliente ', seq),
    CONCAT('Endereco ', seq),
    CONCAT('email', seq, '@exemplo.com'),
    CONCAT('123-456-', seq)
FROM generate_series(2, 50) as seq;

-- Populando a tabela Material com 50 exemplos
INSERT INTO Material (MaterialID, Tipo, Descricao, Peso)
SELECT
    seq,
    CONCAT('Tipo ', seq),
    CONCAT('Descricao ', seq),
    seq * 0.5
FROM generate_series(1, 50) as seq;

-- Populando a tabela Coleta com 50 exemplos
INSERT INTO Coleta (ColetaID, ClienteID, DataHoraSolicitacao, Status, Observacoes)
SELECT
    seq,
    (random() * 50 + 1)::int,
    NOW() - (seq || ' days')::interval,
    CASE WHEN seq % 2 = 0 THEN 'Concluída' ELSE 'Pendente' END,
    CONCAT('Observacoes da coleta ', seq)
FROM generate_series(1, 50) as seq;

-- Populando a tabela Funcionario com 50 exemplos
INSERT INTO Funcionario (FuncionarioID, Nome, Cargo, CPF, DataContratacao)
SELECT
    seq,
    CONCAT('Funcionario ', seq),
    CONCAT('Cargo ', seq),
    LPAD(seq::text, 11, '0'),
    NOW() - (seq || ' months')::interval
FROM generate_series(1, 50) as seq;

-- Populando a tabela Reciclagem com 50 exemplos
INSERT INTO Reciclagem (ReciclagemID, ColetaID, DataReciclagem, QuantidadeReciclada, FuncionarioID)
SELECT
    seq,
    (random() * 50 + 1)::int,
    NOW() - (seq || ' days')::interval,
    seq * 0.1,
    (random() * 50 + 1)::int
FROM generate_series(1, 50) as seq;
