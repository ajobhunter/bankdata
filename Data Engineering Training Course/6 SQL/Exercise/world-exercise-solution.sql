USE world;

-- 1st step to understand data
SELECT * FROM city;
SELECT * FROM country;
SELECT * FROM countrylanguage;

-- 1 Return the country names that have English as their official language.
SELECT c.name
FROM country c
INNER JOIN countrylanguage cl ON c.code = cl.countrycode
WHERE cl.language = 'English' AND cl.isofficial = TRUE;

-- 2 Count how many countries there are in the Antarctica region
SELECT COUNT(code) AS num_countries_antarctica
FROM country
WHERE region = 'Antarctica';

-- 3 Return the top 5 cities with the most population.
SELECT *
FROM city
ORDER BY population DESC
LIMIT 5;

-- 4 Return the top 10 countries with the least life expectancy
SELECT name, LifeExpectancy
FROM country
WHERE LifeExpectancy IS NOT NULL
ORDER BY LifeExpectancy ASC
LIMIT 10;

-- 5 Return the top 5 districts with the most population
SELECT district, SUM(population) AS district_population
FROM city
GROUP BY district
ORDER BY district_population DESC
LIMIT 5;

-- 6 Return the languages that have 50% or more of the population speak it in their respective countries.
SELECT cl.language, c.name, cl.percentage
FROM countrylanguage cl
INNER JOIN country c ON cl.countrycode = c.code
WHERE cl.percentage >= 50
ORDER BY cl.percentage DESC;

-- 7 Return the region with the highest average GNP
SELECT region, AVG(gnp) AS avg_gnp
FROM country
GROUP BY region
ORDER BY avg_gnp DESC
LIMIT 1;

-- 8 Return the continent with the highest population density. (hint: population density= population/ surface area)
SELECT continent, SUM(population) / SUM(surfacearea) AS population_density
FROM country
GROUP BY continent
ORDER BY population_density DESC;

-- 9 Count how many countries speak French
SELECT COUNT(countrycode) AS num_french
FROM countrylanguage
WHERE languages = 'French';

-- 10 Return the countries which have their year of independence at 1950 or later
SELECT name, indepyear
FROM country
WHERE indepyear IS NOT NULL AND indepyear >= 1950
ORDER BY indepyear DESC;