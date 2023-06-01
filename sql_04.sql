-- ______________sql task_______________________
-- Question 1 - 
-- Write the queries for the following tasks - 
-- Create a database name - “Employee”.
-- Create a table name - “Employee Details”.
-- Insert 10 details in the “Employee Details” table  - 
-- Emp_id
-- Emp_name
-- Job_name
-- Manager_id
-- Hire_date
-- Salary
-- Dep_id

-- Sample Output - 

-- emp_id | emp_name | job_name  | manager_id | hire_date  | salary  | dep_id
-- --------+----------+-----------+------------+------------+---------+----------+---------+-----------
-- 68319 |   Mr. Singh  |   PRESIDENT |      68319      | 1991-11-18 | 6000 |  1001

-- Find the salaries of all the employees from the “Employee Details” table.
-- Find the unique designations of the employees from the table.
-- Change the salary where the emp_name is “Raj”.



-- Question 2 - 
--  	Write the queries for the following tasks - 
-- Create a database name - “Football”.
-- Create a table name - “Football venue ”.
-- Insert 10 details in the “Football Venue” table  - 
-- venue_id
-- venue_name
-- city_id
-- capacity
-- Sample Output - 
--  venue_id |       venue_name        | city_id | capacity
-- -------------+-----------------------------+----------+----------
--     20001 |             France               |   10003 |  42115

-- 		  4. Count the number of venues of the football world cup
-- 		  5. List all the venue names and capacities in the format of “Location” and “Volume”.

-- Sample Output - 
--   Location        | Volume
-- ------------------+----------
--     Argentina   |   100034
--    Spain           |   272726
-- 6. Delete all the details where venue_name is equal to “Australia” 


-- ________________________________________________________________________________________________________________________________________________________________________________________
create database EMPLOYEE;
create table EMPLOYEE_details (emp_id int primary key,emp_name varchar(30),job_name varchar(30),manager_id int ,hire_date date,salary int,dep_id int);
insert into EMPLOYEE_details values(1001,'ram','manager',201,'2003-12-1',200000,4001),(1002,'raj','team head',202,'2003-12-18',4000000,4002),(1003,'paul','head',203,'2003-12-16',2000000,4002),(1004,'lavanya','manager',204,'2003-12-5',2800000,4003),(1005,'sowmya','headoftesting',205,'2003-2-4',20000,4001),(1006,'sana','manager',206,'2003-10-12',50000,4003);
insert into EMPLOYEE_details values(1010,'ramya','manager',210,'2003-1-3',400000,4001),(1009,'john','team head',209,'2003-12-17',4000000,4002),(1008,'maggy','trainer',208,'2003-12-16',2000000,4008),(1007,'lavan','manager',207,'2003-8-5',2500000,4002);

select emp_name,salary from  EMPLOYEE_details;
-- # emp_name, salary
-- 'ram', '200000'
-- 'raj', '4000000'
-- 'paul', '2000000'
-- 'lavanya', '2800000'
-- 'sowmya', '20000'

select emp_name,job_name distint  from employee_details;
-- # emp_name, distint
-- 'ram', 'manager'
-- 'raj', 'team head'
-- 'paul', 'head'
-- 'lavanya', 'manager'
-- 'sowmya', 'headoftesting'

update employee_details set salary=20000 where emp_name='raj';

create database Football;
create table Football_venue (venue_id int,venue_name varchar(30), city_id int,capacity int);
insert into football_venue values(301,'france',518,42389),(302,'australia',528,46389),(303,'russia',521,432389),(304,'india',548,92389),(305,'spain',598,92389);
insert into football_venue values(310,'england',519,10389),(309,'australia',528,478389),(308,'russia',556,56389),(307,'spain',568,39389),(306,'africa',578,82389);

select count(venue_id) from football_venue;
-- # count(venue_id)
-- '10'

select venue_name  as Location ,capacity as Volume from Football_venue;
-- # Location, Volume
-- 'france', '42389'
-- 'australia', '46389'
-- 'russia', '432389'
-- 'india', '92389'
-- 'spain', '92389'

delete from  Football_venue where venue_name ='Australia';

-- _____________________________________________________________________________________________________________________________________________________________________________________________
                               -- views
--  to store a copy of data to work with...................VIRTUAL TABLE/DUPLICATE TABLE.....................                              
show databases;
select * from customer;

create view aleefa as select * from customer;
select * from aleefa;

CREATE VIEW ROOHIYA AS SELECT C_ID,C_NAME,S_ID FROM CUSTOMER WHERE C_CITY='DELHI';
-- _____________________________CREATING INDEX__________________________________________________
CREATE INDEX RAHIL ON customer(C_CITY);
-- _________________________________________________________________________________________________
-- workimg with sql+python
1. connection ith sql be done before writing code once int he beginning...........................
import mysql.connector
mydb=mysql.connector.connect(host='localhost',user='root',password='Aleefa@2003')
print(mydb.connection_id)

2.creating database.........................
import mysql.connector
mydb=mysql.connector.connect(host='localhost',user='root',password='Aleefa@2003')
print(mydb.connection_id)
cur=mydb.cursor()
cur.execute('create database aleefa')

3.creating table..........................
t='create table swap(emp_id integer(4),emp_name varchar(30),salary integer(30))'
cur.execute(t)
print('table created successfull....to check go to cmd prompt..')
 
 4.insert data..................................
z='insert into swap (emp_id,emp_name,salary) values(%s,%s,%s)'
a=(100,'sam',10000)
cur.execute(z,a)
mydb.commit()

5.inserting multi values.......................
z='insert into swap (emp_id,emp_name,salary) values(%s,%s,%s)'
a=[(101,'samya',20000),(101,'ramya',23000)]
cur.executemany(z,a)
mydb.commit()
print("executed...")

6.update records............................
s='update swap set salary=20 where emp_id=101'
cur.execute(s)
mydb.commit()
print("updated")

7.fetch data.....................................
f='select * from swap'
cur.execute(f)
display=cur.fetchall()
for x in display:
    print(x)

#f='select * from swap where emp_id=101'
8.delete record....................................
s='delete from swap where emp_id=100'
cur.execute(s)
mydb.commit()
print("deleted")