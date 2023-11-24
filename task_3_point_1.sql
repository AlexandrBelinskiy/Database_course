/* 
	1. Показать должности (JobTitle) и поля PersonType, FirstName, LastName из таблиц Person.Person, HumanResourse.Employee.
*/
SELECT E."JobTitle", P."PersonType", P."FirstName", P."LastName"
	FROM "HumanResources"."Employee" E
INNER JOIN "Person"."Person" P ON E."BusinessEntityID" = P."BusinessEntityID";
	