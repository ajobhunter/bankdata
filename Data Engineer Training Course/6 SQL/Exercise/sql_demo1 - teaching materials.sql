###################################################
#DATABASE (Drop, Create, Use) 
###################################################
#In practical, we need to connect to company's Database/Data WareHouse
#But we need to create our DB for practice 
###################################################
DROP DATABASE IF EXISTS SQLDemo_class;  #In case we want to recreate
CREATE DATABASE SQLDemo_class; #Refresh Schemas see if the SQL_DEMO is here
USE SQLDemo_class; #Then, MYSQL now is pointing to this Database.
###################################################



###################################################
#Table (Drop, Create, insert, alter, update, Select, drop vs truncate)
###################################################

#########Create, Drop Table ###################
DROP TABLE IF EXISTS class; 
CREATE TABLE class(
	student_no int not null auto_increment,
	name varchar(255),
	sex varchar(255),
	height float,
	primary key(student_no)
);
SELECT * FROM class; # * means all; Always use select to query about the result

#######################insert data to table#################
insert into class (name, sex, height) values ('Tom', 'M', '77');
insert into class (name, sex, height) values ('Thomas','M','67');
insert into class (name, sex, height) values ('John','M','88');
insert into class (name, sex, height) values ('Mary','F','53');
insert into class (name, sex, height) values ('Rose', 'F', '60');
select * from class; # * means all; Always use select to query about the result
select name, sex from class; # Sometimes the table have too many columns, we want to pick fewer column



############Alter ###################
alter table class add column grade varchar(255); #Usually Add/Drop/Modify Columns for the table
select * from class; 


##########Update ##################
update class set grade='A';
select * from class; 

update class set grade='B' where name ='Tom'; #where is giving condition
select * from class; 

update class set grade='C' where sex='F';
select * from class; 

###########SELECT  ################################
select * from class;  #Select is a query of tables. It will not change the data of table

#where
select * from class where sex='M'; #where is a filtering follow by a condition
select * from class where name like 'T%' ; # like is a searching function from the column, % is a wildcard
select * from class where name like '%m%' ;
select * from class where grade in ('B','C');

#and vs or
select * from class where sex='M' or grade='C'; 
select * from class where sex='M' and grade='C';

#aggration and rename
select sum(height) as sum from class  ; # do some calculation, AS is for renaming
select avg(height) height from class where name like '%m%' ; 
select count(*) as count from class;


#Select distinct
select sex from class;
select distinct sex from class;  #like set in python

############create table from query ###################
drop table if exists class2;
create table class2 as
select * from class where height>70; 
select * from class2;

############Delete record###########
delete from class where grade='C'; #If fulfill condition, delete the entire row
select * from class;

#############Truncate vs drop ################
truncate table class; #Truncate means delete all data from Table
select * from class; 
drop table class; #Drop table means delete the whole table from database
select * from class; 
################################################





