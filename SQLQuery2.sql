CREATE TABLE sales (
  sale_id INT PRIMARY KEY,
  sale_date DATE,
  sale_amount DECIMAL(10,2)
);
INSERT INTO sales ( sale_id,sale_date, sale_amount)
VALUES
  (1,'2022-01-01', 100.00),
  (2,'2022-01-02', 50.00),
  (3,'2022-01-15', 75.00),
  (4,'2022-02-01', 200.00),
  (5,'2022-02-05', 150.00),
  (6,'2022-02-20', 175.00);

  SELECT * FROM sales

SELECT month(sale_date) as SalesMonth, SUM(sale_amount) as TotalSales
FROM sales 
GROUP BY  MONTH(sale_date)
/*TASK 1. Write a SQL query that calculates the total sales for each month in the sales table.*/
/*group the yaer and month beside month sales*/
SELECT YEAR(sale_date) as SalesYear, month(sale_date) as SalesMonth, SUM(sale_amount) as TotalSales
FROM sales 
GROUP BY YEAR(sale_date), MONTH(sale_date)
ORDER BY YEAR(sale_date), MONTH(sale_date)

/*TASK 2. Write a SQL query that calculates the average of sales amount.
*/
SELECT AVG(sale_amount)as sales_average
FROM sales

/*TASK 3. Write a SQL query that counts how many products sold availabe in the table.
*/
SELECT COUNT(sale_amount) from sales

/*TASK 4. Write a SQL query that shows the minimum and maximum sale amount in the table name it as 'lowest amount' , 'higest amount'.
*/
SELECT MIN(sale_amount)as 'lowest amount', MAX(sale_amount) as 'higest amount' FROM sales
 
 /*TASK 5. Write a SQL query that organize the data in decending order using the id.
*/
SELECT * FROM sales
ORDER BY sale_id DESC

/*TASK6. Write a SQL query that shows the sales between 01-01-2022 and 01-02-2022.
*/
SELECT * FROM SALES 
WHERE sale_date BETWEEN '2022-01-01' AND '2022-02-01'