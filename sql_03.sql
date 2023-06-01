-- TOPICS : JOIN,auto increment

SELECT * FROM manager;
-- FINDING SECOND LARGEST SALARY 
SELECT NAME ,SALARY FROM MANAGER ORDER BY SALARY DESC LIMIT 1,1;
-- # NAME, SALARY
-- 'raj', '5000000'
SELECT NAME ,SALARY FROM MANAGER ORDER BY SALARY DESC LIMIT 1,2;
-- # NAME, SALARY
-- 'raj', '5000000'
-- 'rizwana', '4000000'
SELECT NAME ,SALARY FROM MANAGER ORDER BY SALARY DESC LIMIT 2,1;
-- NAME, SALARY
-- rizwana	4000000
SELECT NAME ,SALARY FROM MANAGER ORDER BY SALARY LIMIT 0,1;
-- # NAME, SALARY
-- 'aleefa', '200000'

-- first need to order by then first parameter ---which row you want indexing from "0"...........................
-- 							second parameter ---no of rows you want from yhat index...........................
CREATE TABLE orders1(id INT,o_date DATE,c_id INT);
CREATE TABLE customer1(cus_id INT,cus_name VARCHAR(30),contact_name VARCHAR(30),country VARCHAR(30));
INSERT INTO orders1 VALUES (110,'2023-5-1',200),(111,'2023-5-2',201),(112,'2023-5-3',202),(113,'2023-5-4',203),(114,'2023-5-5',204);
INSERT INTO customer1 VALUES (200,'ram','raj','india'),(206,'ramya','rajesh','usa'),(202,'suraj','john','india'),(209,'sam','pal','russia'),(203,'raghu','somu','japan');
SELECT * FROM orders1;
SELECT * FROM customer1;
-- inner join/join
SELECT orders1.id,customer1.cus_name,orders1.o_date FROM orders1
INNER JOIN customer1 ON orders1.c_id=customer1.cus_id;
-- # id, cus_name, o_date
-- '110', 'ram', '2023-05-01'
-- '112', 'suraj', '2023-05-03'
-- '113', 'raghu', '2023-05-04'

create table staff(s_id int,s_name varchar(30),s_age int,s_package int);
create table payment(p_id int,p_date date,staff_id int,amt int);
insert into staff values (110,'ram',25,2000000),(11,'raj',35,2000000),(112,'sam',55,3000000),(113,'john',25,2000000),(114,'roja',25,4000000);
insert into payment values (200,'2023-5-1',110,200000),(201,'2023-5-1',112,60000),(200,'2023-5-1',113,2000000),(200,'2023-5-1',115,2000000),(200,'2023-5-1',121,2000000);
SELECT * FROM  staff;
SELECT * FROM  payment;
-- ************************************without using inner join keyword................................***********************************
select s_id,s_name,s_age,amt from staff s,payment p where s.s_id=p.staff_id;
-- # s_id, s_name, s_age, amt
-- '110', 'ram', '25', '200000'
-- '112', 'sam', '55', '60000'
-- '113', 'john', '25', '2000000'

alter table orders1 add shipping_id int;
update  orders1 set shipping_id=1234 where id=110;
update  orders1 set shipping_id=1235 where id=111;
update  orders1 set shipping_id=1236 where id=112;
update  orders1 set shipping_id=1237 where id=113;
update  orders1 set shipping_id=1238 where id=114;
create table shipping(shipping_id int,name varchar(30));
insert into shipping values(1234,'raj'),(1235,'sam'),(1237,'suraj'),(1238,'maggy');
delete from shipping  where shipping_id=1236;
select * from shipping;

-- joining of three tables orders1,shipping ,customer1
select orders1.id,customer1.cus_name,shipping.name from (
(orders1 inner join customer1 on orders1.c_id = customer1.cus_id)
inner join shipping on orders1.shipping_id=shipping.shipping_id);
-- # id, cus_name, name
-- '110', 'ram', 'raj'
-- '113', 'raghu', 'suraj'

-- LEFT JOIN OF ORDERS1 AND CUSTOMER1 
SELECT CUSTOMER1.CUS_NAME,ORDERS1.ID FROM CUSTOMER1 LEFT JOIN ORDERS1 ON CUSTOMER1.CUS_ID = ORDERS1.C_ID;
-- # CUS_NAME, ID
-- 'ram', '110'
-- 'suraj', '112'
-- 'raghu', '113'
-- 'ramya', NULL
-- 'sam', NULL

-- IF WE EXECUTE ALL SELECT AT ONCE WE WILL GET A RIBBON OF ALL TABLES SIDE BY SIDE
SELECT * FROM SHIPPING;
SELECT * FROM CUSTOMER1;
SELECT * FROM ORDERS1;
SELECT CUS_NAME,COUNTRY,O_DATE FROM CUSTOMER1 RIGHT JOIN ORDERS1 ON CUSTOMER1.CUS_ID=ORDERS1.C_ID;
-- # CUS_NAME, COUNTRY, O_DATE
-- 'ram', 'india', '2023-05-01'
-- 'suraj', 'india', '2023-05-03'
-- 'raghu', 'japan', '2023-05-04'
-- NULL, NULL, '2023-05-02'
-- NULL, NULL, '2023-05-05'

-- ORDER BY WITH LEFT JOIN
SELECT CUSTOMER1.CUS_NAME,ORDERS1.ID FROM CUSTOMER1 LEFT JOIN ORDERS1 ON CUSTOMER1.CUS_ID = ORDERS1.C_ID ORDER BY CUS_NAME;
-- # CUS_NAME, ID
-- 'raghu', '113'
-- 'ram', '110'
-- 'ramya', NULL
-- 'sam', NULL
-- 'suraj', '112'
-- LIKE + ORDER BY +LEFT JOIN..........LIKE WORKS WITH WHERE CLAUSE..........
SELECT CUSTOMER1.CUS_NAME,ORDERS1.ID FROM CUSTOMER1 LEFT JOIN ORDERS1 ON CUSTOMER1.CUS_ID = ORDERS1.C_ID WHERE CUS_NAME LIKE 'S%' ORDER BY CUS_NAME;
-- error..................................on full join.............
select customer1.cus_name,orders1.id from customer1 full join orders1 on customer1.cus_id=orders1.c_id;
-- remove costomer1.cus_name to cus_name no need of table.column...................................
select cus_name,orders1.id from customer1 full join orders1 on cus_id=orders1.c_id;
-- # cus_name, id
-- 'ram', '110'
-- 'suraj', '112'
-- 'raghu', '113'
SELECT CUSTOMER1.CUS_NAME,ORDERS1.ID FROM CUSTOMER1 LEFT JOIN ORDERS1 ON CUSTOMER1.CUS_ID = ORDERS1.C_ID ORDER BY CUS_NAME 
union
SELECT CUS_NAME,COUNTRY,O_DATE FROM CUSTOMER1 RIGHT JOIN ORDERS1 ON CUSTOMER1.CUS_ID=ORDERS1.C_ID;
-- full outer join/full join
-- normal join/join/inner join


-- auto must be on primary key................no two primary keys
create table tset(id int primary key not null,c2 varchar(30) not null,c3 varchar(30) default 'software engineer',roomno int not null auto_increment);
-- Error Code: 1075. Incorrect table definition; there can be only one auto column and it must be defined as a key
create table tset(id int primary key not null  auto_increment,c2 varchar(30) not null,c3 varchar(30) default 'software engineer');
-- to change the default value of auto which starts at 0 then use this...................
alter table test AUTO_INCREMENT = 100;
-- we will get error by inserting like this so insert for specified cols excluding auto increment col...............................
insert into tset values(200,'a','b');
insert into tset values(23,'nb','b');

insert into tset (c2,c3)values('surya','chandra'),('raja','rani');
select * from tset;
-- # id, c2, c3
-- '23', 'nb', 'b'
-- '200', 'a', 'b'                                    
-- '201', 'ram', 'ramya'              ...................    incremented by 1 from previous value
-- '202', 'surya', 'chandra'
-- '203', 'raja', 'rani'
-- IN MYSQL- AUTO_INCREMENT
-- SQL SERVER-IDENTITY(10,5)---(START,STEP)
-- ORACLE--CREATE SEQUENCE SEQ MINVALUE 1 START WITH 1 INCREMENT BY 1;
--         INSERT INTO TEST ID,NAME VALUES(SEQ.ID,'ALLL');