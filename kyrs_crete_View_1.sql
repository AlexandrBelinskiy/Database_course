
-- Создаем представление таксопарков, получая все связные с ним данные.
CREATE VIEW v_taxi_parks AS
SELECT tp.id, tp.address, tp.aggregator_id, tp.owner_id, agg.name AS aggregator_name, usr.name AS owner_name
FROM public.taxi_parks tp
JOIN public.aggregators agg ON tp.aggregator_id = agg.id
JOIN public.users usr ON tp.owner_id = usr.id;
-- Название представления: v_taxi_parks

