DO $$
BEGIN
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
END $$;