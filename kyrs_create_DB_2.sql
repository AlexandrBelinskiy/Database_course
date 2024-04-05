DO $$
BEGIN
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
END $$;