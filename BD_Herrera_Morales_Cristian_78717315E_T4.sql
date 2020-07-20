SELECT MAX(salary) AS "MÁXIMO",MIN(salary) AS "MÍNIMO", SUM(salary) AS "SUMA", AVG(salary) FROM employees

SELECT COUNT(DISTINCT manager_id) AS "NUMERO DE JEFES" FROM employees

SELECT MAX(salary) - MIN(salary) AS "DIFERENCIA" FROM employees

SELECT department_id, STREET_ADDRESS, city, STATE_PROVINCE, COUNTRY_NAME FROM employees NATURAL JOIN LOCATIONS NATURAL JOIN COUNTRIES

SELECT first_name, last_name, department_name FROM employees NATURAL JOIN DEPARTMENTS

SELECT last_name, job_ID, department_id, department_name FROM employees NATURAL JOIN DEPARTMENTS NATURAL JOIN LOCATIONS WHERE city='TORONTO'

SELECT first_name, hire_date FROM employees WHERE hire_date < (SELECT hire_date FROM employees WHERE last_name='Davies')

SELECT employee_id, first_name, last_name, salary FROM employees WHERE salary < (SELECT AVG(salary) FROM employees) ORDER BY (salary) ASC

SELECT employee_id, last_name FROM employees WHERE last_name IN (SELECT last_name FROM employees WHERE last_name LIKE '%g%')


SELECT department_name FROM DEPARTMENTS WHERE department_id IN (SELECT department_id FROM employees GROUP BY department_id HAVING AVG(salary)>(SELECT AVG(salary) FROM employees))