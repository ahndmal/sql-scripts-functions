# SQL scripts and functions

Some useful SQL scripts for dev work.

### CREATE TABLE

``` sql
CREATE TABLE pls_fy2014_pupld14a (
 stabr varchar(2) NOT NULL,
 fscskey varchar(6) CONSTRAINT fscskey2014_key PRIMARY KEY,
 libid varchar(20) NOT NULL,
 libname varchar(100) NOT NULL,
 obereg varchar(2) NOT NULL,
 rstatus integer NOT NULL,
 statstru varchar(2) NOT NULL,
 statname varchar(2) NOT NULL,
 stataddr varchar(2) NOT NULL,
 --snip--
 wifisess integer NOT NULL,
 yr_sub integer NOT NULL
);
 CREATE INDEX libname2014_idx ON pls_fy2014_pupld14a (libname);
CREATE INDEX stabr2014_idx ON pls_fy2014_pupld14a (stabr);
CREATE INDEX city2014_idx ON pls_fy2014_pupld14a (city);
CREATE INDEX visits2014_idx ON pls_fy2014_pupld14a (visits);
 COPY pls_fy2014_pupld14a
FROM 'C:\YourDirectory\pls_fy2014_pupld14a.csv'
WITH (FORMAT CSV, HEADER);
```

### Aggregate

https://www.postgresql.org/docs/current/functions-aggregate.html
min, max, group, count, sum

code 00 (no change in address)

### Indexes

Consult the documentation for the database manager you’re using to
learn about the kinds of indexes available and which to use on particular data types. PostgreSQL, for example, has five more index types in
addition to B-Tree. One, called GiST, is particularly suited to the geometry data types I’ll discuss later in the book. Full text search, which
you’ll learn in Chapter 13, also benefits from indexing.
- Consider adding indexes to any columns you’ll use in table joins. Primary
keys are indexed by default in PostgreSQL, but foreign key columns in
related tables are not and are a good target for indexes.
- Add indexes to columns that will frequently end up in a query WHERE
clause. As you’ve seen, search performance is significantly improved
via indexes.
- Use EXPLAIN ANALYZE to test performance under a variety of configurations if you’re unsure. Optimization is a process!

### Transactions

- START TRANSACTION signals the start of the transaction block. In PostgreSQL, you can also use the non-ANSI SQL BEGIN keyword.
- COMMIT signals the end of the block and saves all changes.
- ROLLBACK signals the end of the block and reverts all changes.

```sql
START TRANSACTION;
UPDATE meat_poultry_egg_inspect
SET company = 'AGRO Merchantss Oakland LLC'
WHERE company = 'AGRO Merchants Oakland, LLC';
SELECT company
FROM meat_poultry_egg_inspect
WHERE company LIKE 'AGRO%'
ORDER BY company;
ROLLBACK;
```

structured data
