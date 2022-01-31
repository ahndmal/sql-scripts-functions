
SELECT max_temp,
 CASE WHEN max_temp >= 90 THEN 'Hot'
 WHEN max_temp BETWEEN 70 AND 89 THEN 'Warm'
 WHEN max_temp BETWEEN 50 AND 69 THEN 'Pleasant'
 WHEN max_temp BETWEEN 33 AND 49 THEN 'Cold'
 WHEN max_temp BETWEEN 20 AND 32 THEN 'Freezing'
 ELSE 'Inhumane'
 END AS temperature_group
FROM temperature_readings;

