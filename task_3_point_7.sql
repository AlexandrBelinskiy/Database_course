/* 
	7. Показать комбинированный список таблиц HumanResources.Employee, HumanResources.JobCandidate
	по полям BusinessEntityID, ModifiedDate, используя UNION. 
*/
SELECT "BusinessEntityID", "ModifiedDate"
FROM "HumanResources"."Employee"
	UNION
SELECT "BusinessEntityID", "ModifiedDate"
FROM "HumanResources"."JobCandidate";
