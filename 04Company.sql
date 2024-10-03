CREATE DATABASE COMPANY;

USE COMPANY;

CREATE TABLE Employee(
	ID INT PRIMARY KEY NOT NULL,
    FIRSTNAME VARCHAR(15),
    LASTNAME VARCHAR(15),
    AGE INT,
    EMAILID VARCHAR(30) UNIQUE,
    PHONENO INT,
    CITY VARCHAR(15)
);

INSERT INTO Employee (ID, FIRSTNAME, LASTNAME, AGE, EMAILID, PHONENO, CITY) VALUES
	(1, 'Aman', 'Proto', 32, 'aman@gmail.com', 99999, 'Delhi'),
    (2, 'Yagya', 'Narayan', 44, 'yagya@gmail.com', 98888, 'Palam'),
    (3, 'Rahul', 'BD', 22, 'rahul@gmail.com', 98777, 'Kolkata'),
    (4, 'Jatin', 'Hermit', 31, 'jatin@gmail.com', 98766, 'Raipur'),
    (5, 'PK', 'Pandey', 21, 'pk@gmail.com', 98765, 'Jaipur');
    
SELECT * FROM Employee;

CREATE TABLE Client(
	ID INT PRIMARY KEY,
    FIRST_NAME VARCHAR(15),
    LAST_NAME VARCHAR(15),
    AGE INT,
    EMAILID VARCHAR(30) UNIQUE,
    PHONENO INT,
    CITY VARCHAR(15),
    EMPID INT,
    FOREIGN KEY(EMPID) REFERENCES Employee(ID)
);

INSERT INTO Client (ID, FIRST_NAME, LAST_NAME, AGE, EMAILID, PHONENO, CITY, EMPID) VALUES
	(1, 'Mac', 'Rogers', 47, 'mac@gmail.com', 987, 'Kolkata', 3),
    (2, 'Max', 'Poirier', 27, 'max@gmail.com', 222, 'Kolkata', 3),
    (3, 'Peter', 'Jain', 24, 'peter@abc.com', 111, 'Delhi', 1),
    (4, 'Sushant', 'Agrawal', 23, 'shushant@yahoo.com', 445, 'Hyderabad', 5),
    (5, 'Pratap', 'Singh', 36, 'p@xyz.com', 777, 'Mumbai', 2);
    
SELECT * FROM Client;

CREATE TABLE Project(
	ID INT PRIMARY KEY,
    EMPID INT,
    NAME VARCHAR(15),
    START_DATE DATE,
    CLIENT_ID INT,
    FOREIGN KEY(EMPID) REFERENCES Employee(ID),
    FOREIGN KEY(CLIENT_ID) REFERENCES Client(ID)
);

INSERT INTO Project (ID, EMPID, NAME, START_DATE, CLIENT_ID) VALUES
	(1, 1, 'A', '2021-04-21', 3),
    (2, 2, 'B', '2021-03-12', 1),
    (3, 3, 'C', '2021-01-16', 5),
    (4, 3, 'D', '2021-04-27', 2),
    (5, 5, 'E', '2021-05-01', 4);
    
SELECT * FROM Project;

-- INNER JOIN
-- Enlist all the Employee ID's, names along with the Project allocated to them
SELECT e.ID, e.FIRSTNAME, e.LASTNAME, p.ID, p.NAME FROM Employee AS e
	INNER JOIN Project AS p ON e.ID=p.EMPID;
    
SELECT e.ID, e.FIRSTNAME, e.LASTNAME, p.ID, p.NAME FROM Employee AS e, Project AS p
	WHERE e.ID=p.EMPID;
    
SELECT * FROM Employee AS e
	INNER JOIN Project AS p ON e.ID=p.EMPID;
    
-- Fetch out all the employee ID's and their contact detail who have been
-- working from jaipur with the clients name working in hyderabad
SELECT e.ID, e.EMAILID, e.PHONENO, c.FIRST_NAME, c.LAST_NAME from Employee as e
	INNER JOIN CLIENT AS c ON e.ID=c.EMPID WHERE e.CITY='Jaipur' AND c.CITY='Hyderabad';
    
    
-- LEFT JOIN
-- Fetch out each project allocated to each employee
SELECT * FROM Employee AS e 
	LEFT JOIN Project AS p ON e.ID=p.EMPID;
    

-- RIGHT JOIN
-- List out all the project along with the employee's name and their respective allocated email ID
SELECT p.ID, p.NAME, e.FIRSTNAME, e.LASTNAME, e.EMAILID FROM Employee AS e
	RIGHT JOIN Project AS p ON e.ID=p.EMPID;
    
-- CROSS JOIN
-- List out all the combinations possible for the employee's name and and project that can exist
SELECT e.ID, e.FIRSTNAME, e.LASTNAME, p.NAME FROM Employee AS e
	CROSS JOIN Project AS p;
    
-- SUB QUERIES
-- WHERE clause same table
-- employee with age>30
SELECT * FROM Employee WHERE AGE IN (SELECT AGE FROM Employee WHERE AGE>30); 

-- WHERE clause different table
-- emp details working in more than 1 project
SELECT * FROM Employee WHERE ID IN (SELECT EMPID FROM PROJECT GROUP BY EMPID HAVING COUNT(EMPID)>1);

-- single value subquery
-- emp details having age>avg(age)
SELECT * FROM Employee WHERE AGE>(SELECT AVG(AGE) FROM Employee);

-- FROM CLAUSE -- DERIVED TABLE
-- select max age person whose first name CONTAINS 'a'
SELECT MAX(AGE) FROM (SELECT * FROM Employee WHERE FIRSTNAME LIKE '%a%') AS temp;

-- CORELATED SUBQUERY
-- find the third oldest employee
SELECT * FROM Employee AS e1
	WHERE 3=(
    SELECT COUNT(e2.AGE) FROM Employee AS e2 WHERE e2.AGE>=e1.AGE
    );

-- VIEW
SELECT * FROM Employee;

-- CREATE A VIEW
CREATE VIEW custom_view AS SELECT FIRSTNAME, LASTNAME, CITY FROM Employee;

SELECT * FROM custom_view;
