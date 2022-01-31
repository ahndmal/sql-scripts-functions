--
WITH
 large_counties (geo_name, st, p0010001)
AS
 (
 SELECT geo_name, state_us_abbreviation, p0010001
 FROM us_counties_2010
 WHERE p0010001 >= 100000
 )
SELECT st, count(*)
FROM large_counties
GROUP BY st
ORDER BY count(*) DESC;

