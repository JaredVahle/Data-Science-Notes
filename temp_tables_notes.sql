

# ------ TEMPORARY TABLES NOTES --------

CREATE TEMPORARY TABLE table_name(...);

# --- TEMPORARY TABLES CAN BE REMOVED WITH THE (DROP TABLE STATEMENT)
DROP TABLE;

#-- QUERY TO CREATE A TEMP TABLE

CREATE TEMPORARY TABLE my_numbers(
	n INT UNSIGNED NOT NULL
);

# NOW WE WILL INSERT SOME DATA INTO IT.

INSERT INTO my_numbers(n) 
VALUES (1), (2), (3), (4), (5);

# LET's TAKE A LOOK AT WHAT OUR TABLE LOOKS LIKE:

SELECT *
FROM my_numbers;

# UPDATE AKA. MODIFY INFORMATION IN THE TABLE

UPDATE my_numbers 
SET n = n + 1;

# BECAUSE THERE IS NO WHERE CLAUSE THE UPDATE WILL APPLY TO ALL ROWS IN THE TABLE

DELETE FROM my_numbers 
WHERE n % 2 = 0

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
