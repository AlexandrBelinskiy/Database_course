/* 
	6. Из таблицы Sales.SalesTerritory показать название и код страны или её региона (Name, CountryRegionCode),
	и название части света (Group). 
	Показать только города или регионы из списка 
	('Central', 'Canada', 'Germany', 'Australia', 'United Kingdom').
	Использовать оператор IN.
*/
SELECT "Name", "CountryRegionCode", "Group" 
	FROM "Sales"."SalesTerritory" 
	WHERE "Name" IN ('Central', 'Canada', 'Germany', 'Australia', 'United Kingdom');
