--Select the names and job start dates of all employees who work for the department number 5.
SELECT E.f_name, E.l_name, JH.start_date
FROM EMPLOYEES E
INNER JOIN JOB_HISTORY JH
ON E.emp_id = JH.empl_id
WHERE JH.dept_id=5;

--Select the names, job start dates, and job titles of all employees who work for the department number 5.
SELECT E.f_name, E.l_name, J.job_title, JH.start_date
FROM EMPLOYEES E, JOBS J
INNER JOIN JOB_HISTORY JH
ON E.emp_id = JH.empl_id
WHERE JH.dept_id=5 AND JH.jobs_id=J.job_ident;

--Perform a Left Outer Join on the EMPLOYEES and DEPARTMENT tables and select employee id, last name, department id and department name for all employees.
SELECT E.emp_id, E.l_name, D.dept_id_dep, D.dep_name
FROM EMPLOYEES E
LEFT OUTER JOIN DEPARTMENTS D
ON E.dep_id = D.dept_id_dep;

--Re-write the previous query but limit the result set to include only the rows for employees born before 1980.
SELECT E.emp_id, E.l_name,E.b_date, D.dept_id_dep, D.dep_name
FROM EMPLOYEES E
LEFT OUTER JOIN DEPARTMENTS D
ON E.dep_id = D.dept_id_dep
WHERE YEAR(E.b_date)<1980;

--Re-write the previous query but have the result set include all the employees but department names for only the employees who were born before 1980.
SELECT E.emp_id, E.l_name,E.b_date, D.dept_id_dep, D.dep_name
FROM EMPLOYEES E
LEFT OUTER JOIN DEPARTMENTS D
ON E.dep_id = D.dept_id_dep AND YEAR(E.b_date)<1980;

--Perform a Full Join on the EMPLOYEES and DEPARTMENT tables and select the First name, Last name and Department name of all employees.
SELECT E.f_name, E.l_name,D.dep_name
FROM EMPLOYEES E
FULL OUTER JOIN DEPARTMENTS D
ON E.dep_id = D.dept_id_dep;

--Re-write the previous query but have the result set include all employee names but department id and department names only for male employees.
SELECT E.f_name, E.l_name,D.dept_id_dep, D.dep_name
FROM EMPLOYEES E
FULL OUTER JOIN DEPARTMENTS D 
ON E.dep_id = D.dept_id_dep AND UCASE(E.sex)='M';
