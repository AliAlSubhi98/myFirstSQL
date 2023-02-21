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

INSERT INTO employeess (emp_id, emp_name , job_name , manager_id , hire_date , salary , commission ,dep_id  ) VALUES
(68319  , 'KAYLING' ,'PRESIDENT' ,NULL,'1991-11-18',6000.00 ,NULL,1001),
(66928  , 'BLAZE' ,'MANAGER' ,68319 ,'', ,NULL,),
(67832  , 'CLARE' ,'MANAGER' ,68319 ,'', ,NULL,),
(65646  , 'JONAS' ,'MANAGER' ,68319 ,'', ,NULL,),
(67858  , 'SCARLET' ,'ANALYST' ,65646 ,'', ,NULL,),
(69062  , 'FRANK' ,'ANALYST' ,65646 ,'', ,NULL,),
(63679  , 'SANDRINE' ,'CLERK' ,69062 ,'', ,NULL,),
(64989  , 'ADELYN' ,'SALESMAN' ,66928 ,'', ,NULL,),
(65271  , 'WADE' ,'SALESMAN' ,66928 ,'', ,NULL,),
(66564  , 'MADDEN' ,'SALESMAN' ,66928 ,'', ,NULL,),
(68454  , 'TUCKER' ,'SALESMAN' ,66928 ,'', ,NULL,),
(68736  , 'ADNRES' ,'CLERK' ,NULL,'', ,NULL,),
(69000  , 'JULIUS' ,'CLERK' ,NULL,'', ,NULL,),
(69324   , 'MARKER' ,'CLERK' ,NULL,'', ,NULL,);

