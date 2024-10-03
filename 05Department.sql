CREATE DATABASE TEMP;

USE TEMP;

CREATE TABLE Dept1(
	EMPID INT PRIMARY KEY NOT NULL,
    NAME VARCHAR(15),
    ROLE VARCHAR(15)
);

INSERT INTO Dept1 (EMPID, NAME, ROLE) VALUES
	(1, 'A', 'Engineer'),
    (2, 'B', 'Salesman'),
    (3, 'C', 'Manager'),
    (4, 'D', 'Salesman'),
    (5, 'E', 'Engineer');

SELECT * FROM Dept1;

CREATE TABLE Dept2(
	EMPID INT PRIMARY KEY NOT NULL,
    NAME VARCHAR(15),
    ROLE VARCHAR(15)
);

INSERT INTO Dept2 (EMPID, NAME, ROLE) VALUES
	(3, 'C', 'Manager'),
    (6, 'F', 'Marketing'),
    (7, 'G', 'Salesman');
    
SELECT * FROM Dept2;

-- SET OPERATIONS
-- List out all the employees in the company
SELECT * FROM Dept1
UNION
SELECT * FROM Dept2;

-- List out all the employee in all the department who work as salesman
SELECT * FROM Dept1 WHERE ROLE='Salesman'
UNION
SELECT * FROM Dept2 WHERE ROLE='Salesman';

-- List out all the employee who work for both department
SELECT * FROM Dept1 INNER JOIN Dept2 USING(EMPID);

SELECT Dept1.* FROM Dept1 INNER JOIN Dept2 USING(EMPID);

-- List out all the employee working in department1 but not in department 2
SELECT Dept1.* FROM Dept1 LEFT JOIN Dept2 USING(EMPID) WHERE Dept2.EMPID IS NULL;

DROP DATABASE temp;
