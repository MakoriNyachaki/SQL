use human_resource;

-- AND --
-- Select all employees with job 9 and salary is more than 3000

SELECT * FROM employees e 
WHERE 
job_id = 9 AND salary > 3000;

-- find all employees who joined the company between 1995 and 1999

SELECT employee_id, first_name, last_name, hire_date
FROM employees e 
WHERE YEAR(e.hire_date) >= 1995 AND YEAR(hire_date) <= 1999;

-- OR Operator

-- Employees who joine the company in 1998 or 1999
SELECT employee_id, first_name, last_name, hire_date
FROM employees e 
WHERE 
YEAR(hire_date) = 1998 OR YEAR(hire_date) = 1999
ORDER BY hire_date ASC;

-- Employees who joined in the year 1998 or 1999 and worked in the department with id 3. Gist: Use both OR and AND

SELECT employee_id, first_name, last_name, hire_date, department_id
FROM employees e 
WHERE
(YEAR(hire_date) = 1998 OR YEAR(hire_date) = 1999) AND department_id = 3;


-- employees who joined the company i 1990 or 1995 or 2000

SELECT employee_id, first_name, last_name, hire_date 
FROM employees e 
WHERE 
YEAR(hire_date) = 1990
OR YEAR(hire_date) = 1995
OR YEAR(hire_date) = 2000
ORDER BY hire_date;

-- Replacing OR operator with  the IN operator in theabove query
SELECT employee_id, first_name, last_name, hire_date
FROM employees e 
WHERE 
YEAR(hire_date) IN(1990,1995, 2000)
ORDER BY hire_date;

-- BETWEEN

-- finding employees whose salary is between 2000 and 3500
SELECT employee_id, first_name, last_name, salary
FROM employees e 
WHERE salary
BETWEEN 2000 AND 3500
ORDER BY last_name, first_name ASC;

-- count the number of employeees whose salary is between 2000 and 3500. Replacing BETWEEN with AND
SELECT COUNT(*) as salary_between_2k_and_3k
FROM employees e 
WHERE salary >= 2000 AND salary <= 3500;

-- using NOT BETWEEN. Employees whose salary not within the range 2000 and 3500

SELECT employee_id, first_name, last_name, salary
FROM employees e 
WHERE salary NOT BETWEEN 2000 AND 3500
ORDER BY first_name;

-- employees who joined the company between 1990 and 1994
SELECT employee_id, first_name, last_name, YEAR(hire_date) joined_year
FROM employees e 
WHERE YEAR(hire_date) BETWEEN 1990 AND 1994
ORDER BY joined_year;

-- finding empoyees who joined the company between 1996/01/01 and 2002/12/31

SELECT employee_id, first_name, last_name, hire_date
FROM employees e 
WHERE hire_date BETWEEN '1996-01-01' AND '2002-12-31'
ORDER BY hire_date DESC;

-- IN OPERATOR --

-- Find all employees with the job id 6, 7, 8
SELECT first_name, last_name ,job_id
FROM employees e 
WHERE 
e.job_id IN(6,7,8)
ORDER BY job_id ASC;

-- employees whose job id is not 6, 7, 8
SELECT first_name, last_name, job_id 
FROM employees e 
WHERE job_id NOT IN(6, 7, 8)
ORDER BY job_id DESC;

-- find all employees who work in sales or marketing department

-- Achieved in two ways
-- first way; using a subquery to get the department id from the departments table
SELECT first_name, last_name, department_id 
FROM employees e 
WHERE department_id 
IN (SELECT department_id 
	FROM departments d 
	WHERE d.department_name = 'Marketing' OR d.department_name = 'Sales')
ORDER BY department_id DESC;

-- second way; find the employees using the department id where by the sales department has id 8 and marketing department has id 2

SELECT first_name, last_name, department_id 
FROM employees e 
WHERE department_id 
IN(2,8) 
ORDER BY department_id DESC;







