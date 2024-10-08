CREATE TABLE warehouses (
    code INTEGER PRIMARY KEY,
    location VARCHAR(255),
    capacity INTEGER
);

INSERT INTO warehouses (code, location, capacity) VALUES 
(1, 'Chicago', 3),
(2, 'Chicago', 4),
(3, 'New York', 7),
(4, 'Los Angeles', 2),
(5, 'San Francisco', 8);

CREATE TABLE boxes (
    code VARCHAR(4) PRIMARY KEY,
    contents VARCHAR(255),
    value REAL,
    warehouse INTEGER
);

INSERT INTO boxes (code, contents, value, warehouse) VALUES 
('0MN7', 'Rocks', 180, 3),
('4H8P', 'Rocks', 250, 1),
('4RT3', 'Scissors', 190, 2),
('7G3H', 'Rocks', 200, 1),
('8JN6', 'Papers', 75, 5),
('8Y6U', 'Papers', 50, 3),
('9J6F', 'Papers', 175, 2),
('LL08', 'Scissors', 140, 4),
('POH6', 'Scissors', 125, 1),
('P2T6','Scissors', 150, 2),
('TU55', 'Papers', 90, 5);

SELECT *
FROM warehouses;

SELECT *
FROM boxes
WHERE value > 150;

SELECT DISTINCT contents
FROM boxes;

SELECT code AS warehouse_code, COUNT(*) AS num_boxes
FROM warehouses
GROUP BY code;

SELECT code AS warehouse_code, COUNT(*) AS num_boxes
FROM warehouses
GROUP BY code
HAVING COUNT(*) > 2;

INSERT INTO warehouses (code, location, capacity)
VALUES (6, 'New York', 3);

INSERT INTO boxes (code, contents, value, warehouse)
VALUES ('H5RT', 'Papers', 200, 2);

UPDATE boxes
SET value = 0.85 * value
WHERE value = (SELECT value FROM boxes ORDER BY value DESC LIMIT 1 OFFSET 2);

DELETE FROM boxes
WHERE value < 150;

DELETE FROM boxes
WHERE warehouse IN (SELECT code FROM warehouses WHERE location = 'New York');