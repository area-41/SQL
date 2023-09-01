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

###### * Este é apenas um esquema lógico básico que segue o esquema conceitual apresentado anteriormente


## Script SQL

O script SQL para criar o esquema do banco de dados com base no esquema lógico:

[Ver arquivo SQL]()
