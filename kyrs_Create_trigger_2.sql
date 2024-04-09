-- Создание event-trigge

CREATE EVENT TRIGGER ddlt_PreventDDLDropSpecificTable
ON ddl_command_end
WHEN TAG IN ('DROP TABLE')
EXECUTE FUNCTION fPreventDDLDropSpecificTable();
