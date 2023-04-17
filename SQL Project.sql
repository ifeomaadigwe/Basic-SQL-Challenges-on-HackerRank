
---/ Query all columns for all American cities in the CITY table with populations larger 
---/ than 100000. The CountryCode for America is USA.
SELECT *
FROM CITY
WHERE POPULATION > 100000 AND COUNTRYCODE = 'USA';



---/ Query the NAME field for all American cities in the CITY table with populations larger 
---/ than 120000. The CountryCode for America is USA.
SELECT NAME
FROM CITY
WHERE POPULATION > 120000 AND COUNTRYCODE = 'USA';



---/ Query all columns (attributes) for every row in the CITY table.
SELECT *
FROM CITY;



---/ Query all columns for a city in CITY with the ID 1661.albums
SELECT *
FROM CITY
WHERE ID = 1661;



---/Query all attributes of every Japanese city in the CITY table. 
---/ The COUNTRYCODE for Japan is JPN.
SELECT *
FROM CITY
WHERE COUNTRYCODE = 'JPN';



---/Query the names of all the Japanese cities in the CITY table. 
---/The COUNTRYCODE for Japan is JPN
SELECT NAME
FROM CITY
WHERE COUNTRYCODE = 'JPN';



---/ Query a list of CITY and STATE from the STATION table.
SELECT CITY, STATE
FROM STATION;



---/ Query a list of CITY names from STATION for cities that have an even ID number. 
---/ Print the results in any order, but exclude duplicates from the answer.
SELECT DISTINCT(CITY)
FROM STATION
WHERE MOD (ID, 2) = 0
ORDER BY CITY ASC;



---/ Find the difference between the total number of CITY entries 
---/  in the table and the number of distinct CITY entries in the table
SELECT COUNT(*) - COUNT(DISTINCT CITY) AS DIFFERENCE_BTW
FROM STATION;



---/Query the two cities in STATION with the shortest and longest CITY names, as well as their
---/  respective lengths (i.e.: number of characters in the name). If there is more than one 
----/ smallest or largest city, choose the one that comes first when ordered alphabetically



---/ Query the list of CITY names starting with vowels (i.e., a, e, i, o, or u) from 
--- / STATION. Your result cannot contain duplicates.
SELECT DISTINCT CITY
FROM STATION
WHERE CITY LIKE 'A%' 
OR CITY LIKE 'E%' 
OR CITY LIKE 'I%' 
OR CITY LIKE 'O%' 
OR CITY LIKE 'U%';



---/ Query the list of CITY names ending with vowels (a, e, i, o, u) from STATION.
--/ Your result cannot contain duplicates
SELECT DISTINCT CITY
FROM STATION
WHERE CITY LIKE '%A' 
OR CITY LIKE '%E' 
OR CITY LIKE '%I' 
OR CITY LIKE '%O' 
OR CITY LIKE '%U';



---/ Query the list of CITY names from STATION which have vowels (i.e., a, e, i, o, and u)
---/ as both their first and last characters. Your result cannot contain duplicates
SELECT DISTINCT CITY
FROM STATION
WHERE LEFT(CITY, 1) IN ('a', 'e', 'i', 'o', 'u')
  AND RIGHT(CITY, 1) IN ('a', 'e', 'i', 'o', 'u')



---/ Query the list of CITY names from STATION that do not start with vowels. 
--- Your result cannot contain duplicates.
SELECT DISTINCT CITY
FROM STATION
WHERE LEFT(CITY, 1) NOT IN ('a', 'e', 'i', 'o', 'u')



---/Query the list of CITY names from STATION that do not end with vowels.
---/ Your result cannot contain duplicates.
SELECT DISTINCT CITY
FROM STATION
WHERE RIGHT(CITY, 1) NOT IN ('a', 'e', 'i', 'o', 'u')



---/ Query the list of CITY names from STATION that either do not start with vowels
---/ or do not end with vowels. Your result cannot contain duplicates
SELECT DISTINCT CITY
FROM STATION
WHERE LEFT(CITY, 1) NOT IN ('a', 'e', 'i', 'o', 'u')
  OR RIGHT(CITY, 1) NOT IN ('a', 'e', 'i', 'o', 'u')
  
  
  
----/ Query the list of CITY names from STATION that do not start with vowels and do not end with 
---/ vowels. Your result cannot contain duplicates.
SELECT DISTINCT CITY
FROM STATION
WHERE LEFT(CITY, 1) NOT IN ('a', 'e', 'i', 'o', 'u')
AND RIGHT(CITY, 1) NOT IN ('a', 'e', 'i', 'o', 'u')



---/ Query the Name of any student in STUDENTS who scored higher than  Marks. Order your
---/ output by the last three characters of each name. If two or more students both have names
---/ ending in the same last three characters (i.e.: Bobby, Robby, etc.), secondary sort 
---/ them by ascending ID.
SELECT Name 
FROM STUDENTS 
WHERE Marks > 75 
ORDER BY RIGHT(Name, 3), ID ASC;



---/ Write a query that prints a list of employee names (i.e.: the name attribute) from the 
---/ Employee table in alphabetical order.
SELECT name
FROM Employee
ORDER BY name ASC;



---/ Write a query that prints a list of employee names (i.e.: the name attribute) for
---/ employees in Employee having a salary greater than  per month who have
---/been employees for less than  months. Sort your result by ascending employee_id.
SELECT name
FROM Employee
WHERE salary > 2000
AND months < 10
ORDER BY employee_id ASC



---/ Query the average population for all cities in CITY, rounded down to the nearest integer.
SELECT ROUND(AVG(POPULATION)) AS Average_Population
FROM CITY;



---/ Query the sum of the populations for all Japanese cities in CITY. 
---/ The COUNTRYCODE for Japan is JPN.
SELECT SUM(POPULATION) AS Sum_Japan_Population
FROM CITY
WHERE COUNTRYCODE = 'JPN';



---/ Query the difference between the maximum and minimum populations in CITY
SELECT MAX(population) - MIN(population) AS population_difference
FROM CITY;



---/Samantha was tasked with calculating the average monthly salaries for all employees in the 
---/ EMPLOYEES table, but did not realize her keyboard's  key was broken until after completing the 
--/ calculation. She wants your help finding the difference between her miscalculation (using 
--/ salaries with any zeros removed), and the actual average salary.Write a query calculating 
--/ the amount of error (i.e.:  average monthly salaries), and round it up to the next integer.
SELECT CEIL(AVG(salary) - AVG(REPLACE(salary, '0', ''))) AS salary_error
FROM EMPLOYEES;



---/ We define an employee's total earnings to be their monthly  worked, and the 
---/ maximum total earnings to be the maximum total earnings for any employee in the 
--/ Employee table. Write a query to find the maximum total earnings for all employees 
---/ as well asthe total number of employees who have maximum total earnings. 
SELECT MAX(months*salary) AS max_earnings, COUNT(*) AS num_employees
FROM Employee
WHERE months*salary = (SELECT MAX(months*salary) FROM Employee);



--/ Query the following two values from the STATION table:
-- / The sum of all values in LAT_N rounded to a scale of  decimal places.
--/ The sum of all values in LONG_W rounded to a scale of  decimal places.
SELECT ROUND(SUM(LAT_N), 2) AS SUM_LAT_N, ROUND(SUM(LONG_W), 2) AS SUM_LONG_W
FROM STATION;
