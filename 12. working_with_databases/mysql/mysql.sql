## just use '#' then start typing your statement that will be a comment
## 2. double line comment
/* use back slash and star '/*' at the beginning and at the end star and backslash 
then it will be a double line comment */
#3. showing the existing databases
SHOW DATABASES;
#after seeing the databases we need to add ';--> semicolon' to close the Query

# #4. create a database
CREATE DATABASE customer;

# #5.after creating a database we need to use that database to use and creating tables
USE customer;

# #6. checking up the tables
SHOW tables;

# #7. creating a new table
create table customer_info(id integer,
first_name varchar(10), last_name varchar(10),
region varchar(20), salary integer); 


# #8 getting the tables data
select * from customer_info;

# #9 dropping a database
drop database sium;

# #10 inserting values in the tables
insert into customer_info(id, first_name, last_name, region, salary) values (1, 'rhs', '2', 'dhaka', 50000);
insert into customer_info(id, first_name, last_name, region, salary) values (2, 'rhs', '6', 'china', 70000);

# #11. dropping the table ---> just use DROP table table_name;
drop table customer_info;

# #12. dropping the database 
drop database customer;

# #getting the final database 
show databases;

#13. creating a database customer and then a customer_info table including id, first_name, last_name, salary and id should should be primary key and auto increment
create database customer;
use customer;
create table customer_info(
id int auto_increment,
first_name varchar(25),
last_name varchar(25),
salary int,
primary key(id)

);

#14. getting the tables details
SELECT * FROM customer_info;

#15. inserting values in the customer_info tables
INSERT into customer_info(first_name, last_name, salary) values ('rhs','2', 50000);
INSERT into customer_info(first_name, last_name, salary) values ('rhs','6', 60000);
INSERT into customer_info(first_name, last_name, salary) values ('sio','r', 80000);
INSERT into customer_info(first_name, last_name, salary) values ('r','2', null);

# #16. Null is not means it is 0 means the column has missing values
# #17. retrive the null values
select * from customer_info where salary is null;

#18. getting all the values where salary is not null
SELECT * FROM customer_info WHERE salary is not null;

# #19. update statement to update the null values
UPDATE customer_info set salary = 50000 where id =4;

# #20. SQL delete statement 
DELETE from customer_info where id =4;

# #21. altering the tables 
# 1. add columns in existing table
alter table customer_info add email varchar(25);


#22. updating email for each column by using update method
update customer_info set email = 'rhs0@yahoo.com' where id =1;
update customer_info set email = 'rhs@yahoo.com' where id =2;
update customer_info set email = 'rhs6@yahoo.com' where id =3;
update customer_info set email = 'sium1@yahoo.com' where id =4;
update customer_info set email = 'rhs7@yahoo.com' where id =5;

# # 23 altering tables to add a new column 
alter table customer_info add dob date;

# #24. altering table and modify the column type
alter table customer_info modify dob year;

# <!-- #26. alter table to drop column
alter table customer_info drop column dob;

show databases;

#26. discuss about views
#views---> view is like a virtual table based on the result set of an sql query.

use customer;

#creating a new table name student

create table student(
student_id int auto_increment,
first_name varchar(25) not null,
last_name varchar(25) not null,
age int,
primary key(student_id)
);
select * from student;

#inserting values in the student tables
insert into student values (1, 'sio', '2', 31),
(2, 'rhs','6',30),(3,'rhs','2',40); 

create table department(
student_id int auto_increment,
department_name varchar(25) not null,
foreign key(student_id) references student(student_id)
);
desc department;
insert into department values(1, 'computer science'),
(2, 'electronics'), (3, 'mechanics');

select * from department;
select * from student;

#involves inner join 
#create views 
select first_name, last_name, age from student inner join department using (student_id);

#create view on that particular query #it will be virtual table 
create view student_info as select first_name, last_name, age from student inner join department using (student_id);

select * from student_info;

#dropping views
drop view student_info;

#can we write any kind query and write it as view? --> no,
#agg function, union, update statement, groupby, left outer join, right outer join, sub query not work on views

#for inner join it will work


#27. sql join
/* SQL JOINS
1. inner join
2. left join
3. right join
4. full join
5. natural join
6. cross join
*/

select * from student;

insert into student values(4, 'soad','r', 20);
select * from department;
insert into department values(4, 'english');

##1. inner join
#inner join takes only those which ever matching records it has 
select student.first_name, student.last_name, student.age, department.department_name from student inner join department 
on student.student_id = department.student_id;

##left join
#it will priorities the left table even if in the right hand side there is not value then it will give null
select student.first_name, student.last_name, student.age, department.department_name from student left join department 
on student.student_id = department.student_id;

#right join
#here the focus will go on the right hand side of the table
select student.first_name, student.last_name, student.age, department.department_name from student right join department
on student.student_id = department.student_id;

#for the insert we will have to focus on the primary key, otherwise child row for foreign key will be effected if we try to insert more values than primary key in the foreign key

##give priority on the both the table
#full outer join--> focus on the left join, focus on the right join then combine by union
#for implementing the full outer join we need to take right join and left join and in between we need to combine them by union

select student.first_name, student.last_name, student.age, department.department_name from student left join department 
on student.student_id = department.student_id
union
select student.first_name, student.last_name, student.age, department.department_name from student right join department
on student.student_id = department.student_id;

#5. cross join--> cross join will combine all the possible row and gives the outcome

select student.first_name, student.last_name, student.age, department.department_name from student 
cross join department;

delete from department where student_id =4;

#6 natural join---> it will give us the result of row based on the real value without giving any null values
select student.first_name, student.last_name, student.age, department.department_name from student 
natural join department;













