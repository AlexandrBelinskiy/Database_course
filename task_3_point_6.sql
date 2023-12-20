/* 
	6. Показать список покупателей (CustomerID), 
	которые имеют несколько стоимостей заказа (SubTotal) больше 10000, 
	из таблицы Sales.SalesOrderHeader, используя SELF JOIN. 
*/
SELECT DISTINCT SOH1."CustomerID"
FROM "Sales"."SalesOrderHeader" AS SOH1
JOIN "Sales"."SalesOrderHeader" AS SOH2 
	ON SOH1."CustomerID" = SOH2."CustomerID" 
	AND SOH1."SubTotal" > 10000 
	AND SOH2."SubTotal" > 10000 
	AND SOH1."SalesOrderID" <> SOH2."SalesOrderID";
