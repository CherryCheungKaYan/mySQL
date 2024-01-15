show databases;

create database Bootcamp_Exercise1;

use db_bc2311;

drop table regions;
Create table regions (
region_id integer primary key,
region_name varchar(25)
);
select * from regions;
drop table countries;
create table countries (
country_id char(2) primary key,
country_name varchar(40),
region_id integer,
foreign key (region_id) references regions(region_id)
);
select * from countries;

drop table locations;
create table locations (
location_id integer primary key,
street_address varchar(25),
postal_code varchar(12),
city varchar(30),
state_province varchar(12),
country_id char(2),
foreign key (country_id) references countries (country_id)
);
select* from locations;

drop table departments;
create table departments (
department_id integer primary key,
department_name varchar(30),
manager_id integer,
location_id integer,
foreign key (location_id ) references locations (location_id)
);

create table jobs (
job_id varchar(10) primary key,
job_title varchar(35),
min_salary integer,
max_salary integer
);
drop table employees;
create table employees (
employee_id integer primary key,
first_name varchar(20),
last_name varchar(25),
email varchar(25),
phone_number varchar(20),
hire_date date,
job_id varchar(10),
salary integer,
commission_pct integer,
manager_id integer,
department_id integer,
foreign key (department_id) references departments (department_id)
);

create table job_history (
employee_id integer,
start_date date,
primary key (employee_id, start_date),
end_date date,
job_id varchar(10),
foreign key (job_id) references jobs (job_id),
department_id integer
);

show tables;
insert into locations (location_id, street_address, postal_code, city, state_province, country_id) values ('1000', '1297 Via Cola di Rie', '989', 'Roma', null, 'IT');
insert into locations (location_id, street_address, postal_code, city, state_province, country_id) values ('1100', '93091 Calle della Te', '10934', 'Venice', null, 'IT');
insert into locations (location_id, street_address, postal_code, city, state_province, country_id) values ('1200', '2017 Shinjuku-ku', '1689', 'Tyoko', 'Tykyo JP', null);
insert into locations (location_id, street_address, postal_code, city, state_province, country_id) values ('1400', '2014 Jabberwocky', '26192', 'Southlake', 'Texas', 'US');
select * from locations;


insert into countries (country_id, country_name, region_id) values ('DE', 'Germany', '1');
insert into countries (country_id, country_name, region_id) values ('IT', 'Italy', '4');
insert into countries (country_id, country_name, region_id) values ('JP', 'Japan', '3');
insert into countries (country_id, country_name, region_id) values ('US', 'United State', '2');
select * from countries;
insert into departments (department_id, department_name, manager_id, location_id) values ('10', 'Administration', '200', '1100');
insert into departments (department_id, department_name, manager_id, location_id) values ('20', 'Marketing', '201', '1200');
insert into departments (department_id, department_name, manager_id, location_id) values ('30', 'Purchasing', '202', '1400');
select * from departments;

insert into employees (employee_id, first_name, last_name, email, phone_number, hire_date, job_id, salary, commission_pct, manager_id, department_id) 
values ('100', 'Steven', 'King', 'SKING', '515-1234567', '1987-06-17','ST_CLERK', '2400.00','0.00', '109','10');
insert into employees (employee_id, first_name, last_name, email, phone_number, hire_date, job_id, salary, commission_pct, manager_id, department_id) 
values ('101', 'Neene', 'Kochhar', 'NKOCHHAR', '515-1234568', '1987-06-18','MK_REP', '1700.00' ,'0.00', '108', '20');
insert into employees (employee_id, first_name, last_name, email, phone_number, hire_date, job_id, salary,commission_pct, manager_id, department_id) 
values ('102', 'Lex', 'King', 'SKING', '515-1234569', '1987-06-19','IT_PROG', '1700.00', '0.00', '108', '30');
insert into employees (employee_id, first_name, last_name, email, phone_number, hire_date, job_id, salary, commission_pct, manager_id, department_id) 
values ('103', 'Alexander', 'Hunold', 'AHUNOLD', '515-423567', '1987-06-20','MK_EP', '9000.00' ,'0.00', '105', '20');
insert into employees (employee_id, first_name, last_name, email, phone_number, hire_date, job_id, salary, commission_pct, manager_id, department_id) 
values ('104', 'CHI', 'IVY', 'CHEUG', '515-423457', '1983-01-24','MK_MAN', '9000.00' ,'0.00', '105', '20');
select * from employees;


insert into job_history (employee_id, start_date, end_date, job_id, department_id) values ('102', '1993-01-13', '1998-07-24','IT_PROG', '20');
insert into job_history (employee_id, start_date, end_date, job_id, department_id) values ('101', '1989-09-21', '1993-10-27','SA_REP', '10');
insert into job_history (employee_id, start_date, end_date, job_id, department_id) values ('101', '1993-10-28', '1997-03-15','MK_REP', '30');
insert into job_history (employee_id, start_date, end_date, job_id, department_id) values ('100', '1996-02-27', '1998-12-19','MK_REP', '30');
insert into job_history (employee_id, start_date, end_date, job_id, department_id) values ('103', '1993-03-24', '199-12-31','MK_REP', '20');
insert into job_history (employee_id, start_date, end_date, job_id, department_id) values ('104', '1993-04-24', '1998-01-31','MK_MAN', '20');
select * from job_history;

insert into jobs (job_id, job_title, min_salary , max_salary ) values ('SA_REP', 'Sales Representative', '4000', '10000');
insert into jobs (job_id, job_title, min_salary , max_salary ) values ('MK_MAN', 'Marketing Manager', '9000', '18000');
insert into jobs (job_id, job_title, min_salary , max_salary ) values ('MK_REP', 'Marketing Representative', '4000', '10000');
insert into jobs (job_id, job_title, min_salary , max_salary ) values ('IT_PROG', 'Programmer', '6000', '12000');
select * from jobs;


INSERT INTO regions (region_id, region_name)
VALUES (1, 'Europe'),
       (2, 'North America'),
       (3, 'Asia'),
       (4, 'South America'),
       (5, 'Africa');
       
select * from regions;

select location_id, street_address, city, state_province, country_name from locations, countries;
select first_name, last_name, department_id from employees;
select employee_id, last_name, manager_id, last_name from employees, department;
select first_name, last_name, job_id from employees;

SELECT e.first_name, e.last_name, e.hire_date
FROM employees e
JOIN employees lex ON e.hire_date > lex.hire_date
where lex.employee_id = '102';

select d.department_name, count(e.employee_id) as number_employees
from departments d left join employees e on d.department_id = e.department_id
group by d.department_name; 

-- insert into departments (department_id, department_name, manager_id, location_id) values ('30', 'Purchasing', '202', '1400');

-- insert into employees (employee_id, first_name, last_name, email, phone_number, hire_date, job_id, salary, commission_pct, manager_id, department_id) 
-- values ('100', 'Steven', 'King', 'SKING', '515-1234567', '1987-06-17','ST_CLERK', '2400.00','0.00', '109','10');
-- insert into jobs (job_id, job_title, min_salary , max_salary ) values ('SA_REP', 'Sales Representative', '4000', '10000');
-- insert into job_history (employee_id, start_date, end_date, job_id, department_id) values ('102', '1993-01-13', '1998-07-24','IT_PROG', '20');

select e.employee_id, j.job_title, DATEDIFF(h.end_date, h.start_date) AS num_days
from employees e
join jobs j on e.job_id = j.job_id
join job_history h on e.employee_id = h.employee_id
where e.department_id ='30';

-- insert into departments (department_id, department_name, manager_id, location_id) values ('10', 'Administration', '200', '1100');
-- insert into jobs (job_id, job_title, min_salary , max_salary ) values ('MK_MAN', 'Marketing Manager', '9000', '18000');
-- insert into countries (country_id, country_name, region_id) values ('DE', 'Germany', '1');
-- insert into locations (location_id, street_address, postal_code, city, state_province, country_id) values
-- ('1000', '1297 Via Cola di Rie', '989', 'Roma', null, 'IT');
-- insert into employees (employee_id, first_name, last_name, email, phone_number, hire_date, job_id, salary, commission_pct, manager_id, department_id) 
-- values ('100', 'Steven', 'King', 'SKING', '515-1234567', '1987-06-17','ST_CLERK', '2400.00','0.00', '109','10');

select d.department_name, CONCAT(e.first_name, ' ', e.last_name) AS manager_name, l.city, c.country_name
from departments d
join employees e on d.manager_id = e.manager_id
join locations loc on d.location_id = loc.location_id
join countries c on loc.country_id = c.country_id;

create table jobs (
    job_id varchar(10) primary key,
    job_title varchar(35)
);

create table job_salaries (
    job_id varchar(10),
    min_salary integer,
    max_salary integer,
    FOREIGN KEY (job_id) REFERENCES jobs(job_id)
);

create table job_grades (
    grade_level varchar(2) primary key,
    lowest_sale integer,
    highest_sal integer
);

alter table jobs
add column grade_level varchar(2),
add foreign key (grade_level) references job_grades(grade_level);









