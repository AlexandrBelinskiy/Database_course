/*
  Задание 3:
  Показать товар, для которого существует менее 3 размеров в той же подкатегории товаров 
  из таблицы Production.Product.
*/
SELECT 
    "Name" 
FROM 
    "Production"."Product" p1
WHERE 
    (SELECT COUNT(DISTINCT "Size") FROM "Production"."Product" p2 WHERE p1."ProductSubcategoryID" = p2."ProductSubcategoryID") < 3;
