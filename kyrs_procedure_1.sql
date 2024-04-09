
-- Получение информации о том, какие водители, в каком таксопарке нуждаются в повышении квалификации

CREATE OR REPLACE FUNCTION check_driver_qualification_by_taxi_park(_taxi_park_name VARCHAR)
RETURNS TABLE (driver_id BIGINT, driver_name VARCHAR, needs_qualification_upgrade BOOLEAN, result_message TEXT) AS $$
DECLARE
    v_taxi_park_exists BOOLEAN;
BEGIN
    -- Проверяем, существует ли таксопарк с заданным названием
    SELECT EXISTS(SELECT 1 FROM public.taxi_parks WHERE name = _taxi_park_name)
    INTO v_taxi_park_exists;

    -- Если таксопарк не найден, выбрасываем ошибку
    IF NOT v_taxi_park_exists THEN
        RAISE EXCEPTION 'Таксопарк с указанным названием не найден.';
    END IF;

    -- Выполняем основной запрос, если таксопарк существует
    RETURN QUERY 
    SELECT u.id AS driver_id, u.name AS driver_name, u.qualification_upgrade_required AS needs_qualification_upgrade, 'Успешно' AS result_message
    FROM public.users u
    INNER JOIN public.cars c ON u.id = c.driver_id
    INNER JOIN public.taxi_parks_cars tpc ON c.id = tpc.cars_id
    INNER JOIN public.taxi_parks tp ON tpc.taxi_park_id = tp.id
    WHERE u.qualification_upgrade_required AND tp.name = _taxi_park_name;

END
$$ LANGUAGE plpgsql;
