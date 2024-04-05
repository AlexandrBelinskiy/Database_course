-- Создание нового таксопарка со всеми необходыми данным и валидацией.

CREATE OR REPLACE PROCEDURE add_taxi_park(
    i_park_name VARCHAR,
    i_park_address VARCHAR,
    i_aggregator_name VARCHAR,
    OUT o_added BOOLEAN,
    OUT o_park_id BIGINT,
    OUT o_park_name VARCHAR,
    OUT o_address VARCHAR,
    OUT o_aggregator_name VARCHAR
)
LANGUAGE plpgsql
AS $$
DECLARE
    v_aggregator_id BIGINT;
BEGIN
    -- Валидация поля имени таксопарка
    IF i_park_name IS NULL OR TRIM(i_park_name) = '' THEN
        RAISE EXCEPTION 'Taxi park name cannot be null or empty.';
    END IF;

    -- Валидация поля адреса таксопарка
    IF i_park_address IS NULL OR TRIM(i_park_address) = '' THEN
        RAISE EXCEPTION 'Taxi park address cannot be null or empty.';
    END IF;

    -- Валидация поля имени агрегатора
    IF i_aggregator_name IS NULL OR TRIM(i_aggregator_name) = '' THEN
        RAISE EXCEPTION 'Aggregator name cannot be null or empty.';
    END IF;

    -- Поиск ID агрегатора по имени
    SELECT id INTO v_aggregator_id FROM public.aggregators WHERE name = i_aggregator_name;
    IF NOT FOUND THEN
        RAISE EXCEPTION 'Aggregator named % does not exist.', i_aggregator_name;
    END IF;

    -- Проверка существования таксопарка с таким именем
    SELECT id INTO o_park_id FROM public.taxi_parks WHERE name = i_park_name;
    IF FOUND THEN
        o_added := FALSE;
        RAISE NOTICE 'Taxi park named % already exists.', i_park_name;
    ELSE
        -- Добавление нового таксопарка
        INSERT INTO public.taxi_parks (name, address, aggregator_id)
        VALUES (i_park_name, i_park_address, v_aggregator_id)
        RETURNING id INTO o_park_id;

        -- Установка возвращаемых значений
        o_added := TRUE;
        o_park_name := i_park_name;
        o_address := i_park_address;
        o_aggregator_name := i_aggregator_name;
        
        RAISE NOTICE 'New taxi park named % has been added under aggregator named %.', i_park_name, i_aggregator_name;
    END IF;
END;
$$;
