--SECTION A - PROFIT ANALYSIS

/* 1. Within the space of the last three years, what was the profit worth of the breweries,
inclusive of the anglophone and the francophone territories? */

SELECT * FROM breweries 

SELECT years , SUM(profit) as total_profit 
FROM breweries
WHERE years IN (2019,2018,2017)
GROUP BY years;

/* 2. Compare the total profit between these two territories in order for the territory manager, 
Mr. Stone made a strategic decision that will aid profit maximization in 2020.*/

SELECT countries as territories, SUM(profit) 
FROM breweries
WHERE years = 2019 
GROUP BY territories;

-- 3. Country that generated the highest profit in 2019 
SELECT countries, SUM(profit) as highest_profit 
FROM breweries 
WHERE years = 2019 
GROUP BY countries 
ORDER BY highest_profit DESC 
LIMIT 1;

-- 4. Help him find the year with the highest profit. 
SELECT years, SUM(profit) as highest_profit 
FROM breweries
GROUP BY years 
ORDER BY highest_profit DESC 
LIMIT 1;

-- 5. Which month in the three years was the least profit generate
SELECT months, SUM(profit) as least_profit
FROM breweries 
WHERE years IN (2019,2018,2017)
GROUP BY months 
ORDER BY least_profit 
limit 1;

-- 6. What was the minimum profit in the month of December 2018?
SELECT min(profit) as Min_profit 
FROM breweries
WHERE years = 2018 AND months = 'December';

-- 7. Compare the profit in percentage for each of the month in 2019 
SELECT months, round((SUM(profit)/SUM(costs)) * 100,2) as profit_percent 
FROM breweries
WHERE years = 2019 
GROUP BY months;

-- 8. Which particular brand generated the highest profit in Senegal?
SELECT brands, SUM(profit) as highest_profit
FROM breweries
WHERE countries = 'Senegal'
GROUP BY brands
ORDER BY highest_profit DESC
LIMIT 1;

--SECTION B - BRAND ANALYSIS

/* 1. Within the last two years, the brand manager wants to know the top three brands 
consumed in the francophone countries */

SELECT brands, SUM(quantity) as total_consumption
FROM breweries
WHERE countries in ('Togo','Senegal','Benin')
AND years IN (2019,2018)
GROUP BY brands
ORDER BY total_consumption DESC
LIMIT 3;

-- 2. Find out the top two choice of consumer brands in Ghana
SELECT brands, SUM(quantity) as total_consumption
FROM breweries
WHERE countries = 'Ghana'
GROUP BY brands
ORDER BY total_consumption DESC
LIMIT 2;

/* 3. Find out the details of beers consumed in the past three years in the most oil reached 
country in West Africa. */

SELECT *
FROM breweries
WHERE countries = 'Nigeria'
AND brands IN ('trophy','budweiser','castle lite','eagle lager','hero')
AND years IN (2019,2018,2027)

-- 4. Favorites malt brand in Anglophone region between 2018 and 2019 
SELECT brands, SUM(quantity) as total_consumption 
FROM breweries
WHERE countries in ('Nigeria','Ghana')
AND brands like '%malt%'
AND years BETWEEN 2018 AND 2019
GROUP BY brands
ORDER BY total_consumption DESC
LIMIT 1;

-- 5. Which brands sold the highest in 2019 in Nigeria?
SELECT brands, SUM(quantity) as total_sold
FROM breweries
WHERE countries = 'Nigeria'
AND years = 2019
GROUP BY brands
ORDER BY total_sold desc
LIMIT 1;

-- 6. Favorites brand in South_South region in Nigeria 
SELECT brands AS favourite_brand, SUM(quantity) as total_consumption
FROM breweries
WHERE countries = 'Nigeria' AND region = 'southsouth'
GROUP BY brands
ORDER BY total_consumption DESC
LIMIT 1;

-- 7. Bear consumption in Nigeria 
SELECT brands, SUM(quantity) as total_consumption
FROM breweries
WHERE countries = 'Nigeria'
AND brands IN ('trophy','budweiser','castle lite','eagle lager','hero')
GROUP BY brands
ORDER BY total_consumption DESC;

-- 8. Level of consumption of Budweiser in the regions in Nigeria
SELECT region, SUM(quantity) as budweiser_consumption
FROM breweries
WHERE countries = 'Nigeria'
AND brands = 'budweiser'
GROUP BY region;

--9.Level of consumption of Budweiser in the regions in Nigeria in 2019 (Decision on Promo)
SELECT region, SUM(quantity) as budweiser_consumption
FROM breweries
WHERE countries = 'Nigeria'
AND brands = 'budweiser'
AND years = 2019
GROUP BY region;

 --SECTION C - COUNTRIES ANALYSIS
 
-- 1. Country with the highest consumption of beer.
SELECT countries, SUM(quantity) as highest_consumption
FROM breweries
WHERE brands in ('trophy','budweiser','castle lite','eagle lager','hero')
GROUP BY countries 
ORDER BY highest_consumption DESC
LIMIT 1;
 
-- 2. Highest sales personnel of Budweiser in Senegal
SELECT sales_rep, SUM(quantity) as highest_sold
FROM breweries
WHERE countries = 'Senegal'
AND brands = 'budweiser'
GROUP BY sales_rep
ORDER BY highest_sold DESC
LIMIT 1;

-- 3.Country with the highest profit of the fourth quarter in 2019
SELECT countries , SUM(profit) as highest_profit
FROM breweries
WHERE years = 2019
AND months in ('October','November','December')
GROUP BY countries
ORDER BY highest_profit DESC
LIMIT 1 ;