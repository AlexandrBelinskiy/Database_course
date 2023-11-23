/* 
	4. Показать список продуктов (ProductID), которые имеют несколько цен за штуку (UnitPrice), 
	из таблицы Purchasing.PurchaseOrderDetail, используя SELF JOIN. 
*/
SELECT DISTINCT POD1."ProductID"
FROM "Purchasing"."PurchaseOrderDetail" AS POD1
JOIN "Purchasing"."PurchaseOrderDetail" AS POD2 
	ON POD1."ProductID" = POD2."ProductID" 
	AND POD1."UnitPrice" <> POD2."UnitPrice";
