--
SELECT substring('The game starts at 7 p.m. on May 2, 2019.' from '\d{4}');

-- Using regexp_match() to find the second date
SELECT crime_id,
 regexp_match(original_text, '\d{1,2}\/\d{1,2}\/\d{2}')
FROM crime_reports;

-- City (?:Sq.|Plz.|Dr.|Ter.|Rd.)\n(\w+ \w+|\w+)\n

SELECT
 regexp_match(original_text, '(?:C0|SO)[0-9]+') AS case_number,
 regexp_match(original_text, '\d{1,2}\/\d{1,2}\/\d{2}') AS date_1,
 regexp_match(original_text, '\n(?:\w+ \w+|\w+)\n(.*):') AS crime_type,
 regexp_match(original_text, '(?:Sq.|Plz.|Dr.|Ter.|Rd.)\n(\w+ \w+|\w+)\n')
 AS city
FROM crime_reports;

--- regex in WHERE clause ---

SELECT geo_name
FROM us_counties_2010
WHERE geo_name ~* '.+ash.+' AND geo_name !~ 'Wash.+'
ORDER BY geo_name;

-- Regular expression functions to replace and split text
SELECT regexp_replace('05/12/2018', '\d{4}', '2017');
SELECT regexp_split_to_table('Four,score,and,seven,years,ago', ',');
SELECT regexp_split_to_array('Phil Mike Tony Steve', ',');

--
UPDATE president_speeches
SET search_speech_text = to_tsvector('english', speech_text);


