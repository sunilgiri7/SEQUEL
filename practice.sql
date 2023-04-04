show databases;
use myinfo;
select * from myinfo;
alter table myinfo add id int primary key;
insert into myinfo values('rax red', 22, 'CSE', 'UK', '2001-08-30', 1274536473, 21);
insert into myinfo values('rose', 20, 'Agri', 'UK', '2003-01-03', 1271282873, 22),('steav', 25, 'BJMC', 'USA', '1997-05-10',1426347826, 23);

select Name from myinfo where id=22;
update myinfo set name='riyan' where id=21;
select distinct Address from myinfo;

-- truncate table myinfo;