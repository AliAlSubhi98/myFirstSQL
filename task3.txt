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
