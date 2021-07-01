# CASE STATEMENTS

# USE A CASE STATEMENT WHEN ...
# you have more than 2 optional values
# you need more flexibility in your conditional tests


# OPTION ONE FOR SYNTAX
SELECT CASE column_a
	WHEN condition_a THEN value_1
	WHEN condition_b THEN value_2
	ELSE value_3
	END AS new_column_name
FROM table_a;

USE emoployees;

SELECT dept_name,
	CASE dept_name
		WHEN "research" THEN "development"
		WHEN "marketing" THEN "Sales"
		ELSE dept_name
		END AS dept_group
FROM employees.departments;


#OPTION 2 FOR SYNTAX

SELECT CASE
	WHEN column_a > condition_1 THEN value_1
	WHEN column_b <= condition_2 THEN value_2
	ELSE value_3
	END AS new_column_name
FROM table_a;

SELECT dept_name,
	CASE
		WHEN dept_name IN ("research","development") THEN "R&D"
		WHEN dept_name IN ("sales","marketing") THEN "Sales & Marketing"
		WHEN dept_name IN ("production","quality management") THEN "Prod & QM"
		ELSE dept_name
		END AS dept_group
FROM employees.departments;


#USING THE IF() FUNCTION

SELECT IF(column_a = condition_1, value_1, value_2) AS new_column
FROM table_a;


SELECT dept_name,
	IF(dept_name = "research", true, false) AS is_research
FROM employees.departments;


# SUMMARY

# 1. CASE column_a WHEN condition THEN value_1 ELSE value_2

SELECT dept_name,
	CASE dept_name
		WHEN 'Research' THEN 1
		ELSE 0
		END AS is_research
FROM employees.departments;


# 2. CASE WHEN column_a = condition THEN value_1 ELSE value_2

SELECT dept_name,
	IF(dept_name = 'research', true,false) AS is_research
FROM employees.departments;

# 3. column_a = condition

SELECT dept_name, dept_name = 'Research' AS is_research
FROM employees.departments;

# 4. IF(column_a = condition, value_1, value_2)

SELECT dept_name, IF(dept_name = "Research", true, false) AS is_research
FROM employees.departments;


