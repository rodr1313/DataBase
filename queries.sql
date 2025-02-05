-- 1. Retrieve all country names and their official languages.
SELECT Name, Language 
FROM country
JOIN countrylanguage ON country.Code = countrylanguage.CountryCode
WHERE countrylanguage.IsOfficial = 'T';

-- 2. List all cities in Germany along with their population.
SELECT Name, Population 
FROM city
WHERE CountryCode = 'DEU';

-- 3. Find the five smallest countries by surface area.
SELECT Name, SurfaceArea 
FROM country
ORDER BY SurfaceArea ASC
LIMIT 5;

-- 4. Find all countries with a population greater than 50 million and sort them in descending order of population.
SELECT Name, Population 
FROM country
WHERE Population > 50000000
ORDER BY Population DESC;

-- 5. Retrieve the average life expectancy per continent.
SELECT Region, AVG(LifeExpectancy) AS AverageLifeExpectancy
FROM country
GROUP BY Region;

-- 6. Calculate the total population per region.
SELECT Region, SUM(Population) AS TotalPopulation
FROM country
GROUP BY Region;

-- 7. Count the number of cities in each country and sort by the highest count.
SELECT CountryCode, COUNT(*) AS NumberOfCities
FROM city
GROUP BY CountryCode
ORDER BY NumberOfCities DESC;

-- 8. Display the top 10 largest cities along with their country name.
SELECT city.Name AS CityName, country.Name AS CountryName
FROM city
JOIN country ON city.CountryCode = country.Code
ORDER BY city.Population DESC
LIMIT 10;

-- 9. Retrieve the names of all countries that have an official language of French.
SELECT DISTINCT country.Name 
FROM country
JOIN countrylanguage ON country.Code = countrylanguage.CountryCode
WHERE countrylanguage.Language = 'French' AND countrylanguage.IsOfficial = 'T';

-- 10. Find all countries where English is spoken, but it is not the official language.
SELECT DISTINCT country.Name 
FROM country
JOIN countrylanguage ON country.Code = countrylanguage.CountryCode
WHERE countrylanguage.Language = 'English' AND countrylanguage.IsOfficial = 'F';

-- 11. Find countries where the population tripled in the past 50 years (if historical data is available).
-- Nota: Esta consulta no puede ser ejecutada sin datos históricos.
-- Si tuvieses los datos históricos de población, la consulta sería algo como esto:
-- SELECT Name
-- FROM country
-- WHERE Population > 3 * (SELECT Population FROM country WHERE Name = country.Name AND Year = (YEAR(CURDATE()) - 50));

-- 12. List the richest and poorest countries in each continent based on GNP.
SELECT Region, 
       MAX(GNP) AS RichestCountry, 
       MIN(GNP) AS PoorestCountry
FROM country
GROUP BY Region;

-- 13. Identify countries with a life expectancy below the global average.
SELECT Name
FROM country
WHERE LifeExpectancy < (SELECT AVG(LifeExpectancy) FROM country);

-- 14. Retrieve the capital cities of countries with a population above 100 million.
SELECT capital
FROM country
WHERE Population > 100000000;

-- 15. Find the continent with the highest number of countries.
SELECT Region
FROM country
GROUP BY Region
ORDER BY COUNT(*) DESC
LIMIT 1;
