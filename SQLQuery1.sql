CREATE TABLE Employees (
	id int NOT NULL IDENTITY PRIMARY KEY,
	name text ,
	age integer , 
	salary float ,
);

INSERT INTO Employees
VALUES ( 'John Smith', 32, 55000.50);
INSERT INTO Employees
VALUES ( 'Sarah Johnson', 28, 48000.75);
INSERT INTO Employees
VALUES ( 'Michael Brown' , 41, 71000.00);

SELECT * FROM Employees

CREATE TABLE books(
	id int NOT NULL IDENTITY PRIMARY KEY,
	title text ,
	author text ,
	price float ,
);

INSERT INTO books
VALUES ('The Great Gatsby','F. Scott Fitzgerald',10.99 );
INSERT INTO books
VALUES ('To Kill a Mockingbird','Harper Lee',8.99 );
INSERT INTO books
VALUES ('1984','George Orwell',12.50 );
INSERT INTO books
VALUES ('Pride and Prejudice','Jane Austen',9.75 );

SELECT * FROM books

CREATE TABLE students(
	id int NOT NULL IDENTITY PRIMARY KEY,
	name text,
	age integer,
	major text,
	GPA float,
);
INSERT INTO students
VALUES('John Smith',22,'Computer Science',3.8);

INSERT INTO students
VALUES('Sarah Johnson',20,'Biology',3.2);

INSERT INTO students
VALUES('Michael Brown',24,'Business',3.5);

INSERT INTO students
VALUES('Emily Wilson',21,'English',3.9);

INSERT INTO students
VALUES('David Lee',23,'Psychology',3.6);

SELECT * FROM students
WHERE GPA > 3.5

CREATE TABLE customers(
	customer_ID int NOT NULL PRIMARY KEY,
	customer_name text,
	email text,
	phone_number text,
);
INSERT INTO customers
VALUES (1,'John Smith','john.smith@example.com','555-555-1212');
INSERT INTO customers
VALUES (2,'Jane Doe','jane.doe@example.com','555-555-2323');
INSERT INTO customers
VALUES (3,'Bob Brown','bob.brown@example.com','555-555-3434');

SELECT * FROM customers
ORDER BY customer_ID DESC /* order it descending*/

SELECT * FROM customers /*  retrieve only the information for customer with specific email */
WHERE email LIKE 'jane.doe@example.com'


SELECT * FROM customers /*  retrieve only the information for customer with phone number */
WHERE phone_number LIKE '555-555-3434'

CREATE TABLE products(
	product_id int NOT NULL PRIMARY KEY,
	product_name text,
	category text,
	price decimal,
	quantity_in_stock int,
);

INSERT INTO products
VALUES (1, 'iPhone' , 'Electronics' , 999.99 , 100);
INSERT INTO products
VALUES (2, 'Samsung Galaxy' , 'Electronics' , 799.99 , 50);
INSERT INTO products
VALUES (3, 'Nike Air Max' , 'Shoes' , 119.99 , 200);

SELECT * FROM products

SELECT * FROM products
WHERE product_name LIKE '%iphone%'
 
 CREATE TABLE movies(
 	movie_id int NOT NULL PRIMARY KEY,
	movie_title text,
	director text,
	genre text,
	release_year int,
 );
 INSERT INTO movies
 VALUES ( 1,'The Shawshank Redemption','Frank Darabont','Drama', 1994 );
 INSERT INTO movies
 VALUES ( 2,  'The Godfather', 'Francis Ford Coppola', 'Drama', 1972);
 INSERT INTO movies
 VALUES ( 3,  'The Dark Knight','Christopher Nolan', 'Action', 2008);

 SELECT * FROM movies

 CREATE TABLE inventory (
    product_id INTEGER PRIMARY KEY,
    product_name TEXT,
    supplier TEXT,
    category TEXT,
    quantity INTEGER,
    price REAL,
);
INSERT INTO inventory  VALUES (1, 'iPhone 13', 'Apple Inc.', 'Electronics', 10, 999.99);

INSERT INTO inventory  VALUES (2, 'Kindle Paperwhite', 'Amazon', 'Books & Media', 20, 129.99);

INSERT INTO inventory  VALUES (3, 'Nike Air Max 90', 'Nike Inc.', 'Apparel', 5, 119.99);

SELECT * FROM inventory;

SELECT * FROM inventory WHERE category LIKE 'Electronics';

SELECT * FROM inventory WHERE quantity > 5;

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