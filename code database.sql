create database lap3;
use   lap3;
create table class(
cID int not null,
cName nvarchar(255) not null,
cStartDate datetime  not null,
cStatus bit,
constraint PK_cID primary key (cID)
);
create table student(
sID int not null,
sName nvarchar(30) not null,
sAddress nvarchar(50),
sPhone varchar(20),
sStatus bit,
cID int not null,
constraint pk_sID primary key (sID),
constraint FK_student_class foreign key(cID) references class(cID)
);
create table ssubject(
subID int not null,
subName nvarchar(30) not null,
credit tinyint not null default 1,
subStatus bit default 1,
check (credit>=1)
);
alter table ssubject
add constraint PK_subID primary key(subID);
create table mark(
mID int not null,
subID int not null ,
sID int not null ,
Mark float default 0,
check (mark between 0 and 100),
constraint PK_mID primary key (mID),
constraint FK_mark_ssubject foreign key (subID) references ssubject(subID),
constraint FK_mark_student foreign key (sID) references student(sID)
);
alter table mark
add column Examtimes tinyint default 1;
/*alter table class
add constraint cStartDate  default current_date();*/
insert into class values (1,"A1","2008/12/20",1),
                         (2,"A2","2008/12/22",1),
                         (3,"B3",current_date(),0);
 select *from class;         
 insert into student values(1,"Hung","Ha noi",'0987654321',1,1),
						   (2,"Hoa","Hai phong",null, 1,1),
                           (3,"Manh","HCM","0123123123",0,2);
select*from student;
insert into ssubject (subID,subName,credit)
values(1,"CF",5),
	  (2,"C",6),
      (3,"HDJ",5),
      (4,"RDBMS",10);
select*from ssubject;
insert into mark values(1,1,1,8,1),
					   (2,1,2,10,2),
                       (3,2,1,12,1);
select*from mark;
SET SQL_SAFE_UPDATES = 0;
update  student
set cID=2
where sName="Hung";
select*from student; 
update student set sPhone="no phone" 
where sPhone=null;  
select*from class; 
update class set cName=concat("new",cName) where cStatus=0;
update class set cstatus = 0 where cId not in(select distinct cId from student);
update ssubject set subStatus=0 where subID not in ( select distinct subID from mark);
select * from student where sName like "h%";
select *from class where  month(cStartDate)=12;
select max(credit) as giatriMAx_credit from ssubject;
select * from ssubject where max(credit);
select *from ssubject where credit >3 and credit <7;
select cID,cName,student.sName,student.sAddress from class
inner join student on class.cID=student.cID;
select *
from ssubject
where ssubject.subID not in(select mark.subID from ssubject
 inner join mark on ssubject.subID = mark.subID);
select studentName,subname,mark
from mark inner join ssubject on mark.subID = ssubject.subID
inner join student on mark.sID = student.sID
order by mark,sName;
delete from class
where cstatus = 0;
update ssubject set subName=null
where ssubject.subID
not in(select mark.subID from ssubject inner join mark on ssubject.subID = mark.subID);
alter table mark  drop Examtimes ;
alter table class
change column cStatus StatusClass bit;
rename table mark to subjectTest;
drop database lap3;
