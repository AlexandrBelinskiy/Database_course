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
            CONSTRAINT aggreg_id UNIQUE (aggregator_id),
            CONSTRAINT own_id FOREIGN KEY (owner_id)
                REFERENCES public.users (id) MATCH SIMPLE,
            CONSTRAINT agg_id FOREIGN KEY (aggregator_id)
                REFERENCES public.aggregators (id) MATCH SIMPLE
        );
    END IF;
END $$;