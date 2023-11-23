/* 
	10. Показать поле Name из таблицы Person.CountryRegion.
	Заменить название региона (Name) на NULL, если регион называется American Samoa. 
*/
SELECT CASE 
	WHEN "Name" = 'American Samoa' 
	THEN NULL ELSE "Name" END AS "Name" FROM "Person"."CountryRegion";
