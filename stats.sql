-- correlations
SELECT
 round(
 corr(median_hh_income, pct_bachelors_higher)::numeric, 2
 ) AS bachelors_income_r,
160 Chapter 10
 round(
 corr(pct_travel_60_min, median_hh_income)::numeric, 2
 ) AS income_travel_r,
 round(
 corr(pct_travel_60_min, pct_bachelors_higher)::numeric, 2
 ) AS bachelors_travel_r
FROM acs_2011_2015_stats;

-- regression
SELECT
 round(
 regr_slope(median_hh_income, pct_bachelors_higher)::numeric, 2
 ) AS slope,
 round(
 regr_intercept(median_hh_income, pct_bachelors_higher)::numeric, 2
 ) AS y_intercept
FROM acs_2011_2015_stats;

