SELECT pls14.stabr,
 sum(pls14.visits) AS visits_2014,
 sum(pls09.visits) AS visits_2009,
 round( (CAST(sum(pls14.visits) AS decimal(10,1)) - sum(pls09.visits)) /
 sum(pls09.visits) * 100, 2 ) AS pct_change
FROM pls_fy2014_pupld14a pls14 JOIN pls_fy2009_pupld09a pls09
ON pls14.fscskey = pls09.fscskey
WHERE pls14.visits >= 0 AND pls09.visits >= 0
GROUP BY pls14.stabr
HAVING sum(pls14.visits) > 50000000
ORDER BY pct_change DESC;

-----

SELECT company,
 street,
 city,
 st,
 count(*) AS address_count
FROM meat_poultry_egg_inspect
GROUP BY company, street, city, st
HAVING count(*) > 1
ORDER BY company, street, city, st;

--- Checking for Missing Values

SELECT st,
 count(*) AS st_count
FROM meat_poultry_egg_inspect
GROUP BY st
ORDER BY st;

-- Checking for Inconsistent Data Values

SELECT company,
 count(*) AS company_count
FROM meat_poultry_egg_inspect
GROUP BY company
ORDER BY company ASC;
