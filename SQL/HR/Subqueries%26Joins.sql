--Accessing Multiple Tables with Sub-Queries
--Retrieve only the EMPLOYEES records that correspond to jobs in the JOBS table.
SELECT * FROM EMPLOYEES E, JOBS J WHERE E.job_id=J.job_ident;

--Retrieve only the list of employees whose JOB_TITLE is Jr. Designer.
SELECT f_name, l_name, job_id FROM EMPLOYEES WHERE job_id IN (SELECT job_ident FROM JOBS WHERE job_title='Jr. Designer');

--Retrieve JOB information and list of employees who earn more than $70,000.
SELECT * FROM JOBS WHERE job_ident IN (SELECT job_id FROM EMPLOYEES  WHERE salary>70000);

--Retrieve JOB information and list of employees whose birth year is after 1976.
SELECT * FROM JOBS WHERE job_ident IN (SELECT job_id FROM EMPLOYEES WHERE YEAR(b_date)>1976);

--Retrieve JOB information and list of female employees whose birth year is after 1976.
SELECT * FROM JOBS WHERE job_ident IN (SELECT job_id FROM EMPLOYEES  WHERE YEAR(b_date)>1976 AND sex='F');


--Accessing Multiple Tables with Implicit Joins
--Perform an implicit cartesian/cross join between EMPLOYEES and JOBS tables.
SELECT * FROM EMPLOYEES, JOBS;

--Retrieve only the EMPLOYEES records that correspond to jobs in the JOBS table.
SELECT * FROM EMPLOYEES, JOBS WHERE EMPLOYEES.job_id=JOBS.job_ident;

--Redo the previous query, using shorter aliases for table names.
SELECT * FROM EMPLOYEES E, JOBS J WHERE E.job_id=J.job_ident;

--Redo the previous query, but retrieve only the Employee ID, Employee Name and Job Title.
SELECT emp_id, f_name, l_name, job_title FROM EMPLOYEES E, JOBS J WHERE E.job_id=J.job_ident;

--Redo the previous query, but specify the fully qualified column names with aliases in the SELECT clause.
SELECT E.emp_id, E.f_name, E.l_name, J.job_title FROM EMPLOYEES E, JOBS J WHERE E.job_id=J.job_ident;
