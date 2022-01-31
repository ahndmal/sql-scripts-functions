-- using the rank() and dense_rank() window functions

SELECT
 company,
 widget_output,
 rank() OVER (ORDER BY widget_output DESC),
Statistical Functions in SQL 165
 dense_rank() OVER (ORDER BY widget_output DESC)
FROM widget_companies;

-- Applying rank() within groups using PARTITION BY

SELECT
 category,
 store,
 unit_sales,
 rank() OVER (PARTITION BY category ORDER BY unit_sales DESC)
FROM store_sales;

-- Finding property crime rates per thousand in cities with 500,000 or more people

SELECT
 city,
 st,
 population,
 property_crime,
 round(
 (property_crime::numeric / population) * 1000, 1
 ) AS pc_per_1000
FROM fbi_crime_data_2015
WHERE population >= 500000
ORDER BY (property_crime::numeric / population) DESC;
