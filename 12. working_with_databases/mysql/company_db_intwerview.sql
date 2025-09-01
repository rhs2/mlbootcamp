/*
SQL INTERVIEW QUESTION
1. COMPANY DATABASE 
-- Employee Table
----feature
-----1. empid--int--primary key
-----2. first_name varchar
-----3. last_name varchar
-----4. salary int
-----5. joining_date datetime
-----6. department
--Bonus table
-----1. emp_ref_id --int-- foreign key ref to Employee(empid)
-----2. bonus_date datetime
-----3. bonus_amount int
--Employee designation
-----1. emp_ref_id foreign key
-----2. designation
-----3. designation date
*/
#creating Company database
CREATE DATABASE Company;
USE Company;

#create Employee table
CREATE TABLE Employee(
empid int not null primary key auto_increment,
first_name varchar(25),
last_name varchar(25),
salary int,
joining_date datetime,
department varchar(25)
);

#see the schema 
desc Employee;

-- drop table Bonus;
#Create Bonus table
CREATE TABLE Bonus(
emp_ref_id int,
bonus_date datetime,
bonus_amount int,
foreign key(emp_ref_id) references Employee(empid)
on DELETE CASCADE
);

#see the schema 
desc Bonus;
#forget to add not null in the emp_ref_id so use alter method to do that
alter table Bonus modify emp_ref_id int not null;

-- drop table Designation;
#create designation table
CREATE TABLE Designation(
emp_ref_id int not null,
designation varchar(25),
designation_date datetime,
FOREIGN key(emp_ref_id) references Employee(empid)
ON DELETE CASCADE
);
desc Bonus;


#Inserting values in the Employee tables
insert into Employee values
(0001, 'hasan','sio', 50000, '2024-05-02 09:00:00', 'Artificial Intelligence'),
(0002, 'rhs','2', 70000, '2024-05-20 09:00:00', 'Software Engineer '),
(0003, 'soad','hasan', 80000, '2023-05-12 09:00:00', 'Accountant '),
(0004, 'simu','2', 90000, '2022-05-02 09:00:00', 'HR '),
(0005, 'simu','6', 85000, '2025-05-02 09:00:00', 'HR'),
(0006, 'hasan','berlin', 80000, '2025-05-03 09:00:00', 'Data Scientist'),
(0007, 'Palermo','2', 65000, '2021-05-01 09:00:00', 'Artificial Intelligence');
select * from Employee;
insert into Employee values(0009, 'Palermo','101', 65000, '2021-05-01 09:00:00', 'Artificial Intelligence'); 

select * from Bonus;
#insert values into Bonus
insert into Bonus values
(0001, '2024-09-02 09:00:00', 5000),
(0002, '2024-07-02 09:00:00', 7000),
(0001, '2025-01-02 09:00:00', 5000),
(0004, '2025-01-02 09:00:00', 7000),
(0003, '2025-01-02 09:00:00', 4000),
(0005, '2025-01-02 09:00:00', 5000),
(0007, '2025-01-02 09:00:00', 5000),
(0008, '2025-01-02 09:00:00', 5000),
(0006, '2025-01-02 09:00:00', 3000);
desc Bonus;

select * from Bonus;
desc Designation;
#insert values into designation
insert into Designation values
(0001, 'Senior AI Engineer','2025-01-02 09:00:00'),
(0002, 'Senior Software Engineer','2025-01-02 09:00:00'),
(0003, 'Senior Accountant','2025-01-02 09:00:00'),
(0004, 'Senior HR MANAGER','2025-01-02 09:00:00');

SELECT * FROM Designation;
#SQL INTERVIEW QUESTION
use Company;
##EASY QUERY
#1. Write a sql query to retrieve all details where first name from employee in the table starts with 's'
select * from Employee where first_name like 's%';

#2. #1. Write a sql query to retrieve all details where first name from employee in the table ends with 'o'
select * from Employee where first_name like '%o';
#this '% means before % any letter means it will start with that letter and ends with anything but after % it means the words ends with that letter and in between %s% it means s is inside the words '

##2. Write a sql query to print all details of the employees whose salary between 10000 to 60000

select * from Employee where salary between 10000 and 60000;
#query 2 
select * from Employee where (salary> 10000 and salary < 60000);

#inner query
#get first name and last name combine
select concat(first_name ,' ',last_name) as Emp_name, salary from Employee
where empid in 
(select empid from Employee where salary between 10000 and 60000); 

##3. SQL query to retrieve details of the employee who have joined on a date
#MAY 2024
select * from designation;
select * from Employee where year(joining_date) = '2024' and month(joining_date)= '05'; 

##4. sql query to fetch number of employee in every department
select count(*), department as department from Employee group by department;

#5.sql query print details of the employee who are also senior hr manager
select Employee.first_name from Employee 
inner join designation
on Employee.empid = designation.emp_ref_id 
and designation.designation = 'Senior HR Manager';

#we can write in keyword instead of using = and for in we need to wrap that in('Senior HR Manager')

##6. sql query to clone a new table from another table
CREATE Table rhs like Employee; #without information
select * from rhs;

#this is the way i can clone a entire tables
Create table sio as
select * from Employee;
select * from sio;


#7. SQL query to show up top n salary of a employee
select * from Employee order by salary desc limit 4;

#8. sql query to determine the 4th highest salary
-- select * from Employee order by salary asc limit 4;
-- select * from Employee order by salary desc limit (n-1,1);
select * from Employee order by salary desc limit 4,1;

## 9. sql query to determine the 6th highest salary without using limit

SELECT salary
FROM (
    SELECT salary, ROW_NUMBER() OVER (ORDER BY salary DESC) AS row_num
    FROM Employee
) t
WHERE row_num = 6;

select * from Employee;




