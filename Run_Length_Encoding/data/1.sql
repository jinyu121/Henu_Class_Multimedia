create database task   
use
task 
create table student   
(Sno char(15) not null,
Sname char(20) not null,
Sage int not null,
Ssex char(20) not null,
Sdept char(20) not null,
Sclass char(20) not null,
Sinterest char(20) not null,
constraint pk_Sno primary key(Sno))

create table  mentor  
(Mno char(15) not null,
Mname char(20) not null,
Mage int not null,
Msex char(20) not null,
Mdept char(20) not null,
Mtitle char(20) not null,	
Mr1 char(20) not null,
Mr2 char(20) not null,
Mr3 char(20) not null,
constraint pk_Tno primary key(Mno))


create table SMchoose  
(Sno char(15) not null,
Sname char(20) not null,
Tnu1 char(20) not null,
Tnu2 char(20),
Tnu3 char(20),
Tnu4 char(20),
Tnu5 char(20),
Tnu6 char(20),
constraint pk_SMchoose primary key(Sno),
constraint fk_SMchoose foreign key (Sno) references Student(Sno))


create table MSchoose   
(Mno char(15) not null,
Mname char(15) not null,
Snu1 char(15),
Snu2 char(15),
Snu3 char(15),
Snu4 char(15),
Snu5 char(15),
Snu6 char(15),
Snu7 char(15),
Snu8 char(15),
constraint pk_MSchoose primary key(Mno),
constraint fk_MSchoose foreign key(Mno) references mentor(Mno) ) 


use task          
go
if exists(select name from sysobjects where xtype='p' and name='student_add')
   drop procedure STUDENT_add
   go
   create procedure student_add
   (@Sno char(15),@Sname char(20),@Sage int,@Ssex char(20),@Sdept char(20),@Sclass char(20),@Sinterest char(20))
   as
   begin
   insert into STUDENT values(@Sno,@Sname,@Sage,@Ssex,@Sdept,@Sclass,@Sinterest)
   end
   return
   go



exec student_add '010022'
     exec student_add '010023'
     exec student_add '010024'
     exec student_add '010025'
     exec student_add '010027'
     exec student_add '010028'
     exec student_add '010029'
     exec student_add '010030'
     exec student_add '010031'
     exec student_add '010032'
     exec student_add '010033'
     exec student_add '010034'
     exec student_add '010035'
     exec student_add '010036'
     exec student_add '010037'
     exec student_add '010038'
     exec student_add '010039'
     exec student_add '010040'
     exec student_add '010041'
     exec student_add '010042'
     exec student_add '010043'
     exec student_add '010044'
     exec student_add '010045'
     exec student_add '010046'
     exec student_add '010047'
     exec student_add '010048'
     exec student_add '010049'
     exec student_add '010050'
     exec student_add '010051'
     exec student_add '010052'

use task                           
go
if exists(select name from sysobjects where xtype='p' and name='mentor_add')
   drop procedure mentor_add
   go
   create procedure mentor_add
   (@Mno char(15),@Mname char(20),@Tage int,@Msex char(20),@Mdept char(20),@Mtitle char(20),
   @Mre1 char(20),@Mre2 char(20),@Mre3 char(20)) 
   as
   begin
   insert into mentor values(@Mno,@Mname,@Tage,@Msex,@Mdept,@Mtitle ,@Mre1,@Mre2,@Mre3)
   end
   return
   go
   
 
   
create role StudentRole   
grant select
on mentor
to StudentRole
grant insert 
on SMchoose
to StudentRole

create login stu2    
with password='010020'
create user stu2
for login stu2

create login stu1
with password='010021'
create user stu1
for login stu1

create login stu3
with password='010022'
create user stu3
for login stu3

exec sp_addrolemember'StudentRole','stu1'   
exec  sp_addrolemember'StudentRole','stu2'
exec  sp_addrolemember'StudentRole','stu3'

create view stu1_student 
as
select *
from STUDENT
where Sno='010021'

grant update,select
on stu1_student
to stu1


create view stu2_student             
as
select *
from student 
where Sno='010020'

grant update,select
on stu2_student
to stu2

create view stu3_student              
as
select *
from STUDENT
where Sno='010022'

grant update,select
on stu3_student
to stu3
create role mentorRole
grant select
on student
to mentorRole

USE
task
grant insert 
on mschoose
to mentorRole
create login mentor1 
with password='0'
create user mentor1
for login mentor1

create login mentor2
with password='1'
create user mentor2
for login Mentor2

create login mentor3
with password='2'
create user mentor3
for login mentor3

exec sp_addRolemember'mentorRole','mentor1'   
exec  sp_addRolemember'mentorRole','mentor2'
exec  sp_addRolemember'mentorRole','mentor3'



create view mentor1_mentor  
as
select *
from mentor
where mno='1'

grant update,select
on mentor1_mentor
to mentor1
create view mentor2_mentor             
as
select *
from mentor 
where mno='2'

grant update,select
on mentor2_mentor
to mentor2

create view mentor3_mentor              
as
select *
from mentor
where mno='3'

grant update,select
on mentor3_mentor
to mentor3

 
create role  teachingSecretary_role         
grant update,insert,delete
on student
to  teachingSecretary_role
grant update,insert,delete
on mentor
to  teachingSecretary_role

create login teachingSecretary
with password='teachingSecretary'
create user teachingSecretary_user
for login teachingSecretary 
exec sp_addrolemember 'teachingSecretary_role','teachingSecretary_user'
 

 create table log_table 
(nowuser char(20),
 nowdate date,
 nowtime time default convert(char(10),getdate(),110))
 
 
if exists(select name from sysobjects where xtype='p' and name='log_p')
   drop procedure log_p
   go
   create procedure log_p
   as
   begin
   insert into log_table values(default,default,default)
   end
   


