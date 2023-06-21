# Exemplos SQL

    SELECT count(*) FROM Album a WHERE Column1 is NOT NULL;

    SELECT AlbumId, Title 
    FROM Album a 
    WHERE Column1 is `NULL`;


    SELECT a.AlbumId, a2.Name, count(*) as Records 
    FROM Album a 
    INNER JOIN Artist a2 
    GROUP BY 1 
    ORDER BY Records ASC LIMIT 1;
