##### Porposta para o desafio

### Criação de um modelo ER para uma empresa de Reciclagem

Para essa proposta de projeto, criou-se um esquema conceitual com um modelo Entidade-Relacionamento (ER)
para uma empresa de reciclagem. Nesse modelo, vamos considerar as principais entidades e seus relacionamentos.
###### Este é apenas um exemplo básico, uma empresa de reciclagem real pode ter mais entidades e atributos específicos.

### Entidades:

1.	Cliente
2.	Material
3.	Coleta
4.	Funcionário
5.	Reciclagem

   
### Relacionamentos:

1.	Um Cliente pode solicitar várias Coletas. Uma Coleta é solicitada por apenas um Cliente.
2.	Uma Coleta pode envolver vários Materiais. Um Material pode estar presente em várias Coletas.
3.	Uma Coleta é atribuída a um Funcionário, mas um Funcionário pode ser responsável por várias Coletas.
4.	A Reciclagem envolve um ou mais Materiais da Coleta. Um Material pode estar em várias Reciclagens.
5.	A Reciclagem é realizada por Funcionários. Um Funcionário pode participar de várias Reciclagens.

### Atributos:

1.	Cliente: ID (PK), Nome, Endereço, E-mail, Telefone, etc.
2.	Material: ID (PK), Tipo, Descrição, Peso, etc.
3.	Coleta: ID (PK), Data e Hora da Solicitação, Status, Observações, etc.
4.	Funcionário: ID (PK), Nome, Cargo, CPF, Data de Contratação, etc.
5.	Reciclagem: ID (PK), Data da Reciclagem, Quantidade Reciclada, etc.

### Desenvolvimento Contínuo:   
A estrutura básica poderia ser mais completa como de uma empresa de reciclagem real e ter mais complexidades,
como tratamento específico de diferentes tipos de materiais, informações sobre destinação final dos materiais reciclados,
gerenciamento de veículos de coleta, relatórios detalhados, entre outros.


###### * O modelo ER acima pode ser ajustado de acordo com as necessidades específicas da empresa em questão.
</br></br>


## Esquema Lógico

Um esquema lógico usando a notação do Modelo Relacional (tabelas) com base no esquema conceitual que discutimos para a empresa de reciclagem:


### Tabelas:

- Cliente (ClienteID, Nome, Endereço, Email, Telefone, ...)
-	Material (MaterialID, Tipo, Descrição, Peso, ...)
-	Coleta (ColetaID, ClienteID (FK), DataHoraSolicitacao, Status, Observações, ...)
-	Funcionário (FuncionarioID, Nome, Cargo, CPF, DataContratacao, ...)
-	Reciclagem (ReciclagemID, ColetaID (FK), DataReciclagem, QuantidadeReciclada, FuncionarioID (FK), ...)


### Chaves Primárias:

-	ClienteID (Cliente)
-	MaterialID (Material)
-	ColetaID (Coleta)
-	FuncionarioID (Funcionário)
-	ReciclagemID (Reciclagem)


### Chaves Estrangeiras:

-	ClienteID (Coleta referencia Cliente)
-	ColetaID (Reciclagem referencia Coleta)
-	FuncionarioID (Reciclagem referencia Funcionário)


Considerar as chaves primárias compostas, índices, restrições de integridade referencial e 
outras otimizações de banco de dados para garantir a eficiência e a consistência dos dados. 
Além disso, os atributos de cada tabela podem ser expandidos conforme a necessidade da empresa de reciclagem. 

###### * Este é apenas um esquema lógico básico que segue o esquema conceitual apresentado anteriormente.

![image](https://github.com/area-41/SQL/assets/87396846/2385327d-156d-4fa6-983c-d58fb045c86e)



## Script SQL

O script SQL para criar o esquema do banco de dados com base no esquema lógico:

[Ver arquivo SQL - Criação das Tabelas](https://github.com/area-41/SQL/blob/main/DBeaver/IFood_Projeto_Logico/Reverti_Tables.sql)

![image](https://github.com/area-41/SQL/assets/87396846/776561c1-89e0-4a44-bd4c-452a4ce7389b)


Dependendo do sistema de gerenciamento de banco de dados (SGDB) que você estiver usando, pode ser necessário ajustar pequenos detalhes, como a sintaxe exata e as restrições de chave estrangeira de acordo com o SGDB específico. Neste caaso acima foi usado o software DBeaver Enterprise 23.1.0 com PostGres.

[Ver arquivo SQL - Inserindo Dados](https://github.com/area-41/SQL/blob/main/DBeaver/IFood_Projeto_Logico/Reverti_Inserindo_Dados.sql)

![image](https://github.com/area-41/SQL/assets/87396846/47c99b78-e671-4ba4-85cf-cc3ec9e83837)


[Ver arquivo SQL -  Populando as Tabelas](https://github.com/area-41/SQL/blob/main/DBeaver/IFood_Projeto_Logico/Reverti_Populando_Dados_Automatico.sql)

![image](https://github.com/area-41/SQL/assets/87396846/c9b55caf-45d1-404e-a3ae-5d563ab1369b)



###### * Este código utiliza a função `generate_series()` para criar números sequenciais (de 1 a 100), que são então utilizados para gerar exemplos fictícios para as tabelas, assim como uma tabela com 101 nomes e sobrenomes, apenas para o preenchimento de dados. As datas e números gerados são fictícios e aleatórios.
</br></br>

## Consultas SQL

Exemplos de queries SQL utilizando as tabelas do esquema definido para a empresa de reciclagem.

### Recuperações simples com SELECT Statement:
   
##### Recupera todos os clientes
      SELECT * FROM Cliente;

##### Recupera todos os materiais
      SELECT * FROM Material;

##### Recupera o nome do cliente, tipo do material e quantidade reciclada em cada reciclagem
      SELECT Cliente.Nome, Material.Tipo, Reciclagem.QuantidadeReciclada
      FROM Cliente
      JOIN Coleta ON Cliente.ClienteID = Coleta.ClienteID
      JOIN Reciclagem ON Coleta.ColetaID = Reciclagem.ColetaID
      JOIN Material ON Coleta.MaterialID = Material.MaterialID;


### Filtros com WHERE Statement:

##### Recupera coletas pendentes
      SELECT * FROM Coleta WHERE Status = 'Pendente';

##### Recupera reciclagens feitas por um funcionário específico
      SELECT * FROM Reciclagem WHERE FuncionarioID = 1;

##### Recupera os clientes que tiveram pelo menos uma reciclagem
      SELECT DISTINCT Cliente.Nome
      FROM Cliente
      JOIN Coleta ON Cliente.ClienteID = Coleta.ClienteID
      JOIN Reciclagem ON Coleta.ColetaID = Reciclagem.ColetaID;


### Expressões para gerar atributos derivados:

##### Calcula o peso médio dos materiais reciclados
      SELECT AVG(QuantidadeReciclada) AS PesoMedioReciclado FROM Reciclagem;

##### Calcula a diferença em dias entre a solicitação de coleta e a data de reciclagem
      SELECT ColetaID, Date(DataReciclagem) - Date(DataHoraSolicitacao) AS DiasAteReciclagem
      FROM Reciclagem;



### Ordenações dos dados com ORDER BY:

##### Lista os materiais em ordem alfabética
      SELECT * FROM Material ORDER BY Tipo ASC;

##### Lista as reciclagens por ordem decrescente de quantidade reciclada
      SELECT * FROM Reciclagem ORDER BY QuantidadeReciclada DESC;

##### Lista os materiais e a quantidade total reciclada de cada tipo, em ordem decrescente
      SELECT Material.Tipo, SUM(Reciclagem.QuantidadeReciclada) AS TotalReciclado
      FROM Material
      LEFT JOIN Coleta ON Material.MaterialID = Coleta.MaterialID
      LEFT JOIN Reciclagem ON Coleta.ColetaID = Reciclagem.ColetaID
      GROUP BY Material.Tipo
      ORDER BY TotalReciclado DESC;


### Condições de filtros aos grupos – HAVING Statement:

##### Recupera materiais que têm peso médio superior a 10
      SELECT Tipo, AVG(Peso) AS PesoMedio FROM Material GROUP BY Tipo HAVING PesoMedio > 10;

##### Recupera materiais com peso médio acima de 5 e que foram reciclados mais de uma vez
      SELECT Material.Tipo, AVG(Material.Peso) AS PesoMedio, COUNT(Reciclagem.MaterialID) AS ContagemReciclagens
      FROM Material
      JOIN Coleta ON Material.MaterialID = Coleta.MaterialID
      JOIN Reciclagem ON Coleta.ColetaID = Reciclagem.ColetaID
      GROUP BY Material.Tipo
      HAVING PesoMedio > 5 AND ContagemReciclagens > 1;


### Junções entre tabelas para perspectiva mais complexa dos dados:

##### Recupera detalhes da coleta e do cliente para coletas pendentes
      SELECT Coleta.ColetaID, Cliente.Nome AS NomeCliente, Coleta.DataHoraSolicitacao, Coleta.Status
      FROM Coleta
      JOIN Cliente ON Coleta.ClienteID = Cliente.ClienteID
      WHERE Coleta.Status = 'Pendente';

##### Recupera detalhes da coleta, cliente e funcionário para coletas pendentes
      SELECT Coleta.ColetaID, Cliente.Nome AS NomeCliente, Funcionario.Nome AS NomeFuncionario, Coleta.DataHoraSolicitacao, Coleta.Status
      FROM Coleta
      JOIN Cliente ON Coleta.ClienteID = Cliente.ClienteID
      JOIN Funcionario ON Coleta.FuncionarioID = Funcionario.FuncionarioID
      WHERE Coleta.Status = 'Pendente';
</br></br>

## Perguntas Adicionais

Adicionando algumas perguntas que podem ser respondidas usando as consultas SQL discutidas até agora, considerando o esquema da empresa de reciclagem:

### Quantos materiais diferentes foram reciclados até o momento?
      
      SELECT COUNT(DISTINCT MaterialID) AS QuantidadeMateriaisReciclados
      FROM Reciclagem;
      
### Qual é o cliente que mais recicla?

      SELECT Cliente.Nome, COUNT(Reciclagem.ColetaID) AS QuantidadeReciclagens
      FROM Cliente
      JOIN Coleta ON Cliente.ClienteID = Coleta.ClienteID
      JOIN Reciclagem ON Coleta.ColetaID = Reciclagem.ColetaID
      GROUP BY Cliente.Nome
      ORDER BY QuantidadeReciclagens DESC
      LIMIT 1;
      
### Quais são os materiais que têm mais de uma reciclagem?

      SELECT Material.Tipo
      FROM Material
      JOIN Coleta ON Material.MaterialID = Coleta.MaterialID
      JOIN Reciclagem ON Coleta.ColetaID = Reciclagem.ColetaID
      GROUP BY Material.Tipo
      HAVING COUNT(DISTINCT Reciclagem.ColetaID) > 1;
      
### Quais são os funcionários que reciclaram mais peso até agora?

      SELECT Funcionario.Nome, SUM(Reciclagem.QuantidadeReciclada) AS PesoReciclado
      FROM Funcionario
      JOIN Reciclagem ON Funcionario.FuncionarioID = Reciclagem.FuncionarioID
      GROUP BY Funcionario.Nome
      ORDER BY PesoReciclado DESC;
      
### Qual é a média de peso dos materiais reciclados por tipo?
      
      SELECT Material.Tipo, AVG(Reciclagem.QuantidadeReciclada) AS MediaPesoReciclado
      FROM Material
      JOIN Coleta ON Material.MaterialID = Coleta.MaterialID
      JOIN Reciclagem ON Coleta.ColetaID = Reciclagem.ColetaID
      GROUP BY Material.Tipo;





