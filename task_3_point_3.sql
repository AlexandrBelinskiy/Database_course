/* 
	3. Показать список товаров (поле Name), в котором указан, 
	есть ли у товара количество в запасе (поле Quantity) или нет, 
	из таблицы Production.ProductInventory, Production.Product, используя RIGHT OUTER JOIN. 
*/
SELECT PR."Name", CASE WHEN PI."Quantity" IS NULL OR PI."Quantity" = 0 THEN 'No' ELSE 'Yes' END AS "InStock"
	FROM "Production"."ProductInventory" AS PI
	RIGHT OUTER JOIN "Production"."Product" AS PR ON PI."ProductID" = PR."ProductID";
