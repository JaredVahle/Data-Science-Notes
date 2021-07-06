

# ------ TEMPORARY TABLES NOTES --------

CREATE TEMPORARY TABLE table_name(...);

# --- TEMPORARY TABLES CAN BE REMOVED WITH THE (DROP TABLE STATEMENT)
DROP TABLE example_table_name;

#-- QUERY TO CREATE A TEMP TABLE

CREATE TEMPORARY TABLE my_numbers(
	n INT UNSIGNED NOT NULL
);

DESCRIBE my_numbers;


# NOW WE WILL INSERT SOME DATA INTO IT.
# INSERT IS HOW WE ADD RECORDS/ROWS TO A TABLE

INSERT INTO my_numbers(n) 
VALUES (1), (2), (3), (4), (5);

# LET's TAKE A LOOK AT WHAT OUR TABLE LOOKS LIKE:

SELECT *
FROM my_numbers;


# DB OPERATOPNS
# CRUD
# CREATE, READ, UPDATE, DELETE


# UPDATE AKA. MODIFY INFORMATION IN THE TABLE

UPDATE my_numbers 
SET n = n + 20;

SELECT *
FROM my_numbers;

# BECAUSE THERE IS NO WHERE CLAUSE THE UPDATE WILL APPLY TO ALL ROWS IN THE TABLE
# DELETE IS PRETTY DESTRUCTIVE
# ALWAYS START YOUR DELETE STATEMENT AS IF IT WERE A SELECT (since the syntax is similar)

DELETE FROM my_numbers 
WHERE n % 2 = 0;

# TO SEE RESULTS

SELECT *
FROM my_numbers
WHERE n % 2 = 0;

# -------- CREATING A TABLE FROM QUERY RESULTS------
CREATE TEMPORARY TABLE employees_with_departments AS
SELECT emp_no, first_name, last_name, dept_no, dept_name
FROM employees
JOIN dept_emp USING(emp_no)
JOIN departments USING(dept_no)
LIMIT 100;

# -----------Updating table structure--------
#ALTER TABLE
# IF WE WANTED TO DROP THE DEPT_NO
ALTER TABLE employees_with_departments DROP COLUMN dept_no;
# TO ADD A COLUMN USE ADD
ALTER TABLE employees_with_departments ADD email VARCHAR(100);
# AFTER ADDING A COLUMN THE NUMBERS WILL BE NULL, WE CAN POPULATE THAT COLUMN WITH DaTE BY RUNNING AN UPDATE:
UPDATE employees_with_departments
SET email = CONCAT(first_name, "@company.com");

# CREATING A TEMP TABLE FROM A QUERY
SELECT DATABASE();

CREATE TEMPORARY TABLE georgis AS
SELECT *
FROM employees.employees -- db_name.table_name
JOIN employees.salaries USING (emp_no)
WHERE first_name = "Georgi";

SELECT *
FROM georgis;


# ANOTHER WAY TO WRITE IT
USE employees;

CREATE TEMPORARY TABLE germain_1460.partos AS
SELECT *
FROM employees
JOIN salaries USING(emp_no)
WHERE first_name = "Parto";

-- FROM HERE, WE NEED TO DO db_name.table_name
SELECT * 
FROM germain_1460.partos;

# ALTER REMOVED emp_no
ALTER TABLE germain_1460.partos DROP column emp_no;

ALTER TABLE germain_1460.partos add email VARCHAR(200);

UPDATE germain_1460.partos SET email = concat(first_name, ".", last_name, "@company.com");

SELECT *
FROM germain_1460.partos;


USE germain_1460;
CREATE TEMPORARY TABLE numbers AS
SELECT *
FROM numbers.numbers;

-- SHOWS WHAT DATABASE IM USING
SELECT DATABASE();
SELECT * FROM numbers;

