CREATE TABLE departments(
	dep_id INTEGER PRIMARY KEY,
	dep_name VARCHAR(20) NOT NULL,
	dep_location VARCHAR(15) NOT NULL
);
CREATE TABLE salary_grade(
	grade INTEGER,
	min_salary INTEGER,
	max_salary INTEGER
);
CREATE TABLE employeess(
emp_id INTEGER,
emp_name VARCHAR(15),
job_name VARCHAR(10),
manager_id INTEGER,
hire_date DATE,
salary DECIMAL(10, 2),
commission DECIMAL(7,2),
dep_id int
FOREIGN KEY (dep_id) REFERENCES departments(dep_id)
);


INSERT INTO departments (dep_id , dep_name , dep_location) VALUES
(1001,'FINANCE','SYDNEY'),
(2001,'AUDIT','MELBOURNE'),
(3001,'MARKETING','PERTH'),
(4001,'PRODUCTION','BRISBANE');



INSERT INTO employeess (emp_id, emp_name , job_name , manager_id , hire_date , salary , commission ,dep_id  ) VALUES
(68319  , 'KAYLING' ,'PRESIDENT' ,NULL,'1991-11-18',6000.00 ,NULL,1001),
(66928  , 'BLAZE' ,'MANAGER' ,68319 ,'1991-05-01',2750.00  ,NULL,3001),
(67832  , 'CLARE' ,'MANAGER' ,68319 ,'1991-06-09',2550.00 ,NULL,1001),
(65646  , 'JONAS' ,'MANAGER' ,68319 ,'1991-04-02',2957.00 ,NULL,2001),
(67858  , 'SCARLET' ,'ANALYST' ,65646 ,'1997-04-19',3100.00 ,NULL,2001),
(69062  , 'FRANK' ,'ANALYST' ,65646 ,'1991-12-03',3100.00 ,NULL,2001),
(63679  , 'SANDRINE' ,'CLERK' ,69062 ,'1990-12-18', 900.00,NULL,2001),
(64989  , 'ADELYN' ,'SALESMAN' ,66928 ,'1991-02-20',1700.00 ,400.00,3001),
(65271  , 'WADE' ,'SALESMAN' ,66928 ,'1991-02-22', 1350.00,600.00,3001),
(66564  , 'MADDEN' ,'SALESMAN' ,66928 ,'1991-09-28',1350.00 ,1500.00,3001),
(68454  , 'TUCKER' ,'SALESMAN' ,66928 ,'1991-09-08',1600.00 ,0.00,3001),
(68736  , 'ADNRES' ,'CLERK' ,67858 ,'1997-05-23',1200.00 ,NULL,2001),
(69000  , 'JULIUS' ,'CLERK' ,66928 ,'1991-12-03',1050.00 ,NULL,3001),
(69324   , 'MARKER' ,'CLERK' ,67832,'1992-01-23', 1400.00,NULL,1001);


INSERT INTO salary_grade VALUES
(1,800,1300),
(2,1301,1500),
(3,1501,2100),
(4,2101,3100),
(5,3101,9999);

/* Return complete information about the employees */
SELECT * FROM employeess

/* Write a SQL query to find the salaries of all employees. Return salary.*/
SELECT emp_name, salary FROM employeess

/*  Write a SQL query to find the unique designations of the employees. Return job name.*/
SELECT DISTINCT job_name FROM employeess

/*  Write a SQL query to list the employees’ name, increased their salary by 15% */
SELECT emp_name ,(salary*0.15 + salary)
FROM employeess

/* Write a SQL query to list the employee's name and job name as a format of "Employee & Job" */
SELECT emp_name+' & '+job_name AS "Employee & Job" FROM employeess
/*  Write a SQL query to find those employees with hire date in the format like February 22, 1991. Return employee ID, employee name, salary, hire date.*/
SELECT emp_id, emp_name, salary, FORMAT(hire_date, 'MMMM dd, yyyy') AS hire_date_formatted
FROM employeess
WHERE hire_date BETWEEN '1991-01-01' AND '1991-12-31';

/* Write a SQL query to count the number of employees who have total income more than 2200 */
SELECT COUNT(emp_name) FROM employeess
WHERE salary > 2200

/* Write a SQL query to find the unique jobs with their corresponding department id. */