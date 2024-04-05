DO $$
BEGIN
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
END $$;