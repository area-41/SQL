# Comandos SQL

## The Data Manipulation Language (DML)
##### --|  SELECT  |--|  UPDATE  |--|  DELETE  |--|  INSERT INTO  |--</br>



#### SELECT
    SELECT count(*) FROM Album a WHERE Column1 is NOT NULL;

    SELECT AlbumId, Title 
    FROM Album a 
    WHERE Column1 is NULL;


    SELECT a.AlbumId, a2.Name, count(*) as Records 
    FROM Album a 
    INNER JOIN Artist a2 
    GROUP BY 1 
    ORDER BY Records ASC LIMIT 1;

#### SELECT DISTINCT
    -- selecionar distinto
    SELECT DISTINCT column_name
    FROM table_name
    WHERE FirstName <> 'Teste' -- not equal
    ORDER BY 1 ASC;


    SELECT * FROM Orders
    WHERE OrderDate BETWEEN '1996-07-01' AND '1996-07-31';


    SELECT * FROM Persons
    WHERE LastName IN ('Hansen','Pettersen', 'Josifreudo', 'EDemais');


 #### Utilizando apelidos
    SELECT po.OrderID, p.LastName, p.FirstName
    FROM Persons AS p, Product_Orders AS po  -- importante para vacilitar
    WHERE p.LastName='Hansen' AND p.FirstName='Ola'


 #### Caracterizando os registros
    SELECT a2.ArtistId, a2.Name, count(*) as Records 
    FROM Album a
    INNER JOIN Artist a2
    GROUP BY 1
    ORDER BY Records LIMIT 1;

    
#### Procurar por assunto
    SELECT count(*) FROM Customer c WHERE Address like '%Broadway%';


#### Verificar os dados
    SELECT count(*) FROM Customer c WHERE Company IS NOT NULL;


#### Verificar se existe em 2 tabelas
    SELECT c.FirstName 
    FROM Customer c 
    WHERE Company IS NULL AND c.FirstName IN 
    (SELECT e.FirstName FROM Employee e);


    SELECT c.FirstName, c.LastName 
    FROM Customer c 
    INNER JOIN Employee e 
    WHERE c.FirstName = e.FirstName;


    SELECT c.CustomerId, c.FirstName, COUNT(*) as Record
    FROM Invoice i
    INNER JOIN InvoiceLine il
    INNER JOIN Customer c ON c.CustomerId = i.CustomerId
    GROUP BY 1 ORDER BY Record;

#### DISCRETIZAÇÃO
    -- DISCRETIZAÇÃO  -----****
    SELECT e.Name,
        CASE
            WHEN Salary > 39000 THEN "Executivo"
            WHEN Salary > 29000 THEN "Sênior"
            WHEN Salary > 19000 THEN "Pleno"
            WHEN Salary > 9000 THEN "Júnior"
            WHEN Salary > 900 THEN "Estagiário"
            ELSE "NA"
        END as Niveis_Empregados
        FROM employee e 
        ORDER BY Niveis_Empregados;


#### PADRONIZAÇÃO 
    SELECT Fname, Sex, 
        CASE
            WHEN Sex = "m" THEN "M"
            WHEN Sex = "f" THEN "F"    
            ELSE Sex
        END as Gender
        FROM employee e;



### Data Definition Language (DDL)
##### --|  CREATE DATABASE  |--|  ALTER DATABASE  |--|  CREATE TABLE  |--|  ALTER TABLE  |--|  DROP TABLE |--|  CREATE INDEX  |--|  DROP INDEX  |--</br>


