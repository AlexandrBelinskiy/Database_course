/* 
	2. Показать список товаров (поле Name), в котором указано, 
	есть ли у них количество в корзине покупателя или нет, из таблиц Production.Product, 
	Sales.ShoppingCartItem, используя LEFT OUTER JOIN. 
*/
SELECT PR."Name", CASE WHEN SCI."ShoppingCartItemID" IS NULL THEN 'No' ELSE 'Yes' END AS "InCart"
	FROM "Production"."Product" AS PR
	LEFT OUTER JOIN "Sales"."ShoppingCartItem" AS SCI ON PR."ProductID" = SCI."ProductID";

