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





