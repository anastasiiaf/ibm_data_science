--Exercise 1: Using Joins
--Question 1
--Write and execute a SQL query to list the school names, community names and average attendance for communities 
--with a hardship index of 98.
SELECT CPS.name_of_school, CPS.community_area_name, CPS.average_student_attendance, CD.hardship_index
FROM CHICAGO_PUBLIC_SCHOOLS CPS
LEFT JOIN CENSUS_DATA CD
ON CPS.community_area_number = CD.community_area_number
WHERE CD.hardship_index=98;















--Question 2
--Write and execute a SQL query to list all crimes that took place at a school. Include case number, crime type
--and community name.
SELECT CCD.case_number, CCD.primary_type, CD.community_area_name
FROM CHICAGO_CRIME_DATA CCD
LEFT JOIN CENSUS_DATA CD
ON CCD.community_area_number=CD.community_area_number
WHERE UCASE(CCD.location_description) LIKE '%SCHOOL%';



















--Exercise 2: Creating a View
--Question 1
--a) Write and execute a SQL statement to create a view showing 
--the columns listed in the following table, with new column names
--as shown in the second column.
DROP VIEW SchoolDashboard;
CREATE VIEW SchoolDashboard (School_Name, Safety_Rating, Family_Rating, 
Environment_Rating, Instruction_Rating, Leaders_Rating, Teachers_Rating) 
AS 
SELECT NAME_OF_SCHOOL, Safety_Icon, Family_Involvement_Icon, 
Environment_Icon,Instruction_Icon, Leaders_Icon, Teachers_Icon
FROM CHICAGO_PUBLIC_SCHOOLS;

--b) Write and execute a SQL statement that returns all of the columns 
--from the view.
SELECT * FROM SchoolDashboard;

--c) Write and execute a SQL statement that returns just the school name
--and leaders rating from the view.
SELECT School_Name, Leaders_Rating FROM SchoolDashboard;

--Exercise 3: Creating a Stored Procedure
--Question 1
--Write the structure of a query to create or replace a stored procedure called UPDATE_LEADERS_SCORE that takes a in_School_ID parameter as an integer and a in_Leader_Score parameter as an integer. Don't forget to use the #SET TERMINATOR statement to use the @ for the CREATE statement terminator.

--Question 2
--Inside your stored procedure, write a SQL statement to update the Leaders_Score field in the CHICAGO_PUBLIC_SCHOOLS table for the school identified by in_School_ID to the value in the in_Leader_Score parameter.

--Question 3
--Inside your stored procedure, write a SQL IF statement to update the Leaders_Icon field in the CHICAGO_PUBLIC_SCHOOLS table for the school identified by in_School_ID using the following information.









--Question 4
--Run your code to create the stored procedure.

--Write a query to call the stored procedure, passing a valid school ID and a leader score of 50, 
--to check that the procedure works as expected.

-- leaders_icon column's length was only 4 chars
--ALTER TABLE CHICAGO_PUBLIC_SCHOOLS
--ALTER COLUMN leaders_icon SET DATA TYPE VARCHAR(11);


SELECT school_id, name_of_school, leaders_icon, leaders_score FROM CHICAGO_PUBLIC_SCHOOLS;
CALL UPDATE_LEADERS_SCORE(610038, 50);
SELECT school_id, name_of_school, leaders_icon, leaders_score FROM CHICAGO_PUBLIC_SCHOOLS;






















--Exercise 4: Using Transactions

--Question 1
--Update your stored procedure definition. Add a generic ELSE clause to the IF statement that rolls back the current work if the score did not fit any of the preceding categories.
--See Assignment_Procedure

--Question 2
--Update your stored procedure definition again. Add a statement to commit the current unit of work at the end of the procedure.
--See Assignment_Procedure

--Run your code to replace the stored procedure.
--Instead of only CREATE, write CREATE OR REPLACE in procedure






















--Write and run one query to check that the updated stored procedure works as expected when you use 
--a valid score of 38.
SELECT school_id, name_of_school, leaders_icon, leaders_score FROM CHICAGO_PUBLIC_SCHOOLS;
CALL UPDATE_LEADERS_SCORE(610038, 38);
SELECT school_id, name_of_school, leaders_icon, leaders_score FROM CHICAGO_PUBLIC_SCHOOLS;


--Write and run another query to check that the updated stored procedure works as expected when you use
--an invalid score of 101.
SELECT school_id, name_of_school, leaders_icon, leaders_score FROM CHICAGO_PUBLIC_SCHOOLS;
CALL UPDATE_LEADERS_SCORE(610038, 101);
SELECT school_id, name_of_school, leaders_icon, leaders_score FROM CHICAGO_PUBLIC_SCHOOLS;























