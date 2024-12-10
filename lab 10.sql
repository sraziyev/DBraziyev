CREATE TABLE Books (
    book_id INTEGER PRIMARY KEY,
    title VARCHAR(255),
    author VARCHAR(255),
    price DECIMAL(10, 2),
    quantity INTEGER
);

CREATE TABLE Orders (
    order_id INTEGER PRIMARY KEY,
    book_id INTEGER,
    customer_id INTEGER,
    order_date DATE,
    quantity INTEGER,
    FOREIGN KEY (book_id) REFERENCES Books(book_id),
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
);

CREATE TABLE Customers (
    customer_id INTEGER PRIMARY KEY,
    name VARCHAR(255),
    email VARCHAR(255)
);

INSERT INTO Books (book_id, title, author, price, quantity) VALUES
(1, 'Database 101', 'A. Smith', 40.00, 10),
(2, 'Learn SQL', 'B. Johnson', 35.00, 15),
(3, 'Advanced DB', 'C. Lee', 50.00, 5);

INSERT INTO Customers (customer_id, name, email) VALUES
(101, 'John Doe', 'johndoe@example.com'),
(102, 'Jane Doe', 'janedoe@example.com');

--Task1
BEGIN;

INSERT INTO Orders (book_id, customer_id, order_date, quantity)
VALUES (1, 101, CURRENT_DATE, 2);

UPDATE Books
SET quantity = quantity - 2
WHERE book_id = 1;

COMMIT;

--Task2
BEGIN;

DO $$
BEGIN
    IF (SELECT quantity FROM Books WHERE book_id = 3) < 10 THEN
        RAISE EXCEPTION 'Not enough stock available';
    END IF;

    INSERT INTO Orders (book_id, customer_id, order_date, quantity)
    VALUES (3, 102, CURRENT_DATE, 10);

    UPDATE Books
    SET quantity = quantity - 10
    WHERE book_id = 3;
END;
$$;

COMMIT;

--Task3
--session 1
SET TRANSACTION ISOLATION LEVEL READ COMMITTED;

BEGIN;

UPDATE Books
SET price = 45.00
WHERE book_id = 1;
--keeping the transaction open at this point

--session2
SET TRANSACTION ISOLATION LEVEL READ COMMITTED;

BEGIN;
--reading the price before session 1 commits
SELECT price
FROM Books
WHERE book_id = 1;

COMMIT;
--waiting for session 1 to commit, then re-running the SELECT
SELECT price
FROM Books
WHERE book_id = 1;

COMMIT;

--task4
BEGIN;

UPDATE Customers 
SET email = 'newemail@example.com' 
WHERE customer_id = 101;

COMMIT;