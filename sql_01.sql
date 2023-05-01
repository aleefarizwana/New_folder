-- RETURNS ALL THE DATABASES IN A SCHEMA
show databases;
SELECT * FROM test;


UPDATE RGM SET NAME='ALEEFA' WHERE Contact = 29844311;
UPDATE RGM SET NAME='sam' WHERE Contact = 29844311;

-- TO UPDATE MULTIPLE ENTRIES BY USING , (comma)
UPDATE RGM SET Session='java', Address='kurnool' WHERE Contact = 29844311;

SELECT * FROM herovired.rgm;

-- TO COPY INTO ANOTHER TABLE
CREATE TABLE TEST(s_ID INT PRIMARY KEY,s_name varchar(30),s_marks int);
INSERT INTO TEST SELECT * FROM STUDENT;

-- TO DELETE DATA
TRUNCATE TABLE TEST;

-- to delete particular record
SELECT * FROM student;
delete from student where name="sravani";

-- delete whole table structure,data
create table st(name varchar(30));
drop table st;

-- change column name
ALTER TABLE rgm_student rename ID TO s_id;
alter table student rename to rgm_student;
SELECT * FROM rgm_student;

create database sun;
drop database sun;

alter table rgm_student add address varchar(30);
update rgm_student set address='hyd' where id=27;  
-- got error here for upadate cmd

alter table rgm_student drop column address;

-- SELECT
select min(marks) from rgm_student;
select max(marks) from rgm_student;
select count(marks) from rgm_student;
select sum(marks) as total from rgm_student; 
select avg(marks) from rgm_student;

create database EXERCISE;
SELECT * FROM CUSTOMER;
CREATE TABLE CUSTOMER(C_ID INT PRIMARY KEY,C_NAME VARCHAR(30),C_CITY  VARCHAR(30),GRADE INT,S_ID INT);
INSERT INTO CUSTOMER VALUES(102,'RAJ','DELHI',97,202),(103,'SAM','KOLKATA',97,203),(104,'SOWJANYA','DELHI',97,203),(105,'RADHA','CHENNAI',95,205)
,(106,'SOHA','SIKKIM',87,206)
,(107,'DORA','MANIPUR',77,207)
,(108,'ALEEFA','KOLKATA',98,208)
,(109,'ROOHIYA','BENGALURU',98,209),
(110,'REHANA','HYD',98,210);

-- WRITE SQL QUERY TO FIND DETAILS OF CUSTOMERR WHOSE GRADE OF *****ABOVE*** HUNDRED;
SELECT * FROM CUSTOMER WHERE GRADE>100;
SELECT * FROM CUSTOMER WHERE GRADE>=100 ORDER BY GRADE ASC;
SELECT * FROM CUSTOMER WHERE C_CITY="HYD" AND GRADE <=100;
SELECT C_NAME FROM CUSTOMER WHERE C_CITY='HYD' OR GRADE>100;

-- WHO ARE EITHER FROM KERALA OR GRADE NOT MORE THAN 100
SELECT * FROM CUSTOMER WHERE C_CITY='KERALA' OR NOT GRADE >90;
SELECT * FROM CUSTOMER WHERE C_CITY='KERALA' OR GRADE <=90;

-- WRITE AN SQL QUERY TO IDENTIFY WHO DO***** NOT***** BELONG TO CITY MUMBAI OR HAVE A GRADE********** THAT EXCITES 200***********
-- ANS EVEN IF GRADE <200 ALSO IF CITY NOT EQUAL TO MUMBAI
SELECT * FROM CUSTOMER WHERE  NOT C_CITY='MUMBAI' OR GRADE>200;

CREATE TABLE orders(o_no int,purchase_amt int,o_date date,c_id int,s_id int);
insert into orders values(2002,1000,'2023-04-23',100,200),(2003,1100,'2023-04-25',101,201),(2003,1200,'2023-04-30',102,202),(2005,1300,'2023-05-28',104,204);
select * from orders;
-- find the order details excluding date 30-04-20203 and s_id more than 202 or purchase_amt greater than 1000

create table sales_man(s_id int primary key,name varchar(30),city varchar(30),comission float);
select * from sales_man;
insert into sales_man values(200,'aleefa','kolkata',0.2),(201,'rizwana','delhi',0.23),(202,'sam','hyd',0.29),(203,'raj','assam',0.42);
-- details of customer whose comission within range of 0.23 to 0.43
select * from sales_man where comission between 0.23 and 0.43;
-- saleman name stars with letter k
select * from sales_man where name like "r%";


-- create a new column address ,insert some data in that address column and display all address as "salesman_address" in descending order
alter table sales_man add column address varchar(30);

update sales_man set address='assam' where s_id=200;
update sales_man set address='hyd' where s_id=203;
update sales_man set address='kolkata' where s_id=201;


-- why alter command is reporting an error
-- you have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'to test100' at line 1	0.000 sec
select address as salesman_address from salesman order by address desc;
create table test1 (name varchar(30));

-- cant use alter to change column name.........................................
alter table test1 rename name to sname varchar(30);

-- change is used..............
alter table test1 change column name  sname varchar(30);

-- datatype of new column need to be specified............for CHANGE command.................
alter table test1 change sname  pname varchar(30);

-- change cmd dont need column..... keyword..................

select * from test1;
-- to rename table name use rename cmd......................
alter table test1 rename test100;
alter table test100 rename to test2000;
-- in ....to.........keyword is optional.............

