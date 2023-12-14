/*
  Задание 2:
  Определить количество продавцов и территорию (TerritoryName), 
  которую обслуживает максимальное количество продавцов 
  из представления Sales.vSalesPerson.
*/
SELECT 
    "TerritoryName", 
    COUNT(*) AS "NumberOfSalesPersons"
FROM 
    "Sales"."vSalesPerson"
GROUP BY 
    "TerritoryName"
ORDER BY 
    "NumberOfSalesPersons" DESC
LIMIT 1;
