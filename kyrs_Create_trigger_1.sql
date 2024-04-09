CREATE OR REPLACE FUNCTION fPreventDDLDropSpecificTable()
RETURNS event_trigger AS
$$
DECLARE
    obj record;
BEGIN
    FOR obj IN SELECT * FROM pg_event_trigger_dropped_objects()
    LOOP
        IF obj.object_type = 'table' AND obj.public || '.' || obj.object_name = 'public.taxi_parks' THEN
            RAISE EXCEPTION 'Попытка удаления таблицы my_important_table запрещена!';
        END IF;
    END LOOP;
END;
$$ LANGUAGE plpgsql;
