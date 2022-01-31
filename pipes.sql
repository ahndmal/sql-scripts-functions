UPDATE cats
SET age = '00' || age
WHERE st IN('PR','VI') AND length(age) = 3;

--

UPDATE meat_poultry_egg_inspect
SET zip = '0' || zip
WHERE st IN('CT','MA','ME','NH','NJ','RI','VT') AND length(zip) = 4;

-- return to the meat_poultry_egg_inspect table, add a column for inspection dates, and then fill in that column with the New England states
ALTER TABLE meat_poultry_egg_inspect ADD COLUMN inspection_date date;
UPDATE meat_poultry_egg_inspect inspect
SET inspection_date = '2019-12-01'
WHERE EXISTS (SELECT state_regions.region
 FROM state_regions
 WHERE inspect.st = state_regions.st
 AND state_regions.region = 'New England');

