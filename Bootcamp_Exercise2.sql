create database org;
show databases;
use org;

DROP TABLE WORKER;
CREATE TABLE worker (
  WORKER_ID INTEGER NOT NULL PRIMARY KEY AUTO_INCREMENT,
  FIRST_NAME CHAR(25),
  LAST_NAME CHAR(25),
  SALARY NUMERIC(15),
  JOINING_DATE DATETIME,
  DEPARTMENT CHAR(25)
);

INSERT INTO worker (FIRST_NAME, LAST_NAME, SALARY, JOINING_DATE, DEPARTMENT) VALUES
  ('Monika', 'Arora', 100000, '2020-02-21 09:00:00', 'HR'),
  ('Niharika', 'Verma', 80000, '2011-06-21 09:00:00', 'Admin'),
  ('Vishal', 'Singhal', 300000, '2020-02-21 09:00:00', 'HR'),
  ('Mohan', 'Sarah', 300000, '2019-03-12 09:00:00', 'Admin'),
  ('Amitabh', 'Singh', 500000, '2020-02-21 09:00:00', 'Admin'),
  ('Vivek', 'Bhati', 490000, '2011-06-21 09:00:00', 'Admin'),
  ('Vipul', 'Diwan', 200000, '2011-06-21 09:00:00', 'Account'),
  ('Satish', 'Kumar', 75000, '2020-01-21 09:00:00', 'Account'),
  ('Geetika', 'Chauhan', 90000, '2011-04-21 09:00:00', 'Admin');
  SELECT * FROM WORKER;
  DROP TABLE BONUS;
  
  CREATE TABLE BONUS (
  WORKER_REF_ID INTEGER,
  BONUS_AMOUNT NUMERIC(10),
  BONUS_DATE DATETIME,
  FOREIGN KEY (WORKER_REF_ID) REFERENCES WORKER(WORKER_ID)
  );
  
  -- Task 1: Insert data into the "BONUS" table
  INSERT INTO BONUS (WORKER_REF_ID, BONUS_AMOUNT, BONUS_DATE) VALUES
  (1, 32090, '2021-11-02'),
  (2, 20000, '2022-11-02'),
  (5, 21000, '2021-11-02'),
  (9, 30008, '2021-11-02');
  SELECT * FROM BONUS;
  
 --  Task 2: SQL query to show the second highest salary among all workers
SELECT MAX(SALARY) AS SecondHighestSalary
FROM WORKER
WHERE SALARY < (
  SELECT MAX(SALARY)
  FROM WORKER
);


-- Task 3: SQL query to print the name of employees having the highest salary in each department
SELECT FIRST_NAME, LAST_NAME, SALARY
FROM WORKER
WHERE (DEPARTMENT, SALARY) IN (
SELECT DEPARTMENT, MAX(SALARY)
FROM WORKER
GROUP BY DEPARTMENT
);

-- ('Vishal', 'Singhal', 300000, '2020-02-21 09:00:00', 'HR'),
-- ('Mohan', 'Sarah', 300000, '2019-03-12 09:00:00', 'Admin'),

-- Task 4: SQL query to fetch the list of employees with the same salary
SELECT FIRST_NAME, LAST_NAME, SALARY
FROM WORKER
WHERE SALARY IN (
  SELECT SALARY
  FROM WORKER
  GROUP BY SALARY
  HAVING COUNT(*) > 1 
);

-- Task 5: SQL query to find the worker names with salaries + bonus in 2021
select first_name, last_name
from worker w left join bonus b on b.worker_ref_id = w.worker_id
where year(b.bonus_date) = 2021;

20 -- Task 6 (Please complete Task 1-5 first):
21 -- Your actions: Delete all the records in table WORKER
22 -- Question: Study the reason why the data cannot be deleted

-- Task 7 (Please complete Task 6 first):
25 -- Your action: Drop table WORKER
26 -- Question: study the reason why the table cannot be dropped
