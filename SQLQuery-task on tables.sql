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
/* show employees table by (EXEC show_emp)*/
CREATE PROCEDURE show_emp
AS
BEGIN
SELECT * FROM employeess
END

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
SELECT DISTINCT job_name, dep_id FROM employeess 

/* Write a SQL query to find those employees who do not belong to the department 2001. Return complete information about the employees. */
SELECT * FROM employeess
WHERE dep_id<>2001

/* Write a SQL query to find those employees who joined before 1991. Return complete information about the employees */
SELECT * FROM employeess
WHERE hire_date < ('1991')

/* Write a SQL query to calculate the average salary of employees who work as analysts. Return average salary.*/
SELECT avg(salary) FROM employeess
WHERE job_name LIKE 'ANALYST'

/*  Write a SQL query to find the details of the employees who's name start start with B or end with E */
SELECT * FROM employeess
WHERE emp_name LIKE 'b%'
OR emp_name LIKE '%e'

/*  Write a SQL query to find the details of the employees who's department name start start with B or end with E*/
SELECT E.*, D.dep_name 
FROM employeess E , departments D
WHERE dep_name LIKE 'b%'
OR dep_name LIKE '%e'

/*Write a SQL query to find the details of the employees who's department location start start with F or end with N*/
SELECT E.* , D.dep_location
FROM employeess E, departments D
WHERE dep_location LIKE 'f%'
OR dep_location LIKE '%n'

/*  Write a SQL query to identify employees whose commissions exceed their salaries. Return complete information about the employees, department location and department name */
SELECT E.* , D.dep_location , D.dep_name
FROM employeess E, departments D
WHERE commission > salary

/* Write a SQL query to identify those employees whose salaries exceed 3000 after receiving a 25% salary increase */
SELECT emp_id , emp_name , ((salary*0.25) + salary)
FROM employeess
WHERE salary > 3000

/* Write a SQL query to find out which employees joined in the month of January. Return complete information about the employees.*/
SELECT * , FORMAT(hire_date, 'MMMM')AS 'MONTH_Hire' FROM employeess
WHERE FORMAT(hire_date, 'MMMM') like 'January'
 
/* Write a SQL query to separate the names of employees and their managers by the string 'works for'.*/
SELECT CONCAT(emp_name , ' works for' , manager_id)
FROM employeess 

/* Write a SQL query to find those employees whose designation is ‘CLERK’. Return complete information about the employees.*/
SELECT * FROM employeess 
WHERE job_name LIKE 'CLERK'

/* Write a SQL query to identify employees with more than 27 years of experience. Return complete information about the employees.*/
SELECT *
FROM employeess
WHERE DATEDIFF(YEAR, hire_date, GETDATE()) >= 27;

/*  Write a SQL query to find those employees whose salaries are less than 3500. Return complete information about the employees.*/
SELECT * FROM employeess
WHERE salary < 3500

/* Write a SQL query to find the employee whose designation is ‘ANALYST’. Return employee name, job name and salary.*/
SELECT emp_name , job_name , salary 
FROM employeess
WHERE job_name LIKE 'ANALYST'

/* Write a SQL query to identify those employees who joined the company in 1991. Return complete information about the employees.*/
SELECT * FROM employeess
WHERE FORMAT(hire_date,'yyyy') = 1991
/*OR*/
SELECT * FROM employeess
WHERE YEAR(hire_date) = 1991

/* Write a SQL query to identify those employees who joined the company after 1991. Return complete information about the employees.*/
SELECT * FROM employeess
WHERE FORMAT(hire_date,'yyyy') > 1991
/*OR*/
SELECT * FROM employeess
WHERE YEAR(hire_date) > 1991

/* Write a SQL query to find those employees who joined before 1st April 1991. Return employee ID, employee name, hire date and salary.*/
SELECT emp_id, emp_name, hire_date, salary
FROM employeess
WHERE hire_date < '1991-04-01';

/* Write a SQL query identify the employees who do not report to a manager. Return employee name, job name.*/
SELECT emp_name , job_name 
FROM employeess
WHERE manager_id IS NULL

/* Write a SQL query to find the employees who joined on the 1st of May 1991. Return complete information about the employees.*/
SELECT * FROM employeess
WHERE hire_date = '1991-5-1'

/*Write a SQL query to identify the experience of the employees who work under the manager whose ID number is 68319. Return employee ID, employee name, salary, experience*/
SELECT emp_id , emp_name , salary ,  year (getdate())- year (hire_date) as experience
FROM employeess
WHERE emp_id = 68319
/*OR*/
SELECT emp_id , emp_name , salary , DATEDIFF(YEAR, hire_date, GETDATE()) AS experience
FROM employeess
WHERE emp_id = 68319

/*  Write a SQL query to find out which employees earn more than 100 per day as a salary. Return employee ID, employee name, salary, and experience.*/
SELECT emp_id , emp_name , salary , DATEDIFF(YEAR, hire_date, GETDATE()) AS experience , (salary/30) as salary_per_day
FROM employeess
WHERE (salary/30) > 100

/* Write a SQL query to identify those employees who retired after 31-Dec-99, completing eight years of service. Return employee name. */
SELECT emp_name FROM employeess
WHERE DATEADD(year, 8, hire_date) <= '1999-12-31'

/* Write a SQL query to identify the employees whose salaries are odd. Return complete information about the employee */
SELECT * FROM employeess
WHERE (salary % 2) = 1 

/* Write a SQL query to identify employees whose salaries contain only three digits. Return complete information about the employees.*/
SELECT * FROM employeess
WHERE salary between 100 AND 999

/* Write a SQL query to find those employees who joined in the month of APRIL. Return complete information about the employees*/
SELECT * FROM employeess
WHERE MONTH (hire_date) = 4

/*  Write a SQL query to find out which employees joined the company before the 19th of the month. Return complete information about the employees*/
SELECT * FROM employeess
WHERE DAY(hire_date) < 19

/* Write a SQL query to identify those employees who have been working as a SALESMAN and month portion of the experience is more than 10. Return complete information about the employees. */
SELECT * FROM employeess
WHERE job_name like 'SALESMAN'
AND DATEDIFF( MONTH , hire_date , GETDATE())/2 > 10

/* Write a SQL query to find those employees of department id 3001 or 1001 and joined in the year 1991. Return complete information about the employees.*/
SELECT * FROM employeess
WHERE dep_id = 3001 OR dep_id =1001

/*  Write a SQL query to find the employees who are working for the department ID 1001 or 2001. Return complete information about the employees.*/
SELECT * FROM employeess
WHERE dep_id = 1001 OR dep_id =2001

/* Write a SQL query to find those employees whose designation is ‘CLERK’ and work in the department ID 2001. Return complete information about the employees.*/
SELECT * FROM employeess
WHERE job_name LIKE 'CLERK'
AND dep_id = 2001

/* Write a SQL query to find those employees who are either CLERK or MANAGER. Return complete information about the employees.*/
SELECT * FROM employeess
WHERE job_name IN ('CLERK' ,'MANAGER')

/* Write a SQL query to identify those employees who joined in any month other than February. Return complete information about the employees.*/
SELECT * FROM employeess
WHERE MONTH(hire_date) <> 1

/* Write a SQL query to identify the employees who joined the company in June 1991. Return complete information about the employees. */
SELECT * FROM employeess 
WHERE hire_date BETWEEN '1991-06-01' AND '1991-06-30';
/*OR*/
SELECT * FROM employeess
WHERE hire_date LIKE '1991-06-%';

/* Write a SQL query to search for all employees with an annual salary between 24000 and 50000 (Begin and end values are included.). Return complete information about the employees.*/
SELECT * , (salary*12)AS annual_salary FROM employeess 
WHERE (salary*12) BETWEEN 24000 AND 50000

/*  Write a SQL query to identify all employees who joined the company on 1st May, 20th February, and 3rd December 1991. Return complete information about the employees.*/
SELECT * FROM employeess 
WHERE hire_date like '%____-05-01' OR hire_date like '%____-02-20' OR hire_date like '1991-12-03'

/* 98-Write a SQL query to identify departments with fewer than four employees. Return department ID, number of employees.*/

SELECT d.dep_id, COUNT(e.emp_id) AS num_employees
FROM departments d
LEFT JOIN employeess e ON d.dep_id = e.dep_id
GROUP BY d.dep_id
HAVING COUNT(e.emp_id) < 4;

/*  Write a SQL query to find out which employees are working under the managers 63679, 68319, 66564, or 69000. Return complete information about the employees.*/
SELECT * FROM employeess
WHERE manager_id IN (63679, 68319, 66564, 69000)

/* Write a SQL query to find those employees who joined in 90's. Return complete information about the employees.*/
SELECT * FROM employeess
WHERE hire_date LIKE '199%'

/* Write a SQL query to find those managers who are in the department 1001 or 2001. Return complete information about the employees.*/
SELECT * FROM employeess
WHERE job_name = 'MANAGER'
AND dep_id IN (1001 , 2001)

/* Write a SQL query to identify employees who joined in the month of FEBRUARY with a salary range of 1001 to 2000 (Begin and end values are included.). Return complete information about the employees.*/
SELECT * FROM employeess
WHERE MONTH(hire_date) = 2
AND salary BETWEEN 1000 AND 2001

/* Write a SQL query to find those employees who joined before or after the year 1991. Return complete information about the employees.*/
SELECT * FROM employeess
WHERE YEAR(hire_date) <> 1991

/* Write a SQL query to find employees along with their department details. Return employee ID, employee name, job name, manager ID, hire date, salary, commission, department ID, and department name.*/
SELECT E.* , departments.dep_name
FROM employeess E 
INNER JOIN departments on E.dep_id = departments.dep_id

/* Write a SQL query to identify those employees who earn 60000 or more per year or do not work as ANALYST. Return employee name, job name, (12*salary) as Annual Salary, department ID, and grade.*/
SELECT E.emp_name, E.job_name, E.salary*12 AS Annual_salary, E.dep_id, D.dep_name, S.grade
FROM employeess E, departments D, salary_grade S
WHERE (E.dep_id = D.dep_id)  AND (E.salary*12 >= 60000 OR job_name <> 'ANALYST')
AND (E.salary BETWEEN S.min_salary AND S.max_salary)

/* Write a SQL query to identify employees whose salaries are higher than their managers' salaries. Return employee name, job name, manager ID, salary, manager name, manager's salary*/
SELECT E.emp_name , E.job_name , E.manager_id , E.salary , M.emp_name as manager_name, M.salary AS manager_salary
FROM employeess E
INNER JOIN employeess M 
on E.manager_id = M.emp_id 
WHERE e.salary > m.salary;

/* Write a SQL query to find those employees whose salary is between 2000 and 5000 (Begin and end values are included.) and location is PERTH. Return employee name, department ID, salary, and commission*/
SELECT E.emp_name , E.dep_id , E.salary , E.commission , D.dep_location
FROM employeess E
INNER JOIN departments D
on D.dep_id = E.dep_id
WHERE D.dep_location LIKE 'PERTH'

/* Write a SQL query to find the employees whose department ID is 1001 or 3001 and whose salary grade is not 4. They joined the company before 1992-12-31. Return grade, employee name.*/

SELECT E.emp_name, S.grade
FROM employeess E
JOIN salary_grade S ON E.salary BETWEEN S.min_salary AND S.max_salary
WHERE E.dep_id IN (1001, 3001)
AND S.grade <> 4
AND E.hire_date < '1992-12-31'

/*to show employeess table*/
EXEC show_emp

/* Write a SQL query to find those employees whose manager name is JONAS. Return employee id, employee name, job name, manager ID, hire date, salary, department ID, employee name.*/
SELECT E.emp_id ,E.emp_name,E.job_name,E.manager_id,E.hire_date,E.salary,E.dep_id, M.emp_id AS manager_id, M.emp_name AS manager_name
FROM employeess E
LEFT JOIN employeess M ON E.manager_id = M.emp_id
WHERE M.emp_name LIKE 'JONAS'

/* Write a SQL query to find the name and salary of the employee FRANK. Salary should be equal to the maximum salary within his or her salary group.*/
SELECT E.emp_name , E.salary , s.grade
FROM employeess E
RIGHT JOIN salary_grade S ON E.salary BETWEEN S.min_salary AND S.max_salary
WHERE E.salary = S.max_salary
And emp_name LIKE 'FRANK'
/*OR*/
SELECT emp_name, MAX(s.max_salary) AS max_salary
FROM employeess e
JOIN salary_grade s ON e.salary BETWEEN s.max_salary AND s.max_salary
WHERE emp_name = 'FRANK'
GROUP BY emp_name;
/*  Write a SQL query to search for employees who are working either as a MANAGER or an ANALYST with a salary between 2000 and 5000 (Begin and end values are included.) 
without commissions. Return complete information about the employees.*/
SELECT * FROM employeess
WHERE job_name IN ('MANAGER', 'ANALYST')
AND salary BETWEEN 2000 AND 5000
AND commission IS NULL;

/* From the following table, write a SQL query to find the employees who joined in 1991 and whose department location is SYDNEY or MELBOURNE with a salary range of 2000 to 5000.
Return employee ID, employee name, department ID, salary, and department location.*/
SELECT E.emp_id, e.emp_name ,e.dep_id , e.salary , D.dep_location
FROM employeess E 
JOIN departments D ON D.dep_id = E.dep_id
WHERE YEAR(hire_date) = 1991
AND D.dep_location IN ('SYDNEY' , 'MELBOURNE')
AND salary BETWEEN 2000 AND 5000

/*  Write a SQL query to find the employees of MARKETING department come from MELBOURNE or PERTH, are in grades 3 ,4, and 5 and have at least 25 years of experience.
Return department ID, employee ID, employee name, salary, department name, department location and grade.*/
SELECT D.dep_id , e.emp_id , e.emp_name , e.salary , d.dep_name , d.dep_location , s.grade
FROM  employeess E 
LEFT JOIN departments D ON e.dep_id = D.dep_id 
LEFT JOIN salary_grade S ON E.salary BETWEEN S.min_salary and s.max_salary
WHERE dep_location IN ('MELBOURNE' , 'PERTH')
AND grade IN (3,4,5) 
AND DATEDIFF(YEAR , hire_date , GETDATE()) >= 25

/* Write a SQL query to find those employees who are senior to their manager. Return complete information about the employees.*/
SELECT e.emp_id, e.emp_name, e.job_name, e.manager_id, e.hire_date, e.salary, e.commission, e.dep_id
FROM employeess e
JOIN employeess m ON e.manager_id = m.emp_id
WHERE e.hire_date < m.hire_date

/*OR*/

SELECT E.* 
From employeess E
LEFT JOIN employeess M ON  m.emp_id = e.manager_id 
WHERE E.job_name = 'PRESIDENT' 
 
/* Write a SQL query to determine which employees have a grade of 4 and a salary between the minimum and maximum. Return all information of each employees and their grade and salary related details*/
SELECT e.* , s.grade
FROM employeess e
join salary_grade S ON e.salary BETWEEN s.min_salary AND s.max_salary
WHERE grade = 4

/* Write a SQL query to find those employees who joined after 1991, excluding MARKER or ADELYN in the departments PRODUCTION or AUDIT. Return employee name.*/
SELECT E.emp_name 
FROM employeess E
join departments D on D.dep_id = E.dep_id
WHERE E.hire_date > '1991-01-01' 
AND emp_name NOT IN ('MARKER', 'ADELYN') 
AND dep_name NOT IN ('PRODUCTION','AUDIT')

/* Write a SQL query to find the employees and their salaries. Sort the result-set in ascending order by salaries. Return complete information about the employees.*/
SELECT *
FROM employeess
ORDER BY salary ASC;

/* Write a SQL query to list employees in ascending order on department ID and descending order on jobs. Return complete information about the employees.*/
SELECT *
FROM employeess
ORDER BY dep_id ASC , job_name DESC

/* Write a SQL query to sort the unique jobs in descending order. Return job name.*/
SELECT DISTINCT job_name
FROM employeess
ORDER BY job_name DESC;

/* Write a SQL query to rank the employees according to their annual salary in ascending order. Return employee ID, employee name, monthly salary, salary/30 as Daily_Salary, and 12*salary as Anual_Salary.*/
SELECT e.emp_id, e.emp_name, e.salary, e.salary/30 as Daily_Salary, 12*salary as Anual_Salary
FROM employeess e
ORDER BY Anual_Salary ASC
/*OR*/
SELECT emp_id, emp_name, salary/12 AS monthly_salary, salary/30 AS daily_salary, salary*12 AS annual_salary,
RANK() OVER (ORDER BY salary*12 ASC) AS rank
FROM employeess

/* Write a SQL query to find those employees who are either 'CLERK' or 'ANALYST’. Sort the result set in descending order on job_name. Return complete information about the employees.*/
SELECT E.* 
FROM employeess E
WHERE job_name IN ('CLERK','ANALYST')
ORDER BY job_name DESC

/* Write a SQL query to find the department location of employee ‘CLARE’. Return department location.*/
SELECT dep_location
FROM employeess E
JOIN departments D ON D.dep_id = E.dep_id 
WHERE E.emp_name LIKE 'CLARE'

/* Write a SQL query to find those employees who joined on 1-MAY-91, or 3-DEC-91, or 19-JAN-90. Sort the result-set in ascending order by hire date. Return complete information about the employees.*/
SELECT E.* 
FROM employeess E
WHERE e.hire_date IN ('1-MAY-91' ,'3-DEC-91' , '19-JAN-90')
ORDER BY e.hire_date ASC;

/* Write a SQL query to find those employees who earn less than 1000. Sort the result-set in ascending order by salary. Return complete information about the employees.*/
SELECT E.* 
FROM employeess E
WHERE e.salary < 1000 
ORDER BY E.salary ASC

/* Write a SQL query to list the employees in ascending order based on salary. Return complete information about the employees.*/
SELECT E.* 
FROM employeess E
ORDER BY E.salary ASC

/* Write a SQL query to list the employees in the ascending order by job title and in descending order by employee ID. Return complete information about the employees.*/
SELECT E.* 
FROM employeess E
ORDER BY E.job_name ASC, E.emp_id DESC

/* Write a SQL query to list the unique jobs of department 2001 and 3001 in descending order. Return job name.*/
SELECT DISTINCT E.job_name
FROM employeess E 
JOIN departments D ON D.dep_id = E.dep_id
WHERE D.dep_id IN (2001 , 3001)
ORDER BY E.job_name DESC;

/* Write a SQL query to list all the employees except the PRESIDENT and the MANAGER in ascending order of salaries. Return complete information about the employees.*/
SELECT E.* 
FROM employeess E
WHERE job_name NOT IN ('PRESIDENT','MANAGER')
ORDER BY salary ASC

/* Write a SQL query to find the employees whose annual salary is less than $25,000 per year. Sort the result set in ascending order of the salary. Return complete information about the employees.*/
SELECT *, 12*salary as annual_salary
FROM employeess
WHERE 12*salary < 25000
ORDER BY salary ASC;

/* Write a SQL query to list the employees who works as a SALESMAN. Sort the result set in ascending order of annual salary. Return employee id, name, annual salary, daily salary of all the employees.*/
SELECT E.emp_id, E.emp_name , E.salary*12 AS annual_salary , E.salary/30 AS daily_salary
FROM employeess E
WHERE E.job_name LIKE 'SALESMAN'

/* Write a SQL query to list the employee ID, name, hire date, current date and experience of the employees in ascending order on their experiences.*/
SELECT E.emp_id , E.emp_name , E.hire_date , GETDATE() AS 'CURRENT_DATE' , DATEDIFF(YEAR ,hire_date,getdate()) AS experience
FROM employeess E
ORDER BY experience ASC

/* Write a SQL query to list the employees in ascending order of designations of those joined after the second half of 1991.*/
SELECT * FROM employeess
WHERE hire_date BETWEEN '1991-09-01' AND '1991-12-31'

/*Write a SQL query to find the location of all the employees working in the FINANCE or AUDIT department. Sort the result-set in ascending order by department ID. Return complete information about the employees.*/
SELECT E.* 
FROM employeess E
JOIN departments D ON D.dep_id= E.dep_id
WHERE D.dep_name IN ('FINANCE' ,'AUDIT')

/* Write a SQL query to find the employees along with grades in ascending order. Return complete information about the employees.*/
SELECT E.* , grade
FROM employeess E
JOIN salary_grade S ON E.salary BETWEEN S.min_salary AND S.max_salary
ORDER BY grade

/* Write a SQL query to find the employees according to the department in ascending order. Return name, job name, department, salary, and grade.*/
SELECT E.emp_name , E.job_name , D.dep_name , E.salary , grade
FROM employeess E
JOIN departments D ON D.dep_id = E.dep_id
JOIN salary_grade S ON E.salary BETWEEN S.min_salary AND S.max_salary
ORDER BY dep_name ASC

/* Write a SQL query to select all employees except CLERK and sort the results in descending order by salary. Return employee name, job name, salary, grade and department name.*/
SELECT E.emp_name , e.job_name , e.salary , grade , dep_name
FROM employeess E
JOIN salary_grade S ON E.salary BETWEEN S.min_salary AND S.max_salary
JOIN departments D ON D.dep_id = E.dep_id
WHERE job_name NOT IN ('CLERK') 

/* Write a SQL query to find those employees who work in the department 1001 or 2001. Return employee ID, name, salary, department, grade, experience, and annual salary.*/
SELECT E.emp_id, E.emp_name , e.salary , dep_name , grade ,DATEDIFF(YEAR, hire_date, GETDATE())as experience , salary*12 AS annual_salary
FROM employeess E
JOIN salary_grade S ON E.salary BETWEEN S.min_salary AND S.max_salary
JOIN departments D ON D.dep_id = E.dep_id
WHERE D.dep_id IN (1001 , 2001)

/* Write a SQL query to list the details of the employees along with the details of their departments.*/
SELECT E.emp_name , D.*
FROM employeess E
JOIN departments D ON D.dep_id = E.dep_id

/*85- Write a SQL query to list the employees who are senior to their MANAGERS. Return complete information about the employees.*/



/* Write a SQL query to find those employees who work in the department 1001. Sort the result-set in ascending order by salary. Return employee ID, employee name, salary and department ID.*/
SELECT E.emp_id , E.emp_name , E.salary , E.dep_id
FROM employeess E
WHERE dep_id = 1001

/* Write a SQL query to find the second highest salary. Return second highest salary.*/
SELECT salary 
FROM (
  SELECT DISTINCT salary, RANK() OVER (ORDER BY salary DESC) AS salary_rank
  FROM employeess
) AS ranked_employees
WHERE salary_rank = 2
/*google answer*/
SELECT MAX(salary) AS second_highest_salary
FROM employeess
WHERE salary < (SELECT MAX(salary) FROM employeess)
/*google answer*/
SELECT TOP 1 Salary
FROM (
  SELECT DISTINCT TOP 2 Salary
  FROM EmployeesS
  ORDER BY Salary DESC
) AS second_highest_salary
ORDER BY Salary ASC;
/*google answer*/
SELECT salary 
FROM employeess
ORDER BY salary DESC
OFFSET 1 ROW
FETCH NEXT 1 ROW ONLY

/* Write a SQL query to calculate the average salary and average total remuneration (salary and commission) for each type of job. Return name, average salary and average total remuneration.*/
SELECT job_name,
       avg(salary),
       avg(salary+commission)
FROM employeess
GROUP BY job_name;
/*correct answer*/
SELECT job_name, 
       AVG(salary) AS avg_salary, 
       AVG(salary + COALESCE(commission,0)) AS avg_total_remuneration
FROM employeess
GROUP BY job_name;

/* Write a SQL query to calculate the total annual salary distributed across each job in 1991. Return job name, total annual salary.*/

SELECT job_name, sum(12*salary)
FROM employeess
WHERE year(hire_date) = '1991'
GROUP BY job_name;

/* Write a SQL query to list the employee id, name, department id, location of all the employees.*/
SELECT E.emp_id, e.emp_id , e.dep_id , d.dep_location
FROM employeess E
join departments D ON D.dep_id = E.dep_id

/* Write a SQL query to find those employees who work in the department ID 1001 or 2001. Return employee ID, employee name, department ID, department location, and department name.*/
SELECT E.emp_id, e.emp_name , e.dep_id , d.dep_location , d.dep_name
FROM employeess E
join departments D ON D.dep_id = E.dep_id
WHERE e.dep_id IN ('1001','2001')

/* Write a SQL query to find those employees whose salary is in the range of minimum and maximum salary. Return employee ID, name, salary and grade.*/
SELECT e.emp_id, e.emp_name, e.salary, s.grade
FROM employeess E, salary_grade S
WHERE e.salary BETWEEN S.min_salary AND S.max_salary ;

/* Write a SQL query to create a list of the managers and the number of employees they supervise. Sort the result set in ascending order on manager. Return manager ID and number of employees under them.*/

SELECT M.emp_id , COUNT(*) AS num_employees
FROM employeess E
JOIN employeess M ON M.emp_id = E.manager_id
WHERE M.job_name = 'MANAGER'
GROUP BY M.emp_id
ORDER BY M.emp_id ASC

/* Write a SQL query to count the number of employees in each designation of a department. Return department id, job name and number of employees.*/

/**/
/**/
/**/
/**/
exec show_emp
/**/

SELECT COUNT(emp_id)
from employeess



