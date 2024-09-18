CREATE TABLE countries (
    country_id INT AUTO_INCREMENT PRIMARY KEY,
    country_name VARCHAR(255) DEFAULT 'Kazakhstan',
    region_id INT,
    population INT
);
INSERT INTO countries (country_name, region_id, population) 
VALUES ('Example Country', 1, 1000000);
INSERT INTO countries (country_id, country_name) 
VALUES (2, 'New Country');
INSERT INTO countries (country_name, region_id, population) 
VALUES ('Country with NULL Region', NULL, 500000);
INSERT INTO countries (country_name, region_id, population) 
VALUES 
('Country One', 1, 3000000),
('Country Two', 2, 2000000),
('Country Three', 3, 1500000);
INSERT INTO countries (country_name) 
VALUES (NULL);
INSERT INTO countries (region_id, population) 
VALUES (NULL, NULL);
CREATE TABLE countries_new AS 
SELECT * FROM countries WHERE 1=0;
INSERT INTO countries_new (country_id, country_name, region_id, population)
SELECT country_id, country_name, region_id, population FROM countries;
UPDATE countries 
SET region_id = 1 
WHERE region_id IS NULL;
SELECT country_name, population * 1.1 AS `New Population`
FROM countries;
DELETE FROM countries 
WHERE population < 100000;
DELETE FROM countries_new 
WHERE country_id IN (SELECT country_id FROM countries)
RETURNING *;
DELETE FROM countries 
RETURNING *;