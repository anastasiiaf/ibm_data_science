--Execute a failing query (i.e. one which gives an error) to retrieve all employees records whose salary is lower than the average salary.
SELECT * FROM EMPLOYEES WHERE salary < AVG(salary);

--Execute a working query using a sub-select to retrieve all employees records whose salary is lower than the average salary.
SELECT * FROM EMPLOYEES WHERE salary < (SELECT AVG(salary) FROM EMPLOYEES);

--Execute a failing query (i.e. one which gives an error) to retrieve all employees records with EMP_ID, SALARY and maximum salary as MAX_SALARY in every row.
SELECT emp_id, salary, MAX(salary) as max_salary FROM EMPLOYEES;

--Execute a Column Expression that retrieves all employees records with EMP_ID, SALARY and maximum salary as MAX_SALARY in every row.
SELECT emp_id, salary, (SELECT MAX(salary) FROM EMPLOYEES) as max_salary FROM EMPLOYEES;

--Execute a Table Expression for the EMPLOYEES table that excludes columns with sensitive employee data (i.e. does not include columns: SSN, B_DATE, SEX, ADDRESS, SALARY).
SELECT * FROM (SELECT emp_id, f_name, l_name, dep_id FROM EMPLOYEES) as EMP_new