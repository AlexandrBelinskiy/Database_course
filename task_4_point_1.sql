/*
  Задание 1:
  Показать самый дорогой товар из таблицы Production.Product. Вывести название и цену товара.
*/
SELECT 
    "Name", 
    "ListPrice" 
FROM 
    "Production"."Product" 
WHERE 
    "ListPrice" = (SELECT MAX("ListPrice") FROM "Production"."Product");
