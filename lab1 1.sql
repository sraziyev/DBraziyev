CREATE TABLE users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    firstname VARCHAR(50),
    lastname VARCHAR(50)
);
ALTER TABLE users ADD COLUMN isadmin INT(1);
ALTER TABLE users ADD COLUMN is_admin BOOLEAN DEFAULT FALSE;
UPDATE users
SET is_admin = (isadmin = 1);
ALTER TABLE users DROP COLUMN isadmin;
CREATE TABLE tasks (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50),
    user_id INT
);
DROP TABLE tasks;
