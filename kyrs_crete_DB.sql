DO $$
BEGIN
    IF NOT EXISTS (SELECT FROM pg_catalog.pg_tables WHERE schemaname = 'public' AND tablename = 'aggregators') THEN
        CREATE TABLE public.aggregators
        (
            id BIGINT NOT NULL,
            commission DOUBLE PRECISION,
            name VARCHAR(255),
            office_address VARCHAR(255),
            partner_count INTEGER,
            CONSTRAINT aggregators_pkey PRIMARY KEY (id)
        );
    END IF;

    IF NOT EXISTS (SELECT FROM pg_catalog.pg_tables WHERE schemaname = 'public' AND tablename = 'cars') THEN
        CREATE TABLE public.cars
        (
            id BIGINT NOT NULL DEFAULT nextval('cars_id_seq'::regclass),
            brand VARCHAR(255),
            insurance_expiration_date VARCHAR(255),
            mileage INTEGER,
            repair_required BOOLEAN,
            year_of_manufacture INTEGER,
            CONSTRAINT cars_pkey PRIMARY KEY (id)
        );
    END IF;

    IF NOT EXISTS (SELECT FROM pg_catalog.pg_tables WHERE schemaname = 'public' AND tablename = 'taxi_parks') THEN
        CREATE TABLE IF NOT EXISTS public.taxi_parks
        (
            id BIGINT NOT NULL,
            address VARCHAR(255),
            aggregator_id BIGINT,
            owner_id BIGINT,
            CONSTRAINT taxi_parks_pkey PRIMARY KEY (id),
            CONSTRAINT uk_jlp4bmelvd6hvqi6e64du3fdx UNIQUE (aggregator_id),
            CONSTRAINT fkj360thvxtbmj248c29n9qx350 FOREIGN KEY (owner_id)
                REFERENCES public.users (id) MATCH SIMPLE
                ON UPDATE NO ACTION
                ON DELETE NO ACTION,
            CONSTRAINT fkk0inp54kh09ukwlv8msd2ti6w FOREIGN KEY (aggregator_id)
                REFERENCES public.aggregators (id) MATCH SIMPLE
                ON UPDATE NO ACTION
                ON DELETE NO ACTION
        );
    END IF;
  
    -- Создание таблицы taxi_parks_cars 
    IF NOT EXISTS (SELECT FROM pg_catalog.pg_tables WHERE schemaname = 'public' AND tablename = 'taxi_parks_cars') THEN
        CREATE TABLE IF NOT EXISTS public.taxi_parks_cars
        (
            taxi_park_id BIGINT NOT NULL,
            cars_id BIGINT NOT NULL,
            CONSTRAINT uk_moyctqhirlhbngfjtyhi4fot9 UNIQUE (cars_id),
            CONSTRAINT fko6r4x5m3gdmge64rl43rv8oi3 FOREIGN KEY (taxi_park_id)
                REFERENCES public.taxi_parks (id) MATCH SIMPLE
                ON UPDATE NO ACTION
                ON DELETE NO ACTION,
            CONSTRAINT fkspfhwhsufbr2j1tiw2j8r0yso FOREIGN KEY (cars_id)
                REFERENCES public.cars (id) MATCH SIMPLE
                ON UPDATE NO ACTION
                ON DELETE NO ACTION
        );
    END IF;
	
	    -- Создание таблицы users
    IF NOT EXISTS (SELECT FROM pg_catalog.pg_tables WHERE schemaname = 'public' AND tablename = 'users') THEN
        CREATE TABLE IF NOT EXISTS public.users
        (
            id BIGINT NOT NULL,
            driving_experience INTEGER,
            name VARCHAR(255),
            passport_serial_number VARCHAR(255),
            patronymic VARCHAR(255),
            phone_number VARCHAR(255),
            qualification_upgrade_required BOOLEAN,
            surname VARCHAR(255),
            CONSTRAINT users_pkey PRIMARY KEY (id)
        );
    END IF;
END $$;