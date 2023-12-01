/* 
	10. Показать поле Name из таблицы Person.CountryRegion.
	Заменить название региона (Name) на NULL, если регион называется American Samoa. 
*/
SELECT NULLIF("Name", 'American Samoa') AS "Name" 
	FROM "Person"."CountryRegion";