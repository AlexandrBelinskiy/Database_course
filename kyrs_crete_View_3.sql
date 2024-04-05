
-- Создаем представление ля таксопарков, для получения сведений на счет, того сколько машин в такоспарке нуждается в ремонте

CREATE OR REPLACE VIEW v_aggregators_taxi_parks_cars_repair_needed AS
SELECT 
    ag.name AS aggregator_name,
    ag.office_address AS aggregator_office,
    tp.address AS taxi_park_address,
    COUNT(c.id) AS cars_repair_needed
FROM public.aggregators ag
JOIN public.taxi_parks tp ON ag.id = tp.aggregator_id
JOIN public.taxi_parks_cars tpc ON tp.id = tpc.taxi_park_id
JOIN public.cars c ON tpc.cars_id = c.id AND c.repair_required = TRUE
GROUP BY ag.name, ag.office_address, tp.address;


-- Название представления:v_aggregators_taxi_parks_cars_repair_needed

