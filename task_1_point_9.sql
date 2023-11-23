/* 
	9.Из таблицы Person.StateProvince показать ID (StateProvinceID) и название (Name) регионов или штатов,
	а также ID страны, на территории которой они располагаются (TerritoryID).
	Отсортировать строки таблицы в обратном алфавитном порядке 
	в соответствии с названием регионов или штатов (Name). 
*/
SELECT "StateProvinceID", "Name", "TerritoryID" 
	FROM "Person"."StateProvince" 
	ORDER BY "Name" DESC;
