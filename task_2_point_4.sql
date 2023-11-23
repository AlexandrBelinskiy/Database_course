/* 
	4. Найти количество номеров телефона разного типа (PhoneNumberTypeID) из таблицы Person.PersonPhone,
	где номер начинается с 217. 
	Показать тип, где номера телефонов встречаются больше 3 раз.
*/
SELECT "PhoneNumberTypeID", COUNT(*) AS "PhoneCount" 
FROM "Person"."PersonPhone" 
	WHERE "PhoneNumber" LIKE '217%' 
	GROUP BY "PhoneNumberTypeID" 
	HAVING COUNT(*) > 3;
