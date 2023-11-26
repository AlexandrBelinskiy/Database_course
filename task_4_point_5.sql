/*
  Задание 5:
  Показать товары, цена которых меньше средней цены в любом стиле 
  из таблицы Production.Product. Вывести поля [Name], ListPrice и Style.
*/
SELECT 
    "Name", 
    "ListPrice", 
    "Style"
FROM 
    "Production"."Product"
WHERE 
    "ListPrice" < (
        SELECT 
            AVG("ListPrice")
        FROM 
            "Production"."Product" p2
        WHERE 
            p2."Style" = "Production"."Product"."Style"
            AND p2."Style" IS NOT NULL
    );