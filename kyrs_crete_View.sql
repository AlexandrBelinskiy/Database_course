-- Создаем представление для таблицы users
CREATE VIEW v_users AS
SELECT id, name, surname, patronymic, phone_number, driving_experience, passport_serial_number, qualification_upgrade_required
FROM public.users;
-- Название представления: v_users

-- Создаем представление для таблицы aggregators
CREATE VIEW v_aggregators AS
SELECT id, name, commission, office_address, partner_count
FROM public.aggregators;
-- Название представления: v_aggregators

-- Создаем представление для таблицы cars
CREATE VIEW v_cars AS
SELECT id, brand, insurance_expiration_date, mileage, repair_required, year_of_manufacture
FROM public.cars;
-- Название представления: v_cars

-- Создаем представление для таблицы taxi_parks
CREATE VIEW v_taxi_parks AS
SELECT tp.id, tp.address, tp.aggregator_id, tp.owner_id, agg.name AS aggregator_name, usr.name AS owner_name
FROM public.taxi_parks tp
JOIN public.aggregators agg ON tp.aggregator_id = agg.id
JOIN public.users usr ON tp.owner_id = usr.id;
-- Название представления: v_taxi_parks

-- Создаем представление для таблицы taxi_parks_cars
CREATE VIEW v_taxi_parks_cars AS
SELECT tpc.taxi_park_id, tpc.cars_id, tp.address AS taxi_park_address, c.brand AS car_brand
FROM public.taxi_parks_cars tpc
JOIN public.taxi_parks tp ON tpc.taxi_park_id = tp.id
JOIN public.cars c ON tpc.cars_id = c.id;
-- Название представления: v_taxi_parks_cars

-- Создаем общее представление, объединяющее данные из нескольких таблиц
CREATE VIEW v_overall_info AS
SELECT usr.name AS user_name, usr.surname, c.brand, tp.address AS taxi_park_address, agg.name AS aggregator_name
FROM public.users usr
LEFT JOIN public.taxi_parks tp ON usr.id = tp.owner_id
LEFT JOIN public.taxi_parks_cars tpc ON tp.id = tpc.taxi_park_id
LEFT JOIN public.cars c ON tpc.cars_id = c.id
LEFT JOIN public.aggregators agg ON tp.aggregator_id = agg.id;
-- Название представления: v_overall_info
