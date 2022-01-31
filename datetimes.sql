-- Extracting components of a timestamp value using date_part()

SELECT
 date_part('year', '2019-12-01 18:37:12 EST'::timestamptz) AS "year",
 date_part('month', '2019-12-01 18:37:12 EST'::timestamptz) AS "month",
 date_part('day', '2019-12-01 18:37:12 EST'::timestamptz) AS "day",
 date_part('hour', '2019-12-01 18:37:12 EST'::timestamptz) AS "hour",
 date_part('minute', '2019-12-01 18:37:12 EST'::timestamptz) AS "minute",
 date_part('seconds', '2019-12-01 18:37:12 EST'::timestamptz) AS "seconds",
 date_part('timezone_hour', '2019-12-01 18:37:12 EST'::timestamptz) AS "tz",
 date_part('week', '2019-12-01 18:37:12 EST'::timestamptz) AS "week",
 date_part('quarter', '2019-12-01 18:37:12 EST'::timestamptz) AS "quarter",
 date_part('epoch', '2019-12-01 18:37:12 EST'::timestamptz) AS "epoch";
 
 -- extract(text from value)
 
extract('year' from '2019-12-01 18:37:12 EST'::timestamptz)

-- make a date
SELECT make_date(2018, 2, 22);
-- make a time
SELECT make_time(18, 4, 30.3);
-- make a timestamp with time zone
SELECT make_timestamptz(2018, 2, 22, 18, 4, 30.3, 'Europe/Lisbon');

SELECT '9/30/1929'::date - '9/27/1929'::date;

-- TIMEZONE
SHOW timezone; -- Note: You can see all run-time defaults with SHOW ALL;
