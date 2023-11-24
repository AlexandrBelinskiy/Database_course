/* 
	5. Показать список цен за штуку (UnitPrice), 
	к которым относятся несколько продуктов (ProductID), 
	из таблицы Purchasing.PurchaseOrderDetail, используя SELF JOIN. 
*/
SELECT POD1."UnitPrice"
FROM "Purchasing"."PurchaseOrderDetail" AS POD1
JOIN "Purchasing"."PurchaseOrderDetail" AS POD2 
	ON POD1."ProductID" <> POD2."ProductID" 
	AND POD1."PurchaseOrderDetailID" = POD2."PurchaseOrderDetailID";