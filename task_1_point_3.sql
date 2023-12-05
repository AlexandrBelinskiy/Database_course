/* 
	3. Показать информацию о товаре (ProductID, StartDate, EndDate, StandardCost) 
	из таблицы Production.ProductCostHistory,
	где стандартная стоимость товара (StandardCost) варьируется от $12 до $17. 
*/
SELECT "ProductID", "StartDate", "EndDate", "StandardCost" 
	FROM "Production"."ProductCostHistory" 
	WHERE "StandardCost" BETWEEN 12 AND 17;



