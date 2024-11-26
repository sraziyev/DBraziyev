--Write a stored procedure named increase_value that takes one 
--integer parameter and returns the parameter value increased by 10.
CREATE PROCEDURE increase_value
    @input INT,
    @output INT OUTPUT
AS
BEGIN
    SET @output = @input + 10;
END;

--Create a stored procedure compare_numbers that takes two integers and returns 'Greater', 'Equal', or ‘Lesser' as an out parameter, 
--depending on the comparison result of these two numbers.
CREATE PROCEDURE compare_numbers
    @num1 INT,
    @num2 INT,
    @result NVARCHAR(10) OUTPUT
AS
BEGIN
    IF @num1 > @num2
        SET @result = 'Greater';
    ELSE IF @num1 = @num2
        SET @result = 'Equal';
    ELSE
        SET @result = 'Lesser';
END;

--Write a stored procedure number_series that takes an integer n and returns a series from 1 to n.
--Use a looping construct within the procedure.
CREATE PROCEDURE number_series
    @n INT
AS
BEGIN
    DECLARE @i INT = 1;

    CREATE TABLE #NumberSeries (Number INT);

    WHILE @i <= @n
    BEGIN
        INSERT INTO #NumberSeries (Number) VALUES (@i);
        SET @i = @i + 1;
    END;

    SELECT Number FROM #NumberSeries;

    DROP TABLE #NumberSeries;
END;

--Write a stored procedure find_employee that takes an 
--employee name as a parameter and returns the employee details by performing a query
CREATE PROCEDURE find_employee
    @employee_name NVARCHAR(100)
AS
BEGIN
    SELECT *
    FROM Employees
    WHERE EmployeeName = @employee_name;
END;

--Develop a stored procedure list_products that returns a table 
--with product details from a given category
CREATE PROCEDURE list_products
    @category NVARCHAR(100)
AS
BEGIN
    SELECT *
    FROM Products
    WHERE Category = @category;
END;

--Create two stored procedures where the first procedure calls the second one.
--For example, a procedure calculate_bonus that calculates a bonus,

CREATE PROCEDURE calculate_bonus
    @employee_id INT,
    @bonus DECIMAL(10, 2) OUTPUT
AS
BEGIN
    SELECT @bonus = Salary * 0.10
    FROM Employees
    WHERE EmployeeID = @employee_id;
END;

-- Аnother procedure update_salary that uses calculate_bonus to update the salary of an employee.
CREATE PROCEDURE update_salary
    @employee_id INT
AS
BEGIN
    DECLARE @bonus DECIMAL(10, 2);

    EXEC calculate_bonus @employee_id = @employee_id, @bonus = @bonus OUTPUT;

    UPDATE Employees
    SET Salary = Salary + @bonus
    WHERE EmployeeID = @employee_id;
END;

-- •Write a stored procedure named complex_calculation.
-- • The procedure should accept multiple parameters of various types (e.g., INTEGER, VARCHAR).
-- • The main block should include at least two nested subblocks.
-- • Each subblock should perform a distinct operation (e.g., a string manipulation and a numeric computation).
-- • The main block should then combine results from these subblocks in some way.
-- • Return a final result that depends on both subblocks' outputs.
-- • Use labels to differentiate the main block and subblocks.

CREATE PROCEDURE complex_calculation
    @int_param INT,
    @varchar_param NVARCHAR(100),
    @final_result NVARCHAR(200) OUTPUT
AS
BEGIN
    DECLARE @numeric_result INT;
    DECLARE @string_result NVARCHAR(100);

    -- Numeric computation
    BEGIN
        DECLARE @num_temp INT;
        SET @num_temp = @int_param * 2;
        SET @numeric_result = @num_temp + 10;
    END;

    -- String manipulation
    BEGIN
        DECLARE @str_temp NVARCHAR(100);
        SET @str_temp = UPPER(@varchar_param);  
        SET @string_result = CONCAT(@str_temp, '_PROCESSED');
    END;

    -- Combine results from subblocks
    SET @final_result = CONCAT('Numeric: ', @numeric_result, ', String: ', @string_result);
END;
