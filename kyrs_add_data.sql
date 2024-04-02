-- Добавление записи в таблицу users
CREATE OR REPLACE PROCEDURE insert_into_users(
    _id BIGINT,
    _name VARCHAR,
    _surname VARCHAR,
    _patronymic VARCHAR,
    _phone_number VARCHAR,
    _driving_experience INTEGER,
    _passport_serial_number VARCHAR,
    _qualification_upgrade_required BOOLEAN)
LANGUAGE plpgsql
AS $$
BEGIN
    INSERT INTO public.users (id, name, surname, patronymic, phone_number, driving_experience, passport_serial_number, qualification_upgrade_required)
    VALUES (_id, _name, _surname, _patronymic, _phone_number, _driving_experience, _passport_serial_number, _qualification_upgrade_required);
END;
$$;

-- Пример использования
CALL insert_into_users(1, 'John', 'Doe', 'Middle', '555-1234', 5, 'AB1234567', FALSE);

-- Добавление записи в таблицу aggregators
CREATE OR REPLACE PROCEDURE insert_into_aggregators(
    _id BIGINT,
    _name VARCHAR,
    _commission FLOAT,
    _office_address VARCHAR,
    _partner_count INTEGER)
LANGUAGE plpgsql
AS $$
BEGIN
    INSERT INTO public.aggregators (id, name, commission, office_address, partner_count)
    VALUES (_id, _name, _commission, _office_address, _partner_count);
END;
$$;

-- Пример использования
CALL insert_into_aggregators(1, 'Aggregator1', 5.0, 'Some Street 123', 10);

-- Добавление записи в таблицу cars
CREATE OR REPLACE PROCEDURE insert_into_cars(
    _id BIGINT,
    _brand VARCHAR,
    _year_of_manufacture INTEGER,
    _mileage INTEGER,
    _insurance_expiration_date DATE,
    _repair_required BOOLEAN)
LANGUAGE plpgsql
AS $$
BEGIN
    INSERT INTO public.cars (id, brand, year_of_manufacture, mileage, insurance_expiration_date, repair_required)
    VALUES (_id, _brand, _year_of_manufacture, _mileage, _insurance_expiration_date, _repair_required);
END;
$$;

-- Пример использования
CALL insert_into_cars(1, 'Toyota', 2015, 50000, '2023-12-31', FALSE);

-- Добавление записи в таблицу taxi_parks
CREATE OR REPLACE PROCEDURE insert_into_taxi_parks(
    _id BIGINT,
    _address VARCHAR,
    _aggregator_id BIGINT,
    _owner_id BIGINT)
LANGUAGE plpgsql
AS $$
BEGIN
    INSERT INTO public.taxi_parks (id, address, aggregator_id, owner_id)
    VALUES (_id, _address, _aggregator_id, _owner_id);
END;
$$;

-- Пример использования
CALL insert_into_taxi_parks(1, 'Park Avenue 1', 1, 1);

-- Добавление записи в таблицу taxi_parks_cars
CREATE OR REPLACE PROCEDURE insert_into_taxi_parks_cars(
    _taxi_park_id BIGINT,
    _cars_id BIGINT)
LANGUAGE plpgsql
AS $$
BEGIN
    INSERT INTO public.taxi_parks_cars (taxi_park_id, cars_id)
    VALUES (_taxi_park_id, _cars_id);
END;
$$;

-- Пример использования
CALL insert_into_taxi_parks_cars(1, 1);
