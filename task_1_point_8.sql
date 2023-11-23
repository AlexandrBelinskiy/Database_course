/* 
	8. Показать поля ProductID, Name из таблицы Production.Product с применением функции COALESCE().
	Показать поле Measurement, так, чтобы, если значение в поле Size известно, то показать его, а иначе,
	показать значение в поле Color. Если и в поле Color значение неизвестно, то вывести значение 'UNKNOWN'.
*/
SELECT "ProductID", "Name", 
	COALESCE("Size", "Color", 'UNKNOWN') AS "Measurement" 
	FROM "Production"."Product";
