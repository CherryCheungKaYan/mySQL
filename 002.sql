show databases;

create database db_bc2311;

use db_bc2311;

GRANT CREATE, ALTER, DROP, INSERT, UPDATE, DELETE, SELECT, REFERENCES, RELOAD on *.* TO 'vincentlau'@'localhost' WITH GRANT OPTION;
DROP TABLE customer;
create table customer (
	id integer not null,
    cust_name varchar(50) not null,
    cust_email_addr varchar(30),
    cust_phone varchar(50)
);

-- delete all data (without where)
delete from customer;
DROP TABLE customers;
insert into customer (id, cust_name, cust_email_addr, cust_phone) values (1, 'John Lau', 'johnlau@gmail.com', '12345678');

-- Insert some more records ...
-- Try insert some null values
insert into customer (id, cust_name, cust_email_addr, cust_phone) values (2, 'Sunny Wong', 'sunnywong@gmail.com', '12345678');
insert into customer (id, cust_name, cust_email_addr, cust_phone) values (3, 'Mary Lau', 'marylau@yahoo.com.hk', '1234567890');
insert into customer (id, cust_name, cust_email_addr, cust_phone) values (4, 'Christy Cheung', null, null);
select* from customer;
-- where 
select * from customer where id = 3;
select * from customer where cust_name = 'John Lau' and cust_phone = '12345678';
select * from customer where cust_name = 'John Lau' or cust_email_addr = 'sunnywong@gmail.com';
select * from customer where (cust_name = 'John Lau' or cust_email_addr = 'sunnywong@gmail.com') and cust_email_addr = 'johnlau@gmail.com';

-- where + order by
-- desc (descending order)
-- asc (ascending order)
select * from customer where cust_name = 'John Lau' or cust_email_addr = 'sunnywong@gmail.com' order by id desc;
select * from customer where cust_name = 'John Lau' or cust_email_addr = 'sunnywong@gmail.com' order by cust_name asc;
select * from customer where cust_name = 'John Lau' or cust_email_addr = 'sunnywong@gmail.com' order by cust_name; -- asc by default

insert into customer (id, cust_name, cust_email_addr, cust_phone) values (5, 'Sunny Wong', 'sunnywong@yahoo.com.hk', '87654321');
select * from customer where cust_name = 'John Lau' or cust_name = 'Sunny Wong' order by cust_name desc, cust_phone asc;
select * from customer where cust_name in ('John Lau', 'Sunny Wong') order by cust_name desc, cust_phone asc;

select * from customer; 
-- delete table (where)
insert into customer (id, cust_name, cust_email_addr, cust_phone) values (6, 'dummy', 'dummy@yahoo.com.hk', 'dummy');
delete from customer where cust_name = 'dummy';

-- where -> like
-- % means any character(s) or no character
insert into customer (id, cust_name, cust_email_addr, cust_phone) values (7, 'Tommy Lau.', 'tommy@yahoo.com.hk', '1234');
select * from customer where cust_name like '%Lau'; -- return John Lau, Mary Lau
select * from customer where cust_name like '%Lau%'; -- return John Lau, Mary Lau, Tommy Lau.
select * from customer where cust_name like '%Sunny%'; -- Sunny Wong, Sunny Wong
select * from customer where cust_email_addr like '%@%' or cust_email_addr is null;
select * from customer;

-- alter table add/ modify/ drop
-- add a new column
alter table customer add join_date date;

-- update
update customer set join_date = str_to_date('1990-01-01', '%Y-%m-%d');
update customer set join_date = str_to_date('1990 01 01', '%Y %m %d');

update customer set join_date = str_to_date('2023 01 01', '%Y %m %d') where id = 2;

-- VARCHAR, INTEGER, DATE, DECIMAL, DATETIME
alter table customer add score decimal(5,2); -- 3 digits for integer, 2 digits for decimal places, -999.99 <= value <= 999.99

insert into customer (id, cust_name, cust_email_addr, cust_phone, join_date, score) 
values (5, 'Sunny Wong', 'sunnywong@yahoo.com.hk', '87654321', str_to_date('1990-01-01', '%Y-%m-%d'), 120.56);

insert into customer (id, cust_name, cust_email_addr, cust_phone, join_date, score) 
values (8, 'Sunny Chan', 'sunnychan@yahoo.com.hk', '87654321', str_to_date('1990-01-01', '%Y-%m-%d'), 120.56);

insert into customer (id, cust_name, cust_email_addr, cust_phone, join_date, score) 
values (9, 'Kaite Kwan', 'kaite@yahoo.com.hk', '1234', str_to_date('1990-01-01', '%Y-%m-%d'), 999.99);

update customer set score = -1000 where id = 9; -- error, 1000 is out of range for decimal(5,2)

alter table customer add last_transaction_time datetime;

insert into customer (id, cust_name, cust_email_addr, cust_phone, join_date, score, last_transaction_time) 
values (9, 'Kaite Kwan', 'kaite@yahoo.com.hk', '1234', str_to_date('1990-01-01', '%Y-%m-%d'), 999.99, str_to_date('1990-01-01 20:20:21', '%Y-%m-%d %H:%i:%s'));

-- Some other approaches to insert data
insert into customer 
values (10, 'Jason Kwan', 'jason@yahoo.com.hk', '1234', str_to_date('1990-01-01', '%Y-%m-%d'), 200.99, str_to_date('1990-01-01 20:20:21', '%Y-%m-%d %H:%i:%s'));

-- error, by default you should provide all column values when you skip the column description
-- insert into customer 
-- values (10, 'Jason Kwan', 'jason@yahoo.com.hk', '1234', str_to_date('1990-01-01', '%Y-%m-%d'), 200.99);

insert into customer (id, cust_name, join_date, score, last_transaction_time) 
values (11, 'Jenny So', str_to_date('1990-01-01', '%Y-%m-%d'), 12.99, str_to_date('1990-01-01 20:20:21', '%Y-%m-%d %H:%i:%s'));

-- where: between and (inclusive)
select * from customer where join_date between str_to_date('2023-01-01', '%Y-%m-%d') and str_to_date('2023-12-31', '%Y-%m-%d');
select * from customer where join_date >= str_to_date('2023-01-01', '%Y-%m-%d') and join_date <= str_to_date('2023-12-31', '%Y-%m-%d');

-- where: >, <, >=, <=
-- ifnull() function: Treat null value as another specified value
select * from customer where ifnull(score, 100) > 0 and ifnull(score,100) < 1000;
select * from customer where coalesce(score, 100) > 0 and coalesce(score,100) < 1000;

-- alter table -> drop column
alter table customer add dummy VARCHAR(10);
alter table customer drop column dummy; 

-- alter table -> modify column
-- extend the length of the column
alter table customer modify column cust_email_addr varchar(50); -- extend length fromn 30 to 50
-- shorten the length of the column
-- alter table consumer modify column cust_email_addr varchar(10); shorten length from 50 to 10, error, because some existing data's length
select* from customer;

-- Find the customer with score > 100 and showing the id, cust_name, join_date of result set
select id, cust_name, join_date from customer where score >100;

-- IS NULL, IS NOT NULL
select id, score from customer where score is not null; 

-- String Function
select upper(c.cust_name) as customer_name_upper_case
, lower(c.cust_name) as customer_name_lower_case
, c.cust_name as customer_name
, length(c.cust_name) as customer_name_length
, substring(c.cust_name,1, 3) as customer_name_prefix
, concat(c.cust_name, ', email address: ', c.cust_email_addr) as customer_info
, replace(c.cust_name, 'Lau', 'Chan') as new_customer_name
, left(c.cust_name, 3) -- retrieve the characters from the left to right
, right(c.cust_name, 2) -- retrieve the characters from the right to left
, trim(c.cust_name) -- remove leading and tail spaces
, replace(c.cust_name, ' ', '') -- remomve all spaces
, instr(c.cust_name, 'Lau') as position
from customer c;

-- My SQL case-insensitive
select * from customer where cust_name = 'Mary Lau';
select * from customer where cust_name = 'mary Lau'; -- still can return, case insensitive
select * from customer where cust_name collate utf8mb4 = 'Mary Lau'; -- case sensitive check in MYSQL

-- Like: %, _
select * from customer where cust_name like '_hn%'; -- There is only one character before 'o'
select * from customer where cust_name like '_John%'; 

-- Math 
update customer set score = 12.14 where id = 1;
update customer set score = 12.15 where id = 2;
update customer set score = 12.16 where id = 3;

select c.*
, 1 as one
, 'dummy value' as dummy_column
, round(c.score, 1) rounded_score
, ceil (c.score) as ceiling_value
, floor(c.score) as floor_value
, abs(score) abs_value
, power(score, 2) as power2_value
, date_add(join_date, interval 3 month) as three_month_after_join_date
, date_add(join_date, interval 3 day) as three_mday_after_join_date
, date_add(join_date, interval 3 year) as three_year_after_join_date
, date_sub(join_date, interval 3 day) as three_day_before_join_date
, join_date + interval 1 day -- correct
, join_date - 1 -- wrong syntax in MYSQL
, join_date - interval 1 day -- correct
, datediff('2000-01-01', join_date) as number_of_days_between_joindate_1990_12_31
, datediff(join_date, join_date) 
, now() as curr_timestamp
from customer c;

-- CASE
select cust_name, 
	case
    when score < 20 then 'Fail'
    when score < 100 then 'Pass'
    when score < 1000 then 'Excellent'
	else 'N/A'
end as grade
from customer; 

-- primary key is one of the constraint: not null, unique, index
create table department (
	id integer primary key,
    dept_name varchar(50),
    dept_code varchar(10)
);

create table empolyee (
	id integer primary key,
    staff_id varchar(50),
    staff_name varchar(50),
    hkid varchar(10) unique,
    dept_id integer,
    foreign key (dept_id) references department(id)
);

alter table empolyee add country_id integer;
select * from empolyee;
alter table empolyee add constraint fk_country_id foreign key (country_id) references country(id); 

create table country (
id integer primary key,
country_code varchar(2) unique,
description varchar(50)
);

insert into department values (1, 'Human Resource', 'HR');
insert into department values (2, 'Inforamtion Technology', 'IT');

insert into empolyee values (1, '001', 'John Lau', 'A1234567', 2); 
insert into empolyee values (2, '002', 'Mary Chan', 'A1234568', 1);
-- insert into employee values (3, '003', 'Jenny Wong', 'A123459', 3; -- error , because dept_id 3 doesnt existing in table department
insert into empolyee values (3, '003', 'Sunny Lau', 'A1274568', 2);


-- inner join 
select *
from empolyee inner join department;

select e.id, e.staff_id, e.staff_name, d.dept_name, d.dept_code, c.country_code, c.description
from empolyee e 
inner join department d on e.dept_id = d.id
inner join country c on e.country_id = c.id;

select * from empolyee;
insert into country values (1, 'HK', 'Hong Kong');
update empolyee set country_id = 1; 





