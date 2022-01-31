ALTER TABLE table ADD COLUMN column data_type;

--Similarly, we can remove a column:
ALTER TABLE table DROP COLUMN column;

--To change the data type of a column:
ALTER TABLE table ALTER COLUMN column SET DATA TYPE data_type;

--Adding a NOT NULL constraint to a column
ALTER TABLE table ALTER COLUMN column SET NOT NULL;

-- remove constraint
ALTER TABLE table ALTER COLUMN column DROP NOT NULL;

-- update one table with values from another table
UPDATE table
SET column = (SELECT column
 FROM table_b
 WHERE table.column = table_b.column)
WHERE EXISTS (SELECT column
 FROM table_b
 WHERE table.column = table_b.column);
 
-- Creating a Column Copy
ALTER TABLE meat_poultry_egg_inspect ADD COLUMN st_copy varchar(2);
UPDATE meat_poultry_egg_inspect
SET st_copy = st;

