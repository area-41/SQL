# Exemplos SQL

    SELECT count(*) FROM Album a WHERE Column1 is NOT NULL;

    SELECT AlbumId, Title 
    FROM Album a 
    WHERE Column1 is NULL;


    SELECT a.AlbumId, a2.Name, count(*) as Records 
    FROM Album a 
    INNER JOIN Artist a2 
    GROUP BY 1 
    ORDER BY Records ASC LIMIT 1;


    -- caracterizando os registros
    SELECT a2.ArtistId, a2.Name, count(*) as Records 
    FROM Album a
    INNER JOIN Artist a2
    GROUP BY 1
    ORDER BY Records LIMIT 1;

    
    -- procurar por assunto
    SELECT count(*) FROM Customer c WHERE Address like '%Broadway%';


    -- verificar os dados
    SELECT count(*) FROM Customer c WHERE Company IS NOT NULL;


    -- verificar se existe em 2 tabelas
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
