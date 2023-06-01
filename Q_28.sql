create table salesman1(salesman_id int primary key,name varchar(30),city varchar(30),comission float); 
INSERT INTO salesman1 VALUES(1,"james","new york",0.5);
INSERT INTO salesman1 VALUES(2,"Nail","india",0.2);
INSERT INTO salesman1 VALUES(3,"pit","new york",0.15);
INSERT INTO salesman1 VALUES(4,"raj","india",0.6);
INSERT INTO salesman1 VALUES(5,"sam","england",0.15);
select name,comission from salesman1;