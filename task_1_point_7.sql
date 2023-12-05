/* 
	7. Показать поля DepartmentID, ShiftID, StartDate, EndDate
	из таблицы HumanResources.EmployeeDepartmentHistory.
	Если дата окончания (EndDate) неизвестна, то показать текущую дату. 
*/
SELECT "DepartmentID", "ShiftID", "StartDate", 
	COALESCE("EndDate", CURRENT_DATE) AS "EndDate" 
	FROM "HumanResources"."EmployeeDepartmentHistory";

