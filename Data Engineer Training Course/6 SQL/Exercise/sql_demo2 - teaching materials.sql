#Make up Data
DROP DATABASE IF EXISTS SQLDemo_class2; 
CREATE DATABASE SQLDemo_class2; 
USE SQLDemo_class2; 

DROP TABLE IF EXISTS class; 
CREATE TABLE class(
	student_no int not null auto_increment,
	name varchar(255),
	sex varchar(255),
	height float,
	primary key(student_no)
);


insert into class (name, sex, height) values ('Tom', 'M', '77');
insert into class (name, sex, height) values ('Thomas','M','67');
insert into class (name, sex, height) values ('John','M','88');
insert into class (name, sex, height) values ('Mary','F','53');
insert into class (name, sex, height) values ('Rose', 'F', '60');

DROP TABLE IF EXISTS exam; 
CREATE TABLE exam(
	student_name varchar(255),
	grade varchar(255));
insert into exam (student_name, grade) values ('John','C');
insert into exam (student_name, grade) values ('Mary','A');
insert into exam (student_name, grade) values ('Rose', 'A');  
insert into exam (student_name, grade) values ('Aliens', 'A');      
####################################################################

############################GROUP BY###############################
#Suppose we want to know the average height by sex
Select sex, avg(height) as avg_height from class group by sex;

#Suppose we don't want to calculate the average height by sex without John
select * from class where name not like 'J%' ; 
#calculate avg height without John
select sex, avg(height) as avg_height from class where name not like 'J%' group by sex ; 

#######################HAVING######################################
#You may think of a filtering after the Group By 
#Saying that  we want to know the average height by sex but the average height should be >60
select sex, avg(height) as avg_height from class group by sex having avg(height)>60; 

#######################ORDER BY######################################
select * from class;
select * from class order by name; #by default ascending
select * from class order by height desc;  #descending

#####################Join ######################################
#Suppose a table exam contains the result of exams 
select * from exam; #only 3 people in class and 1 alien take the exam

##inner join --give all results that both table have that students
select * from class AA inner join exam BB on AA.name=BB.student_name; ##We can alias the table

##left join --give all results that left table have that students
select * from class AA left join exam BB on AA.name=BB.student_name; #Give null if right table no record

##right join --give all results that right table have that students
select * from class AA right join exam BB on AA.name=BB.student_name; #Give null if left table no record



#######################SUBQuery######################################
##Suppose we want to know the height of students below average
select * from class where height<(select avg(height) from class );


#######################Join Concept################################################
USE SQLDemo_class2; 
select * from class; #5 people in the class
select * from exam ; # 3 people in the class take exam, 1 alien in class not take the exam

##############Familar with Left Join ####################
# by inner join (3 students in class AND also in exam)
select * from class AA inner join exam BB on AA.name=BB.student_name; 
# #by left join  (5 students of whom 3 have exams record)
select * from class AA left join exam BB on AA.name=BB.student_name; #by left join 
#In practical, we can left join with filtering the null value instead of inner join
select * from class AA left join exam BB on AA.name=BB.student_name where student_name is not null;  

########RIGHT JOIN actually the same as LEFT JOIN #################
select AA.*,BB.* from class AA left join exam BB on AA.name=BB.student_name;
select BB.*,AA.* from exam AA right join class BB on AA.student_name=BB.name;

####################Group by Concept#####################
drop table if exists class_with_grade;
create table class_with_grade
select * from class AA inner join exam BB on AA.name=BB.student_name;

select * from class_with_grade;

##Select = Group by + Aggregate
select sex, grade, avg(height)    # sex,grade + avg(height)
from class_with_grade 
group by sex, grade; # sex,grade
