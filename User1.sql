--Creating Department Table(5)
create table department(
id int primary key,
name varchar(50)
);

--Creating Employee Table(6)
create table employee(
id int primary key,
name varchar(50),
salary int,
depID int,
CONSTRAINT departmentID_fk foreign key (depID) references department(id)
); 

--Inserting Department Data into Department Table(7)
insert into user1.department values(1,'HR');
insert into user1.department values(2,'IT');
insert into user1.department values(3,'Finance');
commit;

--Granting Privs to User2(8)
grant insert,delete,update,select on department to user2;
grant insert,delete,update,select on employee to user2;

--Creating the function that updates the salary(10)
CREATE OR REPLACE FUNCTION updatedSal(deptID number)
return number as
begin
IF (deptID = 1) 
THEN
update employee set salary = salary + salary *.1 
where depID = deptID;
return SQLCODE;
end IF;
end updatedSal;
/
--Granting execution to USER2(11)
grant execute on updatedSal to user2;

--Executing the function to generate the BLOCKER-WAITING Situation(12)
--Execute HERE first
begin
dbms_output.put_line(updatedSal(1));
end;
/

--Updating both employees data to generate a DEADLOCK situation(14)
--Update EmpID 1 first then EmpID2 (after having executed it in user2)
update user1.Employee set salary = salary + salary * 0.1 where user1.Employee.ID = 1;

update user1.Employee set salary = salary + salary * 0.1 where user1.Employee.ID = 2;
--Saving changes
commit;

--Function that calculates the average Salary of any department(15)
CREATE OR REPLACE FUNCTION avgSalary(deptID number)
return number as avgSal number;
begin
select avg(salary) into avgSal from user1.employee where depID = deptID;
return avgSal;
end avgSalary;
/

--Executing it
select distinct(avgSalary(2)) from employee;

--Function that calculates the total salary in a Department(16)
CREATE OR REPLACE FUNCTION sumSalary(deptID number)
return number as sumSal number;
begin
select sum(salary) into sumSal from user1.employee where depID = deptID;
return sumSal;
end sumSalary;
/

--Executing it
select distinct(sumSalary(1)) from employee;

--A function that calculates max salary(17)
CREATE OR REPLACE FUNCTION maxSalary
return number as maxSal number;
begin
select max(salary) into maxSal from user1.employee;
return maxSal;
end maxSalary;
/

--Executing it
select distinct(maxSalary) from employee;

--Granting USER2 Execution of all functions(18)
grant execute on avgSalary to user2;
grant execute on sumSalary to user2;
grant execute on maxSalary to user2;


--Dropping all functions/tables to be recreated
drop function updatedSal;
drop function avgSalary;
drop function sumSalary;
drop function maxSalary;
drop table employee;
drop table department;




