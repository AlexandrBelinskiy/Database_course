
-- Создаем представление ля таксопарков, для получения сведений на счет, того сколько машинв такоспарке нуждается в страховке
CREATE OR REPLACE VIEW v_taxi_parks_insurance_needed AS
SELECT 
    tp.id as taxi_park_id,
    tp.name as taxi_park_name,
    tp.address as taxi_park_address,
    COUNT(c.id) as cars_insurance_needed
FROM public.taxi_parks tp
JOIN public.taxi_parks_cars tpc ON tp.id = tpc.taxi_park_id
JOIN public.cars c ON tpc.cars_id = c.id
WHERE c.insurance_expiration_date < CURRENT_DATE
GROUP BY tp.id;

-- Название представления:v_taxi_parks_insurance_needed

