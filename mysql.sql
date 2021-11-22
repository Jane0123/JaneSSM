DROP TABLE flow;
--创建审批流程表
create table flow(
        fid int primary key auto_increment,
         name  varchar(50),
       flowtype varchar(30)
);

--创建请假单表
DROP TABLE leaved;
create table leaved(
       leaveid int primary key auto_increment ,
       fid int,
			 foreign key(fid)references flow(fid),
       empname Varchar(40),
       createDate datetime,
       reason varchar(100),
       startDate datetime,
       endDate datetime,
       days int,
       status Varchar(1)
);

--创建图书类型序列
select*from flow;
--创建图书序列
select*from leaved;

--插入数据
insert into flow values (null,'出差报销审批流程','BXD');
insert into flow values (null,'办公用品采购流程','CGD');
insert into flow values (null,'一天以内事假流程','QJD');
insert into flow values (null,'一天以上事假流程','QJD');
insert into flow values (null,'病假请假流程','QJD');
insert into flow values (null,'调休请假流程','QJD');

insert into leaved values (null,4,'张三','2018-5-12','有急事','2018-5-13','2018-5-15',3,'C');

insert into leaved values (null,3,'王五','2019-5-15','有急事','2019-5-15','2018-5-15',1,'D');

insert into leaved values (null,5,'王五','2020-6-12','去看病','2020-6-13','2018-6-15',3,'P');

insert into leaved values (null,6,'赵六','2021-7-16','调休','2021-7-20','2018-7-25',6,'N');


