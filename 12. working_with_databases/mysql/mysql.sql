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







