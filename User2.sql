--Inserting 5 rows in the EMPLOYEE table(9)
insert into user1.employee values(1,'Ahmed',10000,1);
insert into user1.employee values(2,'Mohamed',8000,2);
insert into user1.employee values(3,'Moaz',5000,3);
insert into user1.employee values(4,'Salma',6400,1);
insert into user1.employee values(5,'Gasser',6700,3);
commit;

--Executing the function to generate the BLOCKER-WAITING Situation(12)
--THEN HERE
begin
dbms_output.put_line(user1.updatedSal(1));
end;
/

--Updating both employees data to generate a DEADLOCK situation(14)
--Update EmpID2 First then EmpID1 (after having executed it in user1)
update user1.Employee set salary = salary + salary * 0.1 where user1.Employee.ID = 1;

update user1.Employee set salary = salary + salary * 0.1 where user1.Employee.ID = 2;
--Saving changes
commit;