DO $$
BEGIN
    IF NOT EXISTS (SELECT FROM pg_catalog.pg_tables WHERE schemaname = 'public' AND tablename = 'aggregators') THEN
        CREATE TABLE public.aggregators
        (
     	   id BIGINT NOT NULL,
    	   commission DOUBLE PRECISION,
    	   name VARCHAR(255) COLLATE pg_catalog."default" NOT NULL,
    	   office_address VARCHAR(255) COLLATE pg_catalog."default" NOT NULL,
    	   partner_count INTEGER,
    	   CONSTRAINT aggregators_pkey PRIMARY KEY (id),
    	   CONSTRAINT name_unique UNIQUE(name),
    	   CONSTRAINT commission_positive CHECK (commission >= 0)
        );
    END IF;
END $$;