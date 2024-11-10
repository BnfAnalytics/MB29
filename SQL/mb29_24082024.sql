CREATE SCHEMA BADM29 ;              # To create a new schema
use mb29;                          # To select a particular database to use
select * from customers;            # To reterive a particular  full table

select customerid,customername,city # To select a particular columns only
from customers
Where city='London';