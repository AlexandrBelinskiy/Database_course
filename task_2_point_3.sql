/* 
	3. Для каждой профессии найти суммарное количество человек, 
	которые были приняты до 2009 года, из таблицы HumanResources.Employee, 
	не учитывать пустые значения.
*/
SELECT "JobTitle", COUNT(*) AS "TotalEmployees" 
FROM "HumanResources"."Employee" 
	WHERE "HireDate" < '2009-01-01' 
		AND "JobTitle" IS NOT NULL 
	GROUP BY "JobTitle";
