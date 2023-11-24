/* 
	8. Показать список ProductID, которые содержатся в таблице Production.Product, 
	но не содержатся в таблице Sales.SpecialOfferProduct. 
*/
SELECT "ProductID"
FROM "Production"."Product"
	EXCEPT
SELECT "ProductID"
FROM "Sales"."SpecialOfferProduct";