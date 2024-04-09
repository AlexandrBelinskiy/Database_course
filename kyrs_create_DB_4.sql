DO $$
BEGIN
    IF NOT EXISTS (SELECT FROM pg_catalog.pg_tables WHERE schemaname = 'public' AND tablename = 'taxi_parks_cars') THEN
        CREATE TABLE IF NOT EXISTS public.taxi_parks_cars
        (
            taxi_park_id BIGINT NOT NULL,
            cars_id BIGINT NOT NULL,
            CONSTRAINT crs_id UNIQUE (cars_id),
            CONSTRAINT txp_id FOREIGN KEY (taxi_park_id)
                REFERENCES public.taxi_parks (id) MATCH SIMPLE,
            CONSTRAINT crs_id FOREIGN KEY (cars_id)
                REFERENCES public.cars (id) MATCH SIMPLE
        );
    END IF;
END $$;