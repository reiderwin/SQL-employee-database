SELECT * FROM "Departments";
SELECT * FROM "Dept_Emp";
SELECT * FROM "Dept_Manager";
SELECT * FROM "Employees";
SELECT * FROM "Salaries";
SELECT * FROM "Titles";

-- List details of each employee:  employee number, last name, first name, sex, and salary.

CREATE VIEW question_1 AS
SELECT e.emp_no, e.last_name, e.first_name, e.sex, s.salary
FROM "Employees" e
JOIN "Salaries" s
ON (e.emp_no = s.emp_no);
SELECT * FROM question_1;

-- List first name, last name, and hire date for employees who were hired in 1986.

CREATE VIEW question_2 AS
SELECT first_name, last_name, hire_date
FROM "Employees"
WHERE hire_date >= '1986-01-01' AND hire_date < '1987-01-01';

-- List the manager of each department with the following information: department number, department name, 
-- the manager's employee number, last name, and first name.

CREATE VIEW question_3 AS
SELECT "Employees".emp_no, "Employees".first_name, "Employees".last_name, "Dept_Manager".dept_no, "Departments".dept_name
FROM "Employees"
JOIN "Dept_Manager"
ON "Employees".emp_no = "Dept_Manager".emp_no
JOIN "Departments"
ON "Departments".dept_no = "Dept_Manager".dept_no;

-- List the department of each employee with the following information: employee number, last name, first name, and department name.


CREATE VIEW question_4 AS
SELECT "Employees".emp_no, "Employees".first_name, "Employees".last_name, "Departments".dept_name
FROM "Employees"
JOIN "Dept_Emp"
ON "Employees".emp_no = "Dept_Emp".emp_no
JOIN "Departments"
ON "Departments".dept_no = "Dept_Emp".dept_no;
SELECT * FROM question_4;

-- List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."

CREATE VIEW question_5 AS
SELECT first_name, last_name, sex
FROM "Employees"
WHERE first_name = 'Hercules' AND last_name LIKE 'B%'
SELECT * FROM question_5;

-- List all employees in the Sales department, including their employee number, last name, first name, and department name

CREATE VIEW question_6 AS
SELECT "Employees".emp_no, "Employees".first_name, "Employees".last_name, "Departments".dept_name
FROM "Employees"
JOIN "Dept_Emp"
ON "Employees".emp_no = "Dept_Emp".emp_no
JOIN "Departments"
ON "Departments".dept_no = "Dept_Emp".dept_no
WHERE "Departments".dept_name = 'Sales';
SELECT * FROM question_6;

-- List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.

CREATE VIEW question_7 AS
SELECT "Employees".emp_no, "Employees".first_name, "Employees".last_name, "Departments".dept_name
FROM "Employees"
JOIN "Dept_Emp"
ON "Employees".emp_no = "Dept_Emp".emp_no
JOIN "Departments"
ON "Departments".dept_no = "Dept_Emp".dept_no
WHERE ("Departments".dept_name = 'Sales' OR "Departments".dept_name = 'Development');
SELECT * FROM question_7;

-- In descending order, list the frequency count of employee last names, i.e., how many employees share each last name

CREATE VIEW question_8 AS
SELECT "Employees".last_name, COUNT(last_name) AS "Total_Count"
FROM "Employees"
GROUP BY last_name
ORDER BY "Total_Count" DESC;
SELECT * FROM question_8;

-- Epilogue.  Search ID# 499942.  April Fools Hahahahahah

CREATE VIEW question_epilogue AS
SELECT e.emp_no, e.last_name, e.first_name, e.sex, s.salary
FROM "Employees" e
JOIN "Salaries" s
ON (e.emp_no = s.emp_no)
WHERE e.emp_no = 499942;
SELECT * FROM question_epilogue;
