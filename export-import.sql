-- import
COPY cats
FROM 'C:\YourDirectory\cats.csv'
WITH (FORMAT CSV, HEADER);

-- export
COPY 'C:\YourDirectory\cats.csv'
TO cats 
WITH (FORMAT CSV, HEADER);
