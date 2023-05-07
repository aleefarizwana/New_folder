#                                   INVENTORY CONTROL MANAGEMENT PROJECT

#connectig sql with python                      
import mysql.connector
mydb=mysql.connector.connect(host='localhost', user='root', password='Aleefa@2003')

#CREATING DATABASE Inventory_Management
cur=mydb.cursor()
cur.execute('create database Inventory_Management')
cur=mydb.cursor()


#ENTER INTO DATABASE Inventory_Management

import mysql.connector
mydb=mysql.connector.connect(host='localhost',user='root',password='Aleefa@2003',database='Inventory_Management')
cur=mydb.cursor()

#CREATING TABLES manufacture, goods, purchase ,sales

m='create table manufacture(manufacture_id int primary key,no_of_items int not null,defective int,g_id int)'
cur.execute(m)
    
g='create table goods(g_id int not null,item_name varchar(30),manu_company varchar(30),manu_date date,g_color varchar(30))'
cur.execute(g)
 
p='create table purchase(mi_id int,p_id int PRIMARY KEY,p_amt int,mode_of_purchase varchar(30),purchase_by varchar(30),discount float)'
cur.execute(p)

s='create table sales1(g_id int,item_sold varchar(30),sale_date date,sold_by varchar(30),profit_margin float)'
cur.execute(s)



#INSERTING DATA INTO ALL TABLES

mi='insert into manufacture(manufacture_id ,no_of_items ,defective ,g_id) values(%s,%s,%s,%s)'
a=[(501,10,1,2001),(502,20,1,2002),(503,5,0,2003),(504,15,1,2004),(505,30,0,2005),(506,7,0,2006),(508,4,0,2012)]
cur.executemany(mi,a)
mydb.commit()



gi='insert into goods(g_id,item_name ,manu_company ,manu_date,g_color) values(%s,%s,%s,%s,%s)'
b=[(2002,'wooden_chair','ASD','2-04-23','blue'),(2004,'wooden_chair','ODS','8-02-22','blue'),(2003,'shirt','BRay','1-04-23','blue'),(2001,'toy_panda','MN_GOODS','1-4-23','blue'),(2012,'toy_dora','SSAS','5-8-22','red'),(2013,'wooden_table','SS_EXPORT','1-3-23','red'),(2014,'wooden_chair','ODS','8-8-23','blue')]
cur.executemany(gi,b)
mydb.commit()



pi='insert into purchase(mi_id,p_id,p_amt,mode_of_purchase,purchase_by,discount) values(%s,%s,%s,%s,%s,%s)'
e=[(501,801,900,'online','ORay',0.2),(502,802,500,'online','MyK',0.1),(503,803,1200,'offline','MEWO',0.15),(504,804,20000,'offine','WERT',0.4),(505,805,6000,'online','JIO',0.2),(506,806,60000,'online','UBER',0.5),(507,808,700,'offline','MART',0.8),(508,807,8000,'offline','MyKids',0.2)]
cur.executemany(pi,e)
mydb.commit()


si='insert into sales1(g_id ,item_sold ,sale_date ,sold_by ,profit_margin )values(%s,%s,%s,%s,%s)'
d=[(2001,'toy_panda','04-09-24','AFG',0.89),(2002,'wooden_chair','04-05-24','MEGA',0.49),(2003,'shirt','06-09-24','QUO',0.1),(2004,'wooden_chair','04-09-24','AFG',0.89),(2012,'toy_dora','22-05-24','BOAT',0.2),(2013,'wooden_table','19-12-23','MyCare',0.4)]
cur.executemany(si,d)
mydb.commit()

#QUERIES 

#g='delete from manufacture where defective=1 AND p.purchase_by="ORay" AND goods.manu_date= "1-04-23" AND manufacture_id= p.mi_id AND goods.item_name="shirt"'
g='select * from manufacture, purchase p,goods where defective=1  AND p.purchase_by="ORay" AND goods.manu_date= "1-04-23" AND manufacture_id= p.mi_id AND goods.item_name="shirt"'
cur.execute(g)
display=cur.fetchall()
for x in display:
    print(x)
    
print("deleted.......................")



j='update manufacture m,purchase ,goods g  set manufacture_id=301,defective =1,no_of_items =70 where m.g_id=g.g_id AND g_color="red" AND purchase_by="MyKids"'
cur.execute(j)
mydb.commit()




k='select * from goods where  item_name="wooden_chair" AND manu_date < "01-05-23"'
cur.execute(k)
display=cur.fetchall()
for x in display:
    print(x)





l='select profit_margin from sales1,goods where item_name="wooden_table" AND manu_company="SS_EXPORT" AND sold_by="MyCare"'
cur.execute(l)
display=cur.fetchone()
for x in display:
    print(x)
