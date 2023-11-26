/*
  Задание 4:
  Показать товары, цена которых равна минимальной (больше нуля) цене товара из той же подкатегории 
  в таблице Production.Product. Вывести поля [Name], ListPrice и ProductSubcategoryID.
*/
SELECT 
    "Name", 
    "ListPrice", 
    "ProductSubcategoryID"
FROM 
    "Production"."Product" p1
WHERE 
    "ListPrice" = (
        SELECT 
            MIN("ListPrice")
        FROM 
            "Production"."Product" p2
        WHERE 
            p1."ProductSubcategoryID" = p2."ProductSubcategoryID" 
            AND "ListPrice" > 0
    );