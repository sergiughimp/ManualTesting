-- Ex1: create 2 databases 1 - humanresources, 2 - marketing 
create database humanresources;
create database marketing;
-- Ex2: delete database 2 - marketing
drop database marketing;
-- Ex3: create 3 tables. "employee", "reward" and "holidays" with follow columns
-- employee table: employee_id, first_name, last_name, salary, joining_date
-- reward table: employee_ref_id, date_reward, amount
-- holiday table: holiday_name, holiday_date
use humanresources;

create table employee(employee_id int, first_name varchar(255), last_name varchar(255), salary int, joining_date date);
create table reward(employee_ref_id int, date_reward date, amount int);
create table holiday(holiday_name varchar(255), holiday_date date);

show tables;
select * from employee;
select * from reward;
select * from holiday;

-- Ex4: add 2 new columns "Department" and "Birthdate" to the "employee" table
 alter table employee add department varchar(255);
 alter table employee add birthdate date;
 
 -- Ex5: remove the "birthdate" column from the "employee" table
 alter table employee drop column birthdate;
 
 -- Ex6: delete the "holiday" table
 drop table holiday;
 drop table employee;
 drop table reward;
 -- Ex7: Fill the tables with the data:
 
insert into employee(employee_id, first_name, last_name, salary, joining_date, department)
values(1, "Bob", "Kinto", 1000000, "2019-01-20", "Finance");
insert into employee(employee_id, first_name, last_name, salary, joining_date, department)
values(2, "Jerry", "Kansxo", 6000000, "2019-01-15", "IT");
insert into employee(employee_id, first_name, last_name, salary, joining_date, department)
values(3, "Philip", "Jose", 8900000, "2019-02-05", "Banking");
insert into employee(employee_id, first_name, last_name, salary, joining_date, department)
values(4, "John", "Abraham", 2000000, "2019-02-25", "Insurance");
insert into employee(employee_id, first_name, last_name, salary, joining_date, department)
values(5, "Michael", "Mathew", 2200000, "2019-02-28", "Finance");
insert into employee(employee_id, first_name, last_name, salary, joining_date, department)
values(6, "Alex", "Chreketo", 4000000, "2019-05-10", "IT");
insert into employee(employee_id, first_name, last_name, salary, joining_date, department)
values(7, "Yohan", "Soso", 1230000, "2019-06-20", "Banking");
  
insert into reward(employee_ref_id, date_reward, amount)
values(1, "2019-05-11", 1000);
insert into reward(employee_ref_id, date_reward, amount)
values(2, "2019-02-15", 5000);
insert into reward(employee_ref_id, date_reward, amount)
values(3, "2019-04-22", 2000);
insert into reward(employee_ref_id, date_reward, amount)
values(1, "2019-06-20", 8000);

-- Ex8: Get all employees records from the database
select * from employee;

-- Ex9: Display the first name and last name of all employees
select first_name, last_name from employee;

-- Ex10: Get all employees in ascending order by first name
select * from employee order by first_name asc; 

-- Ex11: Get all employees in ascending order by fisrt name and descending order by salary
select * from employee order by first_name asc, salary desc;

-- Ex12: Get employees whose first name is "Bob"
select * from employee where first_name = "Bob";

-- Ex13: Get all the details of employees whose salary is over 3000000
select * from employee where salary > 3000000;

-- Ex14: Get all the details of the employees who joined before March 1, 2019
select * from employee where joining_date < "2019-03-01";

-- Ex15: Get how many employees records exists in the table
select count(*) from employee;

-- Ex16: Get the average salary value
select avg(salary) from employee;
 
-- Disable Safe Update Mode 
SET SQL_SAFE_UPDATES = 0;

-- Ex17: Raise "Kansxo"'s salary to 8880000
update employee set salary = 8880001 where last_name = "Kansxo";
select * from employee;

-- Ex18: Remove the employees who are from the "Banking" department
delete from employee where department = "Banking";

-- Ex19: Get the TOP salary of employees
select salary from employee order by salary limit 2;

-- Ex20: Get the difference between the "joining_date" and "date_reward" column (join is needed)
select * from employee;
select * from reward;

select r.date_reward - e.joining_date from employee e join reward r on e.employee_id = r.employee_ref_id;

-- Ex21: Get the first name, the reward amount for employees who have rewards with an amount greater than 2000 (join is needed)
select e.first_name, r.amount from employee e join reward r on e.employee_id = r.employee_ref_id where r.amount > 2000;

-- Ex22: Get the employee's first name, the reward amount from employees who have rewards (join in needed)
select e.first_name, r.amount from employee e join reward r on e.employee_id = r.employee_ref_id where r.amount is not null;

