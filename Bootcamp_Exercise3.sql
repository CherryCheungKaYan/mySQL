create database ex;
show databases;
use ex;
CREATE TABLE customer (
    id INT PRIMARY KEY,
    customer_name VARCHAR(255),
    city_id INT,
    customer_address VARCHAR(255),
    contact_person VARCHAR(255),
    email VARCHAR(128) NULL,
    phone VARCHAR(128)
);

CREATE TABLE product (
    id INT PRIMARY KEY,
    sku VARCHAR(32),
    product_name VARCHAR(128),
    product_description TEXT,
    current_price DECIMAL(8, 2),
    quantity_in_stock INT
);

CREATE TABLE invoice (
    id INT PRIMARY KEY,
    invoice_number VARCHAR(255),
    customer_id INT,
    user_account_id INT,
    total_price DECIMAL(8, 2),
    time_issued TIMESTAMP,
    time_due TIMESTAMP,
    time_paid TIMESTAMP,
    time_canceled TIMESTAMP,
    time_refunded TIMESTAMP,
    FOREIGN KEY (customer_id) REFERENCES customer(id)
);
drop table invoice_team;
CREATE TABLE invoice_item (
    id INT PRIMARY KEY,
    invoice_id INT,
    product_id INT,
    quantity INT,
    price DECIMAL(8, 2),
    line_total_price DECIMAL(8, 2),
    FOREIGN KEY (invoice_id) REFERENCES invoice(id),
    FOREIGN KEY (product_id) REFERENCES product(id)
);


INSERT INTO customer (id, customer_name, city_id, customer_address, contact_person, email, phone)
VALUES
    (1, 'Drogerie Wien', 1, 'Deckergasse 15A', 'Emil Steinbach', 'emil@drogeriewien.com', '094234234'),
    (2, 'Cosmetics Store', 4, 'Watling Street 347', 'Jeremy Corbyn', 'jeremy@c-store.org', '093923923'),
    (3, 'Kosmetikstudio', 3, 'Rothenbaumchaussee 53', 'Willy Brandt', 'willy@kosmetikstudio.com', '0941562222'),
    (4, 'Neue Kosmetik', 1, 'Karlsplatz 2', NULL, 'info@neuekosmetik.com', '094109253'),
    (5, 'Bio Kosmetik', 2, 'Motzstraße 23', 'Clara Zetkin', 'clara@biokosmetik.org', '093825825'),
    (6, 'K-Wien', 1, 'Kärntner Straße 204', 'Maria Rauch-Kallat', 'maria@kwien.org', '093427002'),
    (7, 'Natural Cosmetics', 4, 'Clerkenwell Road 14B', 'Glenda Jackson', 'glenda.j@natural-cosmetics.com', '093555123'),
    (8, 'Kosmetik Plus', 2, 'Unter den Linden 1', 'Angela Merkel', 'angela@k-plus.com', '094727727'),
    (9, 'New Line Cosmetics', 4, 'Devonshire Street 92', 'Oliver Cromwell', 'oliver@nlc.org', '093202404');
    
    INSERT INTO product (id, sku, product_name, product_description, current_price, quantity_in_stock)
VALUES
    (1, '330120', 'Game Of Thrones - URBAN DECAY', 'Game Of Thrones Eyeshadow Palette', 65, 122),
    (2, '330121', 'Advanced Night Repair - ESTEE LAUDER', 'Advanced Night Repair Synchronized Recovery Complex II', 98, 51),
    (3, '330122', 'Rose Deep Hydration - FRESH', 'Rose Deep Hydration Facial Toner', 45, 34),
    (4, '330123', 'Pore-Perfecting Moisturizer - TATCHA', 'Pore-Perfecting Moisturizer & Cleanser Duo', 25, 393),
    (5, '330124', 'Capture Youth - DIOR', 'Capture Youth Serum Collection', 95, 74),
    (6, '330125', 'Slice of Glow - GLOW RECIPE', 'Slice of Glow Set', 45, 40),
    (7, '330126', 'Healthy Skin - KIEHL S SINCE 1851', 'Healthy Skin Squad', 68, 154),
    (8, '330127', 'Power Pair! - IT COSMETICS', 'IT is Your Skincare Power Pair! BestSelling Moisturizer & Eye Cream Duo', 80, 0),
    (9, '330128', 'Dewy Skin Mist - TATCHA', 'Limited Edition Dewy Skin Mist Mini', 20, 281);
    
INSERT INTO invoice (id, invoice_number, customer_id, user_account_id, total_price, time_issued, time_due, time_paid, time_canceled, time_refunded)
VALUES
    (1, 'in25181b07ba800c8d2fc967fe9918d9', 7, 4, 1300.00, '2019-07-20 15:05:07', '2019-07-27 15:05:07', '2019-07-25 15:05:07', NULL, NULL),
    (2, '8fba0000fd456b27502b9f81e9d52481', 9, 2, 3.00, '2019-07-20 15:07:11', '2019-07-27 15:07:11', '2019-07-20 15:07:11', '2019-07-20 15:10:32', NULL),
    (3, '366638118246b6bcfd3dfcd9be487599', 3, 2, 1000.00, '2019-07-20 15:06:15', '2019-07-27 15:06:15', '2019-07-31 15:06:15', '2019-07-31 21:22:11', NULL),
    (4, 'dfe7f0a01a682196cac0120a9adbb550', 5, 2, 0.00, '2019-07-20 15:06:34', '2019-07-27 15:06:34', NULL, NULL, NULL),
    (5, '2a24cc2ad4440d698878a0a1a71f70fa', 6, 2, 9500.00, '2019-07-20 15:06:42', '2019-07-27 15:06:42', NULL, '2019-07-22 11:17:02', NULL),
    (6, 'cbd304872ca6257716bcab8fc43204d7', 4, 2, 150.00, '2019-07-20 15:08:15', '2019-07-27 15:08:15', '2019-07-27 15:08:15', '2019-07-27 13:42:45', '2019-07-27 14:11:20');
    
    INSERT INTO invoice_item (id, invoice_id, product_id, quantity, price, line_total_price)
VALUES
    (1, 1, 1, 20, 65, 1300),
    (2, 1, 7, 2, 68, 136),
    (3, 1, 5, 10, 100, 1000),
    (4, 3, 9, 2, 180, 360),
    (5, 4, 1, 5, 65, 325),
    (6, 4, 2, 10, 95, 950),
    (7, 4, 5, 4, 100, 400),
    (8, 5, 9, 100, 95, 9500),
    (9, 6, 4, 6, 25, 150);
    select * from invoice_item;
    
    select customer_name, c.id
    from customer c left join invoice i on c.id = i.customer_id
    where i.id is null; 
    
    select p.product_name, p.id, p.product_description
    from product p left join invoice_item i on i.product_id = p.id
    where i.product_id is null;
    
  
CREATE TABLE EMPLOYEE (
  ID INTEGER NOT NULL AUTO_INCREMENT PRIMARY KEY,
  EMPLOYEE_NAME VARCHAR(30) NOT NULL,
  SALARY NUMERIC(8, 2),
  PHONE NUMERIC(15),
  EMAIL VARCHAR(50),
  DEPT_ID INTEGER NOT NULL
);

CREATE TABLE DEPARTMENT (
  ID INTEGER NOT NULL AUTO_INCREMENT PRIMARY KEY,
  DEPT_CODE VARCHAR(3) NOT NULL,
  DEPT_NAME VARCHAR(200) NOT NULL
);

-- Delete existing data from EMPLOYEE table
DELETE FROM EMPLOYEE;

-- Insert values into EMPLOYEE table
INSERT INTO EMPLOYEE (ID, EMPLOYEE_NAME, SALARY, PHONE, EMAIL, DEPT_ID)
VALUES (1, 'John Doe', 2000, 90234567, 'john.doe@gmail.com', 1);

INSERT INTO EMPLOYEE (ID, EMPLOYEE_NAME, SALARY, PHONE, EMAIL, DEPT_ID)
VALUES (2, 'Mary', 10000, 90234561, 'mary@gmail.com', 1);

INSERT INTO EMPLOYEE (ID, EMPLOYEE_NAME, SALARY, PHONE, EMAIL, DEPT_ID)
VALUES (3, 'Steve', 30000, 90234562, 'steve@gmail.com', 3);

INSERT INTO EMPLOYEE (ID, EMPLOYEE_NAME, SALARY, PHONE, EMAIL, DEPT_ID)
VALUES (4, 'Sunny', 40000, 90234563, 'sunny@gmail.com', 4);

-- Delete existing data from DEPARTMENT table
DELETE FROM DEPARTMENT;

-- Insert values into DEPARTMENT table
INSERT INTO DEPARTMENT (ID, DEPT_CODE, DEPT_NAME)
VALUES (1, 'HR', 'Human Resources');

INSERT INTO DEPARTMENT (ID, DEPT_CODE, DEPT_NAME)
VALUES (2, '9UP', '9UP Department');

INSERT INTO DEPARTMENT (ID, DEPT_CODE, DEPT_NAME)
VALUES (3, 'SA', 'Sales Department');

INSERT INTO DEPARTMENT (ID, DEPT_CODE, DEPT_NAME)
VALUES (4, 'IT', 'Information Technology Department');

select * from department;

select d.dept_code as department_Code, count(d.id) as number_of_employees
from department d left join employee e on d.id = e.id
GROUP BY d.dept_code;  














    
