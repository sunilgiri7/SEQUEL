show databases;
use mysql;
CREATE TABLE employee (
  emp_id INT,
  first_name VARCHAR(50),
  last_name VARCHAR(50),
  hire_date DATE,
  job_title VARCHAR(50),
  department VARCHAR(50),
  salary DECIMAL(10, 2),
  email VARCHAR(50),
  phone_number VARCHAR(20),
  manager_id INT
);
INSERT INTO employee (emp_id, first_name, last_name, hire_date, job_title, department, salary, email, phone_number, manager_id)
VALUES
  (1, 'John', 'Doe', '2020-01-01', 'Software Engineer', 'Engineering', 100000.00, 'john.doe@company.com', '555-1234', NULL),
  (2, 'Jane', 'Smith', '2019-06-01', 'Data Analyst', 'Analytics', 75000.00, 'jane.smith@company.com', '555-5678', 1),
  (3, 'Bob', 'Johnson', '2021-03-15', 'Product Manager', 'Product', 120000.00, 'bob.johnson@company.com', '555-9876', 1),
  (4, 'Sarah', 'Lee', '2018-09-01', 'UX Designer', 'Design', 90000.00, 'sarah.lee@company.com', '555-4321', 3),
  (5, 'Tom', 'Brown', '2022-01-01', 'Data Scientist', 'Analytics', 110000.00, 'tom.brown@company.com', '555-2468', 3),
  (6, 'Emily', 'Davis', '2020-08-01', 'Marketing Specialist', 'Marketing', 80000.00, 'emily.davis@company.com', '555-1357', 3),
  (7, 'Mark', 'Taylor', '2019-01-15', 'Business Analyst', 'Analytics', 85000.00, 'mark.taylor@company.com', '555-8642', 2),
  (8, 'Anna', 'Wong', '2021-07-01', 'Software Engineer', 'Engineering', 95000.00, 'anna.wong@company.com', '555-3690', 1),
  (9, 'David', 'Chen', '2018-03-15', 'Product Manager', 'Product', 130000.00, 'david.chen@company.com', '555-1111', 1),
  (10, 'Linda', 'Nguyen', '2022-02-15', 'UX Designer', 'Design', 100000.00, 'linda.nguyen@company.com', '555-7777', 3);
  
alter table employee add department_id int;
SET SQL_SAFE_UPDATES=0;
update employee set department_id=1 where emp_id in (1,3,5);
update employee set department_id=2 where emp_id in (2, 4);
update employee set department_id=3 where emp_id in (6,7,8,9,10);
-- update employee set department_id=4 where emp_id in (10);
SET SQL_SAFE_UPDATES=0;
select * from employee;
select first_name, department from employee order by salary;

create table student(department_id int primary key, department_name varchar(20));
insert into student values(1, 'Engineering'), (2, 'Sales'), (3, 'Marketing');
select * from student;

select employee.emp_id, employee.first_name, employee.last_name, student.department_name from employee
inner join student on employee.department_id = student.department_id;

select distinct * from employee;
select salary, count(1) from employee group by salary;

create table org(workees_name varchar(20), manager_id int);
insert into org values('ritik', 1),('zayn', 2),('firoz',3),('lok', 4);
select * from org;

-- inner join: FEtch matching record only
select e.first_name, s.department_name from employee e inner join student s on e.department_id=s.department_id;

-- left join: inner join + additional record from left table
select e.first_name, s.department_name from employee e left join student s on e.department_id=s.department_id;

-- right join: inner join + additional record from right table
select e.first_name, s.department_name, o.workees_name from employee e right join student s on e.department_id=s.department_id
right join org o on o.manager_id=e.manager_id;



