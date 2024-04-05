DO $$
BEGIN
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