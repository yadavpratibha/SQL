CREATE DATABASE ONLINE_DELIVERY;

USE ONLINE_DELIVERY;

CREATE TABLE CUSTOMER(
	ID INT NOT NULL ,
    FIRST_NAME VARCHAR(15) UNIQUE, -- only unique entry for attribute
    LAST_NAME VARCHAR(15),
    DOB DATE,
    GENDER CHAR(1),
    PRIMARY KEY(ID)
);

INSERT INTO CUSTOMER 
	(ID, FIRST_NAME, LAST_NAME, DOB, GENDER) VALUES
    (01, 'Phineas', 'Flynn', '2011-11-11', 'M'),
    (02, 'Ferb', 'Fletcher', '2010-12-17', 'M'),
    (03, 'Candace', 'Flynn', '2006-10-10', 'F'),
    (04, 'Perry', 'Platypus', '2008-12-15', 'M'),
    (05, 'Heinz',  'Doofenshmirtz', '1984-02-14', 'M'),
    (06, 'Vanessa', 'Doofenshmirtz', '2008-11-09', 'F'),
    (07, 'Isabella', 'Sharpiro', '2009-12-14', 'F');
    
SELECT * FROM CUSTOMER;

CREATE TABLE ORDERS(
	NAME VARCHAR(15),
    CUST_ID INT PRIMARY KEY,
    ORDERED VARCHAR(3),
    AMOUNT INT,
    FOREIGN KEY(CUST_ID) REFERENCES CUSTOMER(ID)
);

ALTER TABLE ORDERS MODIFY ORDERED VARCHAR(20);

INSERT INTO ORDERS
	(NAME, CUST_ID, ORDERED, AMOUNT) VALUES
	('Ferb', 02, 'Momo', 250),
    ('Perry', 04, 'Chole Bhature', 300),
    ('Vanessa', 06, 'Gol Gappe', 50),
    ('Isabella', 07, 'Ice Cream', 70);

SELECT * FROM ORDERS;

ALTER TABLE ORDERS ADD ORDER_TIME DATETIME DEFAULT '2000-01-01';

DESC CUSTOMER;
DESC ORDERS;

ALTER TABLE ORDERS CHANGE COLUMN ORDERED MENU_ITEM VARCHAR(20);

