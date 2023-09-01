-- Criação das tabelas

CREATE TABLE Cliente (
    ClienteID INT PRIMARY KEY,
    Nome VARCHAR(100),
    Endereco VARCHAR(200),
    Email VARCHAR(100),
    Telefone VARCHAR(20)
);

DROP TABLE Material;
CREATE TABLE Material (
    MaterialID INT PRIMARY KEY,
    Tipo VARCHAR(50),
    Descricao VARCHAR(200),
    Peso DECIMAL(10, 2)
);

DROP TABLE Coleta CASCADE;
CREATE TABLE Coleta (
    ColetaID INT PRIMARY KEY,
    ClienteID INT,
    DataHoraSolicitacao DATE,
    Status VARCHAR(50),
    Observacoes TEXT,
    FOREIGN KEY (ClienteID) REFERENCES Cliente(ClienteID)
);

DROP TABLE Funcionario CASCADE;
CREATE TABLE Funcionario (
    FuncionarioID INT PRIMARY KEY,
    Nome VARCHAR(100),
    Cargo VARCHAR(50),
    CPF VARCHAR(14),
    DataContratacao DATE
);


DROP TABLE Reciclagem; 
CREATE TABLE Reciclagem (
    ReciclagemID INT PRIMARY KEY,
    ColetaID INT,
    DataReciclagem DATE,
    QuantidadeReciclada DECIMAL(10, 2),
    FuncionarioID INT,
    FOREIGN KEY (ColetaID) REFERENCES Coleta(ColetaID),
    FOREIGN KEY (FuncionarioID) REFERENCES Funcionario(FuncionarioID)
);



-- Populando a tabela Cliente com 50 exemplos
INSERT INTO Cliente (ClienteID, Nome, Endereco, Email, Telefone)
SELECT
    seq,
    CONCAT('Cliente ', seq),
    CONCAT('Endereco ', seq),
    CONCAT('email', seq, '@exemplo.com'),
    CONCAT('123-456-', seq)
FROM generate_series(1, 50) as seq;



CREATE TABLE Cliente (
    ClienteID INT PRIMARY KEY,
    Nome VARCHAR(100),
    Endereco VARCHAR(200),
    Email VARCHAR(100),
    Telefone VARCHAR(20)
);

DROP TABLE Cliente;


-- AUTOMATICO -- Populando a tabela Cliente com 50 exemplos
INSERT INTO Cliente (ClienteID, Nome, Endereco, Email, Telefone)
SELECT
    seq,
    (SELECT FirstName FROM RandomNames WHERE nameid=seq LIMIT 1) || ' ' || (SELECT LastName FROM RandomNames WHERE nameid=seq LIMIT 1),
    CONCAT('Rua ', (SELECT LastName FROM RandomNames WHERE nameid = seq + 1 LIMIT 1), ' n. ', floor(random()*9999 + 1)::int),
    (SELECT lower(FirstName) FROM RandomNames WHERE nameid=seq LIMIT 1) || '.' || (SELECT lower(LastName) FROM RandomNames WHERE nameid=seq LIMIT 1) || '@gmail.com',
    CONCAT('(', floor(random()*90 + 10)::int, ')', floor(random()*(8999 + 1) + 1001)::int, '-', floor(random()*(8999 + 1) + 1001)::int)
FROM generate_series(1, 100) as seq;


DROP TABLE RandomNames;

CREATE TABLE RandomNames (
    NameID SERIAL PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50)
);

INSERT INTO RandomNames (FirstName, LastName)
VALUES
    ('Fernanda', 'Martins'),
    ('Rafael', 'Almeida'),
    ('Carolina', 'Rocha'),
    ('Gustavo', 'Lima'),
    ('Mariana', 'Barros'),
    ('Diego', 'Gomes'),
    ('Camila', 'Fernandes'),
    ('Felipe', 'Cunha'),
    ('Vitória', 'Melo'),
    ('Leandro', 'Cardoso'),
    ('Juliana', 'Ribeiro'),
    ('Rodrigo', 'Sousa'),
    ('Amanda', 'Pereira'),
    ('Bruno', 'Carvalho'),
    ('Larissa', 'Garcia'),
    ('Eduardo', 'Araújo'),
    ('Beatriz', 'Nascimento'),
    ('Alex', 'Coelho'),
    ('Isabela', 'Machado'),
    ('Ricardo', 'Miranda'),
    ('Lorena', 'Dias'),
    ('Thiago', 'Cavalcanti'),
    ('Laura', 'Freitas'),
    ('Marcelo', 'Castro'),
    ('Gabriela', 'Monteiro'),
    ('Henrique', 'Lopes'),
    ('Clara', 'Correia'),
    ('Anderson', 'Fonseca'),
    ('Natália', 'Batista'),
    ('Raul', 'Vieira'),
    ('Aline', 'Andrade'),
    ('Luciano', 'Campos'),
    ('Débora', 'Teixeira'),
    ('Hugo', 'Moura'),
    ('Fernanda', 'Viana'),
    ('Lucas', 'Borges'),
    ('Alessandra', 'Cardoso'),
    ('Bruno', 'Moraes'),
    ('Cíntia', 'Nogueira'),
    ('Rogério', 'Santana'),
    ('Patrícia', 'Farias'),
    ('Leonardo', 'Maia'),
    ('Luisa', 'Ramos'),
    ('Thales', 'Mendes'),
    ('Renata', 'Correia'),
    ('Daniel', 'Azevedo'),
    ('Bianca', 'Lopes'),
    ('Vinicius', 'Ferreira'),
    ('Helena', 'Gonçalves'),
    ('Lucas', 'Rocha'),
    ('Marina', 'Pereira'),
    ('Ricardo', 'Sousa'),
    ('Gabriela', 'Cunha'),
    ('Gustavo', 'Oliveira'),
    ('Natália', 'Almeida'),
    ('André', 'Santos'),
    ('Amanda', 'Ribeiro'),
    ('José', 'Martins'),
    ('Isabela', 'Silva'),
    ('Marcos', 'Barros'),
    ('Eduarda', 'Melo'),
    ('Lucas', 'Fonseca'),
    ('Fernanda', 'Dias'),
    ('Leandro', 'Carvalho'),
    ('Carla', 'Machado'),
    ('Rafael', 'Fernandes'),
    ('Bruna', 'Monteiro'),
    ('Henrique', 'Gomes'),
    ('Larissa', 'Sousa'),
    ('Diego', 'Araújo'),
    ('Vitória', 'Pereira'),
    ('Matheus', 'Cavalcanti'),
    ('Mariana', 'Freitas'),
    ('Pedro', 'Nascimento'),
    ('Camila', 'Moraes'),
    ('Alex', 'Correia'),
    ('Lorena', 'Andrade'),
    ('Thiago', 'Lima'),
    ('Raquel', 'Teixeira'),
    ('Caio', 'Vieira'),
    ('Juliana', 'Campos'),
    ('Luciano', 'Batista'),
    ('Alice', 'Nogueira'),
    ('Fábio', 'Moura'),
    ('Natasha', 'Cardoso'),
    ('Rui', 'Santana'),
    ('Simone', 'Farias'),
    ('Hugo', 'Maia'),
    ('Miguel', 'Oliveira'),
    ('Catarina', 'Andrade'),
    ('Pedro', 'Garcia'),
    ('Lúcia', 'Fonseca'),
    ('Ricardo', 'Vieira'),
    ('Inês', 'Ramos'),
    ('André', 'Silva'),
    ('Teresa', 'Pereira'),
    ('Diogo', 'Sousa'),
    ('Laura', 'Melo'),
    ('Pedro', 'Silva'),
    ('Fábio', 'Martins'),
    ('Sofia', 'Barros');




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
