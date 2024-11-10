/*
1. Introduction to RDBMS
2. Setting up and using SQL
3. Searching and Filtering records
4. CRUD operations in SQL(C=create,R=Read,U=Update, D=Delete)
5. Aggreagte Functions (Sum,avg,count, min,max,var, st.dev etc)
*/
CREATE SCHEMA BADM29 ;              # To create a new schema
use mb29;                          # To select a particular database to use
select * from customers;            # To reterive a particular  full table

select customerid,customername,city # To select a particular columns only
from customers
Where city='London';

# Create a Table-1
Create table emp
(empid int,Firstname varchar(50),Lastname varchar(50),Age int,Gender varchar(50));
# Insert Data into the table
insert into emp values
(1001,'Jim','Halpert',30,'Male'), # First row
(1002,'Pam','Sharma',30 ,'Female'), # second row
(1003,'Dwight','Schrute',29,'Male'),
(1004, 'Angela', 'Martin', 31, 'Female'),
(1005, 'Toby', 'Flenderson', 32, 'Male'),
(1006, 'Michael', 'Scott', 35, 'Male'),
(1007, 'Meredith', 'Palmer', 32, 'Female'),
(1008, 'Stanley', 'Hudson', 38, 'Male'),
(1009, 'Kevin', 'Malone', 31, 'Male');

 select* from emp;
 
 # Task-1: Create a Table "empsalary" containing columns "empid","Jobtitle" and "Salary", then insert data into this table.
 
 create table empsalary
 (empid int,
 jobtitle varchar(50),
 salary int);
 
 select * from empsalary;
 
Insert into empsalary values
(1001, 'Salesman', 45000),
(1002, 'Receptionist', 36000),
(1003, 'Salesman', 63000),
(1004, 'Accountant', 47000),
(1005, 'HR', 50000),
(1006, 'Regional Manager', 65000),
(1007, 'Supplier Relations', 41000),
(1008, 'Salesman', 48000),
(1009, 'Accountant', 42000);

Insert into emp values
(1011,'Ryan','Howard',26, 'Male'),
(NULL, 'Holly','Flax',NULL,NULL),
(1013,'Darryl','Philbin',Null,'Male');

# Update and Delete

select* from emp;

update emp
set empid=1012
where firstname="Holly" and lastname="Flax";
 
 
update emp
set age=21, gender="Female"
where firstname="Holly" and lastname="Flax";

update emp
set age=35
where empid=1008;

# delete

delete from emp
where empid=1005;

 # Aggregations
 select count(empid) as CntEmp,sum(salary) as TSalary, avg(salary) as AvgSalary
 from empsalary;
 
 select * from empsalary;
 
 select jobtitle,avg(salary) as AvgSalary
 from empsalary
 group by jobtitle;
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 