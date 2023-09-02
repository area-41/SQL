# Limpeza de Dados com SQL

#### Consultas e funções que podem ser usadas em SQL para limpar e transformar os dados e prepará-los para a análise.

--> Deduplicar dados usando comandos como DISTINCTe COUNT + WHERE.

#### DISTINCT
    SELECT DISTINCT customer_id FROM customer_data.customer_address;


--> Manipular dados de string com TRIM(), SUBSTR, e LENGTH.

#### TRIM -- remover todos os espaços extras na coluna
    UPDATE cars.car_info
    SET drive_wheels = TRIM(drive_wheels)
    WHERE num_of_cylinders = "two" ;

#### SUBSTR
    SELECT first_name, SUBSTR(surname, 0, 4) AS sobrenome_abreviado FROM pessoa;
    
#### LENGTH
    SELECT country FROM customer_data.customer_address WHERE LENGTH(country) > 2;
    
#### MIN / MAX
    SELECT MIN(length) AS min_length, MAX(length) AS max_length FROM customer_data.customer_address;

    SELECT MIN(compression_ratio) AS min_compression_ratio, 
    MAX(compression_ratio) AS max_compression_ratio 
    FROM cars.car_info
    WHERE compression_ratio <> 70;

#### WHERE
    SELECT * FROM cars.car_info WHERE num_of_doors IS NULL;

#### UPDATE
    UPDATE cars.car_info 
    SET num_of_doors = "four" 
    WHERE make = "dodge" AND fuel_type = "gas" AND body_style = "sedan";

    UPDATE cars.car_info 
    SET num_of_cylinders = "two" 
    WHERE num_of_cylinders = "tow" AND num_of_cylinders = "wot" AND num_of_cylinders = "otw";


#### DELETE
    DELETE cars.car_info WHERE compression_ratio = 70;

</br></br>

## Avançado

--> Alterar os tipos de dados com CAST.

#### CAST -- forçar a transformação em um determinado TIPO de dado
    SELECT CAST(purchase_price AS FLOAT64)
    FROM customer_data.customer_purchase
    ORDER BY CAST(purchase_price AS FLOAT64) DESC;

#### BETWEEN
    SELECT CAST(date AS date), purchase_price
    FROM customer_data.customer_purchase
    WHERE date BETWEEN '2020-12-01' AND '2020-12-31'

#### CONCAT
    SELECT CONCAT(product_code, product_color) AS new_product_code
    FROM customer_data.customer_purchase
    WHERE product = 'couch'

#### COALESCE -- retornar valores não nulos em uma lista
###### * usando coalesce e indicando a coluna onde procurar, e se não, a próxima coluna para procurar
    SELECT COALESCE(product, product_code) AS product_info
    FROM customer_data.customer_purchase


    
