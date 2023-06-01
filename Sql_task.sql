Exercise 1 (5 marks):

Create a database schema for the online consultation and therapy website. The database should contain the following tables:-

Doctor table:- The table should contain the attributes such as id, name, specialization, etc.

Appointments table:- The table should contain information related to appointments set up by doctors and patients.

Patient table:- The table should contain information on patients.

Reviews table:- This table should contain reviews posted by patients.


NOTE:- Use proper constraints on the attributes such as primary key, not null and etc.



Exercise 2 (5 marks):

Contact Table

Id

Email

fname

lname

company

Active_flag

opt_out

123

a@a.com

Kian

Seth

ABC

1

1

133

b@a.com

Neha

Seth

ABC

1

0

234

c@c.com

Puru

Malik

CDF

0

0

342

d@d.com

Sid

Maan

TEG

1

0


QUESTIONS:

Select all columns from the contact table where the active flag is 1

Deactivate contacts who are opted out 

Delete all the contacts who have the company name as ‘ABC’

Insert a new row with id as 658, name as ‘mili’, email as ‘mili@gmail.com’, the company as ‘DGH’, active flag as 1, opt-out flag as 1

Pull out the unique values of the company column 

Update name “mili” to “niti”.



Exercise 3 (10 marks):

Write a SQL query to find those customers with a grade less than 100. It should return cust_name, customer city, grade, salesman, and salesman city. The result should be ordered by ascending customer_id.


Sample table: customer

customer_id |   cust_name    |    city    | grade | salesman_id 

-------------+----------------+------------+-------+-------------

        3002 | Nick Rimando   | New York   |   100 |        5001

        3007 | Brad Davis     | New York   |   200 |        5001

        3005 | Graham Zusi    | California |   200 |        5002

        3008 | Julian Green   | London     |   300 |        5002

        3004 | Fabian Johnson | Paris      |   300 |        5006

        3009 | Geoff Cameron  | Berlin     |   100 |        5003

        3003 | Jozy Altidor   | Moscow     |   200 |        5007

        3001 | Brad Guzan     | London     |       |        5005





Sample table: salesman

 salesman_id |    name    |   city   | commission 

-------------+------------+----------+------------

        5001 | James Hoog | New York |       0.15

        5002 | Nail Knite | Paris    |       0.13

        5005 | Pit Alex   | London   |       0.11

        5006 | Mc Lyon    | Paris    |       0.14

        5007 | Paul Adam  | Rome     |       0.13

        5003 | Lauson Hen | San Jose |       0.12




EXERCISE 1

CREATE DATABASE consultation_theraphy;
CREATE TABLE doctor(d_ID INT primary key,d_name varchar(30),specialization varchar(30),d_experience int not null);
CREATE TABLE appointment(ap_no  int PRIMARY KEY AUTO_INCREMENT,p_id int not null,d_id int not null,doc_name varchar(30),ap_date date not null);
CREATE TABLE patient(p_id int primary key AUTO_INCREMENT,p_name varchar(30),p_age int,p_address varchar(30),reason varchar(30));
CREATE TABLE reviews(r_no int not null,r_descrip varchar(30),p_name varchar(30),no_of_visits int check(no_of_visits>=1));


EXERCISE 2

CREATE TABLE Contact (id int PRIMARY KEY,email varchar(30),fname varchar(30),lname varchar(30),company varchar(30),Active_flag int not null,opt_out int not null);
INSERT INTO Contact VALUES(112,'bvn@gmail.com','lan','pan','DPO',1,0),(113,'fhj,@gmail.com','laiin','psaan','ABC',0,1),(114,'qwe@gmail.com','san','john','ASUYD',1,1);
INSERT INTO Contact VALUES(115,'mnb@gmail.com','tam','ananya','DPO',1,0),(116,'lkj@gmail.com','nutr','sajan','ASUYD',1,0),(117,'hjk@gmail.com','nre','malik','TIPO',1,1);
INSERT INTO Contact VALUES(110,'jkkj@gmail.com','luna','sana','ABC',0,1);

select * from Contact where Active_flag=1;
delete from Contact where opt_out=1;
delete from Contact where company='ABC';
INSERT INTO Contact VALUES(658,'mili@gmail.com','mili','roja','DGH',1,1);
select distinct company as unique_companies from Contact;
update Contact set fname='niti' where fname='mili'; 


EXERCISE 3

CREATE TABLE customer(customer_id int PRIMARY KEY,cust_name varchar(30),city varchar(30),grade int not null,salesman_id int);
CREATE TABLE salesman(sales_man_id int not null,name varchar(30),city varchar(30),comission float);
INSERT INTO customer VALUES(501,'aleefa','london',200,2001),(502,'ameena','paris',100,2002),(503,'ayesha','london',50,2004),(507,'sam','new york',30,2007),(505,'ramya','bangkok',209,2009);
INSERT INTO customer VALUES(504,'soha','america',70,2010),(506,'nannu','paris',300,2005);

insert into salesman VALUES(2001,'mann','India',0.15),(2004,'maya','Austrialia',0.17),(2010,'kali','America',0.4),(2005,'soha','India',0.25),(2009,'laya','India',0.75);
delete from salesman;
select c.cust_name,c.city,c.grade,s.sales_man_id,s.city from customer c,salesman s where c.grade<100 AND s.sales_man_id = c.salesman_id order by c.customer_id ASC;
