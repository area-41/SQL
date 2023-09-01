-- Criação das tabelas

CREATE TABLE Cliente (
    ClienteID INT PRIMARY KEY,
    Nome VARCHAR(100),
    Endereco VARCHAR(200),
    Email VARCHAR(100),
    Telefone VARCHAR(20)
);


CREATE TABLE Material (
    MaterialID INT PRIMARY KEY,
    Tipo VARCHAR(50),
    Descricao VARCHAR(200),
    Peso DECIMAL(10, 2)
);

CREATE TABLE Coleta (
    ColetaID INT PRIMARY KEY,
    ClienteID INT,
    DataHoraSolicitacao DATE,
    Status VARCHAR(50),
    Observacoes TEXT,
    FOREIGN KEY (ClienteID) REFERENCES Cliente(ClienteID)
);

CREATE TABLE Funcionario (
    FuncionarioID INT PRIMARY KEY,
    Nome VARCHAR(100),
    Cargo VARCHAR(50),
    CPF VARCHAR(14),
    DataContratacao DATE
);

CREATE TABLE Reciclagem (
    ReciclagemID INT PRIMARY KEY,
    ColetaID INT,
    DataReciclagem DATE,
    QuantidadeReciclada DECIMAL(10, 2),
    FuncionarioID INT,
    FOREIGN KEY (ColetaID) REFERENCES Coleta(ColetaID),
    FOREIGN KEY (FuncionarioID) REFERENCES Funcionario(FuncionarioID)
);
