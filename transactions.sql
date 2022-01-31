-- When you start a transaction, any changes you make to the data aren’t visible to other database users until you execute COMMIT.

START TRANSACTION;
UPDATE meat_poultry_egg_inspect
SET company = 'AGRO Merchantss Oakland LLC'
WHERE company = 'AGRO Merchants Oakland, LLC';
SELECT company
FROM meat_poultry_egg_inspect
WHERE company LIKE 'AGRO%'
ORDER BY company;
ROLLBACK;

-- Backing up a table while adding and filling a new column
CREATE TABLE meat_poultry_egg_inspect_backup AS
SELECT *,
 '2018-02-07'::date AS reviewed_date
FROM meat_poultry_egg_inspect;
