# IN operator
USE employees;
SELECT *
FROM employees
WHERE first_name IN ("Vidya","Irena","Maya");

# emp_no of everyone making more then avg salary

SELECT emp_no
FROM salaries
WHERE salary > (SELECT AVG(salary) FROM salaries); # 63810.7448

SELECT *
FROM employees
WHERE emp_no IN (SELECT emp_no
FROM salaries
WHERE salary > (SELECT AVG(salary)FROM salaries));

# Select TableA columns
# From table A
# Where table A. column_of_intrest in (
# 	SELECT tableB.column_of_intrest
# 	FROM tableb...
#)

# Get the name of all the current managers
SELECT first_name, last_name
FROM employees AS e
WHERE emp_no IN (
	 SELECT emp_no
	FROM dept_manager
	WHERE to_date > now()
);

# All the names of employees with the title engineers

SELECT *
FROM employees
WHERE emp_no IN (
	SELECT emp_no
	FROM titles
	WHERE title = "Engineer"
	AND emp_no IN (
		SELECT emp_no
		FROM employees
		WHERE hire_date LIKE "%-12-25" #engineers hired on christmas
	)
);


SELECT current_salary.salary
FROM (
	SELECT *
	FROM salaries
	WHERE to_date > now()
) AS current_salary;

SELECT *
FROM (
	SELECT *
	FROM salaries
	WHERE to_date > now()
) AS current_salary
JOIN employees USING (emp_no);

SELECT (select max(salary) FROM salaries) AS max, min(salary) AS min
FROM salaries
WHERE to_date > now();
