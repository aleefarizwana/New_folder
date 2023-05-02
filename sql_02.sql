create table car(c_no int,c_name varchar(30),c_price int,c_quantity int);
insert into car values(12,'audi',12000000,2),(13,'tesla',20000000,4),(14,'tata sumo',4000000,3);
insert into car values(15,'tata nano',5000000,2),(16,'bmw',20000000,4),(17,'kia',4000000,3);
select * from car;

select count(c_name),c_price from car group by c_price;
select count(c_name) as c_no,c_price from car group by c_price;
select c_price from car group by c_price;
-- error on aggregated col..................
-- select * from car group by c_price;
select count(c_name) from car group by c_price having c_price>=12000;
select count(*),c_name from car group by c_price having c_price>=12000000;

create table visit(entry_date date,price int,duration int);
insert into visit values ('2023-5-1',1000,20),('2023-5-1',2000,40),('2023-5-2',3000,50),('2023-5-2',6000,60),('2023-5-4',800,10);
insert into visit values ('2023-7-1',1000,20),('2023-6-2',2000,40),('2023-7-2',4000,40);
select * from visit;

select entry_date,count(*) from visit group by entry_date;

-- round upto no of decimal values;
select EXTRACT(year from entry_date) as year,
EXTRACT(month from entry_date) as month,
ROUND(AVG(price),4) from visit group by EXTRACT(year from entry_date),EXTRACT(MONTH FROM entry_date);

 -- OUTPUT
-- 	year	month	ROUND(AVG(price),4)
-- 	2023	5	2560.0000
-- 	2023	6	2000.0000
-- 	2023	7	2500.0000


SELECT EXTRACT(YEAR FROM ENTRY_DATE) AS YEAR ,
EXTRACT(MONTH FROM ENTRY_DATE) AS MONTH,
ROUND(AVG(PRICE),3) FROM VISIT
GROUP BY EXTRACT(YEAR FROM ENTRY_DATE),EXTRACT(MONTH FROM ENTRY_DATE)
ORDER BY EXTRACT(YEAR FROM ENTRY_DATE) ,EXTRACT(MONTH FROM ENTRY_DATE)DESC;

--  OUTPUT
-- 	year	month	ROUND(AVG(price),4)
-- 2023	7	2500.000
-- 2023	6	2000.000
-- 2023	5	2560.000

-- FIND AVG OF THOSE WHOSE ENTRY DATE IS SAME.............
SELECT ENTRY_DATE,ROUND(AVG(PRICE),3) AS AVG_PRICE FROM VISIT GROUP BY ENTRY_DATE HAVING COUNT(*)>1 ORDER BY ENTRY_DATE;

-- OUTPUT
-- 	ENTRY_DATE	AVG_PRICE
-- 	2023-05-02	4500.000
-- 	2023-05-01	1500.000

-- GROUP ONLY WHEN DURATION GREATER THAN EQUAL TO 20                          @@@@@SAME OUTPUT FRO ALL....??
SELECT ENTRY_DATE,ROUND(AVG(PRICE),3) AS AVG_PRICE FROM VISIT WHERE DURATION>=20 GROUP BY ENTRY_DATE HAVING COUNT(*)>1 ORDER BY ENTRY_DATE;
-- OUTPUT
-- ENTRY_DATE, AVG_PRICE
-- 2023-05-01	1500.000
-- 2023-05-02	4500.000

SELECT C_CITY,COUNT(*) AS CUSTO_CITY FROM CUSTOMER group by C_CITY;


-- ........................... HAVING............................................................................

CREATE TABLE EMPLOYEE (e_id int,e_name varchar(30),e_age int,e_country varchar(30));
insert into EMPLOYEE values(100,'aleefa',25,'india'),(101,'rizwana',25,'usa'),(102,'sam',35,'australia'),(103,'ameena',45,'indonesia'),(104,'raj',25,'usa'),(105,'suraj',35,'india');
select * from EMPLOYEE;
SELECT E_COUNTRY,COUNT(E_COUNTRY) FROM EMPLOYEE GROUP BY E_COUNTRY HAVING COUNT(E_COUNTRY)>=2;

-- E_COUNTRY, COUNT(E_COUNTRY)
-- india	  2
-- usa	      2
SELECT E_NAME,E_COUNTRY,COUNT(E_COUNTRY) FROM EMPLOYEE group by E_COUNTRY HAVING MAX(E_AGE)>=2;
-- ERROR OF NO AGGREGATED COL

SELECT E_COUNTRY,COUNT(E_COUNTRY) FROM EMPLOYEE group by E_COUNTRY HAVING MAX(E_AGE)>=20;

-- E_COUNTRY, COUNT(E_COUNTRY)
-- 'australia',  '1'
-- 'india',      '2'
-- 'indonesia',  '1'
-- 'usa',       '2'

CREATE TABLE MANAGER (id int,name varchar(30),gender varchar(30),age int,salary int);
insert into manager values(100,'aleefa','F',25,200000),(101,'rizwana','F',25,4000000),(102,'sam','f',35,80000000),(103,'aman','g',45,1000000),(104,'raj','G',25,5000000);
select * from EMPLOYEE;

select sum(salary) as total,name from manager group by name having sum(salary)>1000000 order by name desc;
-- order by only for ordering desc,asc based on aplhabets or numbers................................
-- here even only one rizwana in table here salary is greater than 1000000...........................
-- # total, name
-- '80000000', 'sam'
-- 4000000	rizwana
-- 5000000	raj

select sum(salary) as total,name from manager group by gender having sum(salary)>1000000 order by gender desc;               -- error  ??????????????/

select age from manager group by age having count(age)>1;
select gender,max(salary) from manager group by gender having max(salary)>2000000;
-- # gender, max(salary)
-- F	80000000
-- g	5000000
select gender,max(salary) from manager group by gender having min(salary)<2000000;



--  .....................PROCEDURE.....................................................................
-- first delimiter set default delimiter to // ,last delimiter set default delimiter to ;
-- we can change to $$ to work with multiple queries

delimiter //
CREATE PROCEDURE GetManagerInfo(ManagerAge int)
    begin
		select * from manager;
    end
    //
    delimiter ;
-- .................we will get stored procedures in left side.......
delimiter //
CREATE PROCEDURE GetManagerInfo1()
    begin
		select * from manager;
    end
    //
call GetManagerInfo1();
-- ////////////a copy is created...............
delimiter //
CREATE PROCEDURE GetManagerAge()
    begin
		select * from manager where age=20;
    end
    //
call GetManagerAge();
-- func / procedure call should have se

--  random-it randomly fetch some name EACH TIME

select * from manager;
select name from manager order by RAND() LIMIT 3;
select name from manager order by RAND() ;
--  .......WITHOUT LIMIT IT GIVES ALL ENTRIES BUT IN DIFF ORDER EACH TIME ..............