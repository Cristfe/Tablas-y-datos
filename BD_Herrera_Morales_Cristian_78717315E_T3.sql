SELECT employee_id, last_name, job_id, hire_date AS "Fecha Contratacion" FROM EMPLOYEES

SELECT first_name || ' ' || last_name || ' ' || job_id AS "Trabajador y puesto" FROM EMPLOYEES

SELECT first_name, last_name FROM employees WHERE department_id=50 AND first_name LIKE 's%'

SELECT last_name, salary FROM employees WHERE salary <= 11000

SELECT last_name, department_id FROM employees WHERE EMPLOYEE_ID = 100

SELECT last_name, salary FROM employees WHERE salary < 6000 OR salary > 11500

SELECT last_name, job_id, hire_date FROM employees WHERE last_name LIKE 'Gietz' OR LAST_NAME LIKE 'Jones' ORDER BY hire_date DESC

SELECT last_name, salary FROM employees WHERE salary BETWEEN 6000 AND 10000 AND department_id IN (50,80)

SELECT last_name FROM employees WHERE last_name LIKE '%e%a%'

SELECT last_name, job_id, salary FROM employees WHERE job_id IN ('SA_REP','ST_CLERK') AND salary NOT IN (2500,3000,7000)

CREATE VIEW Puestos AS SELECT DISTINCT job_id FROM employees

CREATE VIEW Emp_40_50 AS SELECT last_name, department_id FROM employees WHERE department_id IN (40,50) ORDER BY first_name DESC