create database herovired;
create table RGM(Name varchar(30),College varchar(20),Session varchar(30),Contact int primary key not null,Address varchar(30));
INSERT INTO RGM VALUES("ayesha","jntua","c","1155443311","anantapur");
INSERT INTO RGM VALUES("amena","jntua","c","225544311","kurnool");

INSERT INTO RGM VALUES("ramya","gps","c++","600004311","vizag"),("soha","ashoka","python",888997436,"kadapa"),("sanjay","ashoka","python",899007436,"kadapa");
select * from RGM;

select * from RGM where address="Kurnool" and Session ="C";

select * from RGM where name LIKE "s%";
select * from RGM where name LIKE "%a";
select * from RGM where name LIKE "%ya%";
select * from RGM where name LIKE "_a%";




create table student(ID int,Name varchar(30),Marks int);
INSERT INTO student VALUES(27,"aleefa",97),(28,"sunitha",98),(54,"janaki",87),(2,"sravani",80);
INSERT INTO student VALUES(1,"lavanya",60),(32,"sofia",78),(5,"jaya sree",87),(4,"srinivasulu",80);
INSERT INTO student VALUES(34,"dilip",97);
-- INSERT INTO student VALUES(6,"mahesh",97);
select * from student;

-- select * from student where Marks >80;
-- select * from student where ID >=6;

-- select * from student where name>="s";
 -- select * from student where Marks between 83 and 99;
 -- select * from student where Marks between 83 and 99 order by Marks;
 
-- select * from student where Marks between 83 and 99 order by Marks ASC;
-- select * from student where Marks between 83 and 99 order by Marks desc;

--  select * from student where Marks between 83 and 99 desc;                        ERROR must be use order by

-- select DISTINCT Marks from student;
-- select * from student LIMIT 3;

-- select * from rgm where Address="kurnool" LIMIT 2;

--  select * from rgm;

select COUNT(address),ADDRESS from rgm group by address;
select * from rgm where college="rgm" order by name desc limit 2;

create table dob(date_ DATE NOT NULL);
INSERT INTO dob VALUES('2023-05-27');
SELECT * FROM DOB;

