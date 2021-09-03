-- Aggregate functions
-- Query A1: Enter a function that calculates the total cost of all animal rescues in the PETRESCUE table.
SELECT SUM(cost) FROM PETRESCUE;

-- Query A2: Enter a function that displays the total cost of all animal rescues in the PETRESCUE table in a column called SUM_OF_COST.
SELECT SUM(cost) as SUM_OF_COST FROM PETRESCUE;

-- Query A3: Enter a function that displays the maximum quantity of animals rescued.
SELECT MAX(quantity) FROM PETRESCUE;
SELECT animal,quantity FROM PETRESCUE WHERE quantity=(SELECT MAX(quantity)FROM PETRESCUE);

-- Query A4: Enter a function that displays the average cost of animals rescued.
SELECT AVG(cost) FROM PETRESCUE;

-- Query A5: Enter a function that displays the average cost of rescuing a dog.
SELECT AVG(cost/quantity) FROM PETRESCUE WHERE animal='Dog';  


--Scalar and String functions
--Query B1: Enter a function that displays the rounded cost of each rescue.
SELECT animal, ROUND(cost) FROM PETRESCUE;

--Query B2: Enter a function that displays the length of each animal name.
SELECT animal,LENGTH(animal) FROM PETRESCUE;

--Query B3: Enter a function that displays the animal name in each rescue in uppercase.
SELECT UCASE(animal) FROM PETRESCUE;

--Query B4: Enter a function that displays the animal name in each rescue in uppercase without duplications.
SELECT DISTINCT(UCASE(animal)) FROM PETRESCUE;

--Query B5: Enter a query that displays all the columns from the PETRESCUE table, where the animal(s) rescued are cats. Use cat in lower case in the query. 
 SELECT * FROM PETRESCUE WHERE LCASE(animal)='cat';

-- Date and time functions 
--Query C1: Enter a function that displays the day of the month when cats have been rescued.
 SELECT animal,DAY(rescuedate) FROM PETRESCUE WHERE LCASE(animal)='cat';
 
--Query C2: Enter a function that displays the number of rescues on the 5th month.
SELECT SUM(quantity) FROM PETRESCUE WHERE MONTH(rescuedate)='05';

--Query C3: Enter a function that displays the number of rescues on the 14th day of the month.
SELECT SUM(quantity) FROM PETRESCUE WHERE DAY(rescuedate)='14';

--Query C4: Animals rescued should see the vet within three days of arrivals. Enter a function that displays the third day from each rescue.
SELECT *, (rescuedate + 3 DAYS) as vetday FROM PETRESCUE;

--Query C5: Enter a function that displays the length of time the animals have been rescued; the difference between today’s date and the rescue date.
SELECT *, (current_date - rescuedate) as rescuelength FROM PETRESCUE; 
 