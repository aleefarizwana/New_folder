-- ********GOOD PRACTICE TO WRITE KEYWORDS IN CAPS************
-- CREATING DATABASE////////////
-- create database herovired;

-- CREATING TABLE//////////////
 create table RGM(Name varchar(30),College varchar(20),Session varchar(30),Contact int primary key not null,Address varchar(30));
 
 -- INSERT VALUES//////////////
-- INSERT INTO RGM VALUES("ayesha","jntua","c","1155443311","anantapur");
-- INSERT INTO RGM VALUES("amena","jntua","c","225544311","kurnool");

-- OTHER WAY//////////////
INSERT INTO RGM(Name,college,Session,Contact,Address) VALUES("raj","jntua","c","29844311","kurnool");



-- INSERT  MULTIPLE VALUES AT A TIME/////////////
 
-- INSERT INTO RGM VALUES("ramya","gps","c++","600004311","vizag"),("soha","ashoka","python",888997436,"kadapa"),("sanjay","ashoka","python",899007436,"kadapa");
-- select * from RGM;
