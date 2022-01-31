-- Using a subquery in a WHERE clause

SELECT geo_name,
 state_us_abbreviation,
 p0010001
FROM us_counties_2010
WHERE p0010001 >= (
 SELECT percentile_cont(.9) WITHIN GROUP (ORDER BY p0010001)
 FROM us_counties_2010
 )
ORDER BY p0010001 DESC;

--  Subquery as a derived table in a FROM clause
SELECT round(calcs.average, 0) AS average,
 calcs.median,
 round(calcs.average - calcs.median, 0) AS median_average_diff
FROM (
 SELECT avg(p0010001) AS average,
 percentile_cont(.5)
 WITHIN GROUP (ORDER BY p0010001)::numeric(10,1) AS median
 FROM us_counties_2010
 )
AS calcs;
