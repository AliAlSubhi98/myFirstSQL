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
/*TASK 1*/
/*group the yaer and month beside month sales*/
SELECT YEAR(sale_date) as SalesYear, month(sale_date) as SalesMonth, SUM(sale_amount) as TotalSales
FROM sales 
GROUP BY YEAR(sale_date), MONTH(sale_date)
ORDER BY YEAR(sale_date), MONTH(sale_date)

/*TASK 2*/
SELECT AVG(sale_amount)as sales_average
FROM sales

/*TASK 3*/
