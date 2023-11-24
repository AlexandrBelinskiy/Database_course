/* 
	10. Показать поле Name из таблицы Person.CountryRegion.
	Заменить название региона (Name) на NULL, если регион называется American Samoa. 
*/
SELECT COALESCE(NULLIF("Name", 'American Samoa'), NULL) AS "Name" 
	FROM "Person"."CountryRegion";