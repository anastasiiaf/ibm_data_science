SELECT f_name, l_name FROM EMPLOYEES WHERE address LIKE '%Elgin,IL%';

SELECT f_name, l_name FROM EMPLOYEES WHERE b_date LIKE '197%';

SELECT f_name, l_name FROM EMPLOYEES WHERE dep_id=5 AND salary BETWEEN 60000 AND 70000;

SELECT D.dep_name, E.f_name, E.l_name FROM EMPLOYEES as E, DEPARTMENTS as D 
WHERE E.dep_id=D.dept_id_dep
ORDER BY D.dep_name, E.l_name DESC;

SELECT dep_id, COUNT(*) FROM EMPLOYEES GROUP BY dep_id;

SELECT dep_id, COUNT(*) as num_employees, AVG(salary) as avg_salary FROM EMPLOYEES GROUP BY dep_id;

SELECT dep_id, COUNT(*) as num_employees, AVG(salary) as avg_salary FROM EMPLOYEES GROUP BY dep_id 
ORDER BY avg_salary;

SELECT dep_id, COUNT(*) as num_employees, AVG(salary) as avg_salary FROM EMPLOYEES 
GROUP BY dep_id HAVING COUNT(*)<4 ORDER BY avg_salary;