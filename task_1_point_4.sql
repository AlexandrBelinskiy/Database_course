/* 
	4. Из таблицы Production.WorkOrder показать поля 
	WorkOrderID, ProductID, OrderQty, StockedQty, ScrapReasonID.
	Показать значения поля ScrapReasonID, не равные NULL. 
*/
SELECT "WorkOrderID", "ProductID", "OrderQty", "StockedQty", "ScrapReasonID" 
	FROM "Production"."WorkOrder" 
	WHERE "ScrapReasonID" IS NOT NULL;
