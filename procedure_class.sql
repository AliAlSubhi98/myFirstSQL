/* @ age     to decalre variable */
declare @ age int

set @ age = 27;  /* prefer to use this */
/* or */
select @ age = 27 ; 


/* create procedure */
create procedure dapartments1_insert
(
	@deptid int,
	@dept_name varchar,
	@HOD varchar
)
AS 
begin
	insert into department (dept_id , DEPT_NAME , HOD)
		values (@deptid , @dept_name , @HOD)
		PRINT ('record saved succesfully')
end

EXEC dapartments1_insert 1, 'IT' , 'Fatma'


-- update _ update into department ....
-- delete _ delete into department .....

-- DDL data definition language --->  CREATE , ALTER
-- DML date manipulation language ---> INSERT , UPDATE , DELETE , SELECT 

-- TCL Transaction Control Language ---> COMMIT , ROLLBACK , SAVEPOINT 

/*There are many useful features in SQL Server, but some of the most commonly used ones are:

Stored Procedures: A stored procedure is a set of SQL statements that are stored in the database and can be executed repeatedly.
They can be used to simplify complex queries and improve performance.

Views: A view is a virtual table that is based on the result of a SQL query.
They can be used to simplify complex queries and make it easier to manage large amounts of data.

Indexes: An index is a data structure that is used to improve the performance of queries by allowing them to quickly locate the data they need.

Triggers: A trigger is a set of SQL statements that are automatically executed in response to a specific event, such as an INSERT, UPDATE, or DELETE operation.

Transactions: A transaction is a set of SQL statements that are executed as a single unit of work.
They ensure that either all the statements are executed successfully, or none of them are executed at all, helping to maintain the integrity of the data.

Backup and Restore: SQL Server provides tools for backing up and restoring data, which are essential for protecting against data loss and recovering from disasters.

Security: SQL Server includes a robust security system that allows you to control access to the data in your database.
You can specify who can access the database, what they can do with the data, and when they can access it.*/