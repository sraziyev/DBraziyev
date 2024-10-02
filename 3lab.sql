CREATE DATABASE lab3;

\c lab3;
USE lab3

SELECT last_name FROM employees;

SELECT DISTINCT last_name FROM employees;

SELECT * FROM employees WHERE last_name = 'Smith';

SELECT * FROM employees WHERE last_name IN ('Smith', 'Doe');

SELECT * FROM employees WHERE department_id = 14;

SELECT * FROM employees WHERE department_id IN (37, 77);

SELECT SUM(budget) FROM departments;

SELECT department_id, COUNT(*) AS num_employees 
FROM employees 
GROUP BY department_id;

SELECT department_id 
FROM employees 
GROUP BY department_id 
HAVING COUNT(*) > 2;

SELECT department_name 
FROM departments 
ORDER BY budget DESC 
LIMIT 1 OFFSET 1;

SELECT e.first_name, e.last_name 
FROM employees e 
JOIN departments d ON e.department_id = d.department_id 
WHERE d.budget = (SELECT MIN(budget) FROM departments);

SELECT first_name, last_name 
FROM employees 
WHERE city = 'Almaty'
UNION
SELECT first_name, last_name 
FROM customers 
WHERE city = 'Almaty';

SELECT * 
FROM departments 
WHERE budget > 60000 
ORDER BY budget ASC, department_id DESC;

UPDATE departments 
SET budget = budget * 0.9 
WHERE budget = (SELECT MIN(budget) FROM departments);

UPDATE employees 
SET department_id = (SELECT department_id FROM departments WHERE department_name = 'IT')
WHERE department_id = (SELECT department_id FROM departments WHERE department_name = 'Research');

DELETE FROM employees 
WHERE department_id = (SELECT department_id FROM departments WHERE department_name = 'IT');

DELETE FROM employees;
