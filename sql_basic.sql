show databases;
create database students;
use students;
create table student(s_id int primary key, s_name varchar(20), s_address varchar(20), faculty varchar(20));
insert into student values(1, 'kim', 'uk', 'jion'),(2, 'rose', 'sydney', 'jimin'),(3, 'riya', 'aus', 'austin'),(4, 'mill', 'us', 'kiwi');
select * from student;
delete from student where faculty='jion' and salary<10000;
alter table student add column salary int;
UPDATE student SET salary = 20000 WHERE s_id = 1;
UPDATE student SET salary = 30000 WHERE s_id = 2;
UPDATE student SET salary = 40000 WHERE s_id = 3;
UPDATE student SET salary = 10000 WHERE s_id = 4;
UPDATE student SET salary = 5000 WHERE s_id = 5;

update student set salary = salary+5000 where salary<40000;
DELETE FROM student WHERE salary BETWEEN 30000 AND 35000;
alter table student drop column salary;

UPDATE students.student set s_name = 'king' where (s_id = 1);
select s_name, faculty from student;
delete from student where s_name='rose', salary <40000;

SET SQL_SAFE_UPDATES = 0;
delete from student where s_name = 'king';
set sql_safe_updates = 1;
insert into student values(5,'kelvin', 'germany', 'jion');
alter table student add S_DOB date;
alter table student drop column S_DOB;

create table orders(orderId int, customerId int, orderDate date);
insert into orders values(10308, 2, '1996-12-12'),(10309, 37, '1996-10-19'),(103010, 7, '1996-11-21');
select * from orders;
alter table orders add column O_ID int;
alter table orders add constraint FK_Order foreign key(O_ID) references student(s_id);
set sql_safe_updates = 0;
update orders set O_ID='20' where customerId=2;
update orders set O_ID='21' where customerId=37;
update orders set O_ID='22' where customerId=7;
set sql_safe_updates = 1;
# INNER JOIN
