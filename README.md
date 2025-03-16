# Learning SQL

## MANAGING DATABASE (DDL)
### Creation of DB
1. CREATE DATABASE IF NOT EXISTS db-name;
2. USE db-name; //need to execute to choose on which DB CREATE TABLE etc commands will be executed make switching between DBs possible.
3. DROP DATABASE IF EXISTS db-name; //dropping database.
4. SHOW DATABASES; //list all the DBs in the server.
5. SHOW TABLES; //list tables in the selected DB.

## DATA RETRIEVAL LANGUAGE (DRL)
1. Syntax: SELECT <set of column names> FROM <table_name>;
2. SELECT * FROM table-name WHERE condition;
3. SELECT * FROM table-name WHERE column BETWEEN limit1 and limit2; // limit1 and limit2 are inclusive.
4. SELECT * FROM table-name WHERE column IN (values);
5. AND/OR/NOT
   - AND: WHERE cond1 AND cond2
   - OR: WHERE cond1 OR cond2
   - NOT: WHERE col_name NOT IN (values);
6. SELECT * FROM table-name WHERE column is NULL;
7. SELECT * FROM table-name WHERE column LIKE ‘%p_’; //for pattern searching
8. ORDER BY <column-name> DESC; //DESC = Descending and ASC = Ascending
9. SELECT c1, c2, c3 FROM table-name WHERE cond GROUP BY c1, c2, c3; //GROUP BY Clause is used to collect data from multiple records and group the result by one or more column.
10. AGGREGATION FUNCTION
    - COUNT()
    - SUM()
    - AVG()
    - MIN()
    - MAX()
11. SELECT DISTINCT (column) FROM table_name;
