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
 
 /* 
 31st Aug 2024
1. Groupby functions in SQL
2. Merge(Union) and Join functionalities in SQL
3. Understanding of Subqueries

1st Sep 2024
4. Window Functions
5. Interview Questions
6. Assessment
 */
 
select jobtitle,avg(salary) as AvgSal
from empsalary
group by jobtitle
# where avg(salary)>50000; 
having avg(salary)> 20000 # To filter or search from calculated data
order by AvgSal desc;


/*                 JOINs
1. Inner Join
2. Full/Outer Join
3. Right Join
4. Left Join
5. Outer Join
6. Self Join
*/

# INNER JOIN
select emp.empid,firstname,jobtitle,salary
from emp             # Left table/Table-1/Table-A
inner join empsalary # Right Table/Table-2/Table-B
on emp.empid=empsalary.empid
where salary>40000
order by salary desc;

# RIGHT JOIN
select emp.empid,firstname,jobtitle,salary
from emp             # Left table/Table-1/Table-A
right join empsalary # Right Table/Table-2/Table-B
on emp.empid=empsalary.empid;

# LEFT JOIN
select emp.empid,firstname,jobtitle,salary
from emp             # Left table/Table-1/Table-A
left join empsalary # Right Table/Table-2/Table-B
on emp.empid=empsalary.empid;

# full JOIN
select firstname,jobtitle,salary
from emp             # Left table/Table-1/Table-A
full join empsalary; # Right Table/Table-2/Table-B


# UNION and UNION ALL
select empid,firstname,age from emp
UNION ALL
select * from empsalary;

# Subqueries
# Types of Subqueries: 1. Select, 2. from , 3. Where

# subquery into SELECT statement
select empid,salary,
                  (select avg(salary) 
                   from empsalary) as avgsala
from empsalary;
 # Subquery into FROM statement
select newtable.empid,avgall
from (
      select empid,salary, avg(salary) over() as avgall 
	  from empsalary) as newtable;
 
 # Subquery into WHERE statement
 select empid,jobtitle, salary
 from empsalary
 where empid in (
                 select empid
                 from emp
                 where age>30
                 );
 
 
 
 
 
 
 
 
 
 
 
 