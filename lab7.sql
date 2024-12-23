-- 1. Create index for queries like:
-- SELECT * FROM countries WHERE name = 'string';
CREATE INDEX idx_countries_name ON countries(name);

-- 2. Create index for queries like:
-- SELECT * FROM employees WHERE name = 'string' AND surname = 'string';
CREATE INDEX idx_employees_name_surname ON employees(name, surname);

-- 3. Create unique index for queries like:
-- SELECT * FROM employees WHERE salary < value1 AND salary > value2;
CREATE INDEX idx_employees_salary_range ON employees(salary);

-- 4. Create index for queries like:
-- SELECT * FROM employees WHERE substring(name FROM 1 FOR 4) = 'abcd';
CREATE INDEX idx_employees_name_substring ON employees (SUBSTRING(name FROM 1 FOR 4));

-- 5. Create index for queries like:
-- SELECT * FROM employees e JOIN departments d 
-- ON d.department_id = e.department_id WHERE d.budget > value2 AND e.salary < value2;
CREATE INDEX idx_employees_department_id ON employees(department_id);
CREATE INDEX idx_departments_budget ON departments(budget);
CREATE INDEX idx_employees_salary ON employees(salary);
