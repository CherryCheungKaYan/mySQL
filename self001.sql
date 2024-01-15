show databases;

create database db_bc2311;

use db_bc2311;

CREATE USER 'CherryCheung'@'localhost' IDENTIFIED BY 'admin1234';

ALTER USER 'CherryCheung'@'localhost' IDENTIFIED BY 'admin1234';

GRANT CREATE, ALTER, DROP, INSERT, UPDATE, DELETE, SELECT, REFERENCES, RELOAD on *.* TO 'CherryCheung'@'localhost' WITH GRANT OPTION;

SHOW VARIABLES LIKE 'validate_password%';

select user();
SELECT user FROM mysql. user;

drop user 'cherrycheung'@'localhost';

create table customer (
	id integer not null,
    cust_name varchar(50) not null,
    cust_email_addr varchar(30),
    cust_phone varchar(50)
    );
    
    -- delete all data (without where)
    delete from customer; 
   
    insert into customer (id, cust_name, cust_email_addr, cust_phone) values (1, 'John Lau', 'johnlau@gmail.com', '12345678');
    insert into customer (id, cust_name, cust_email_addr, cust_phone) values (2, 'Ivy Lee', 'ivylee@gmail.com', '123456987');
	insert into customer (id, cust_name, cust_email_addr, cust_phone) values (3, 'Gio Lee', 'giolee@gmail.com', '456456987');
	insert into customer (id, cust_name, cust_email_addr, cust_phone) values (4, 'Gio Lee', 'null', 'null');
    
select * from customer;

delete from customer where cust_name = 'John Lau' limit 1;
update customer set id = 3 where cust_name = 'Gio Lee';
delete from customer where cust_name = 'Gio Lee' limit 2;

-- where
select * from customer where id = 2;
select * from customer where cust_name = 'Gio Lee' and cust_phone = '456456987';
select * from customer where cust_name = 'John Lau' or cust_email_addr = 'ivylee@gmail.com';
select * from customer where cust_name = 'John Lau' or cust_email_addr = 'ivylee@gmail.com' and cust_email_addr = 'johnlau@gmail.com';

-- where + order by
-- desc (descending order)
-- asc (ascending order)
select * from customer where cust_name = 'John Lau' or cust_email_addr = 'ivylee@gmail.com' order by id desc;
   select * from customer where cust_name = 'John Lau' or cust_email_addr = 'ivylee@gmail.com' order by cust_name asc;
    select * from customer where cust_name = 'John Lau' or cust_email_addr = 'ivylee@gmail.com' order by cust_name; -- asc by default 
    
    insert into customer (id, cust_name, cust_email_addr, cust_phone) values (5, 'Sunny Wong', 'sunnywong@yahoo.com.hk', '456789');
    select * from customer where cust_name  = 'John Lau' or cust_name = 'Gio Lee' order by cust_name desc, cust_phone asc;
    
    -- delete table (where)
    insert into customer (id, cust_name, cust_email_addr, cust_phone) values (6, 'dummy', 'dummy@yahoo.com', 'dummy');
    delete from customer where cust_name = 'dummy';
    select * from customer; 
    
	-- where -> like
    insert into customer (id, cust_name, cust_email_addr, cust_phone) values (7, 'Tommy Lee.', 'dummy@yahoo.com', '1234');
    select * from customer; 
	select * from customer where cust_name like '%Lee'; 
	select * from customer where cust_name like '%Lee%'; 
	select * from customer where cust_name like '%Lee%'; 
    select * from customer where cust_email_addr like '%@%' or cust_email_addr is null;
    select * from customer; 
	delete from customer where cust_name = 'Tommy Lee.';
	select * from customer; 
    
    -- alter table add/ modift/ drop
    -- add a new coloum 
    alter table customer add join_date date;
    
    -- update 
    update customer set join_date = str_to_date('1900-01-01','%Y-%m-%d');
    update customer set join_date = str_to_date('1900 01 01','%Y %m %d');
    
    update customer set join_date = str_to_date('2023 01 01','%Y %m %d') where id =2;
    select * from customer;
    
    -- VARCHAR	 INTEGER, DATE, DECIMAL, DATETIME
    alter table customer add score decimal (5,2); -- 3 digitis for integer, 2 digits for decimal places, max value 999.99
    alter table customer add last_transcation_time DATETIME;
    
    insert into customer (id, cust_name, cust_email_addr, cust_phone, join_date, score)
    values (3, 'Gio Lee', 'giolee@gmail.com', '87654321', str_to_date('1900-01-01', '%Y-%m-%d'),120.56); 
    
    insert into customer (id, cust_name, cust_email_addr, cust_phone, join_date, score)
    values (3, 'Gio Chan', 'giolee@gmail.com', '87654321', str_to_date('1900-01-01', '%Y-%m-%d'),120.56); 
    select * from customer;
    -- update customer set score =-1000 where id = 9 -- error, 1000 is out of range for decimal(5,2)
    
	insert into customer (id, cust_name, join_date, cust_email_addr, last_transcation_time )
    values (11, 'George Lee', str_to_date('1900-01-01', '%Y-%m-%d'), 12.99, str_to_date('1900-01-01' 20:20:21, '%Y-%m-%d %H:%i:%s')); 
     select * from customer;
     
     -- where: between and (inclusive)
     select * from customer where join_date between str_to_date('1900-01-01', '%Y-%m-%d') and str_to_date('2303-12-31', '%Y-%m-%d');
    
    -- where: >, <, >= , <=
    select * from customer where ifnull(score, 100) > 0 and ifnull(score,100) < 1000;
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    

