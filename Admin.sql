--Creating Manager User and Role(1)
create user manager identified by 123;
create role mngRole;

--Granting privs to the role then granting the role to the manager user(2)
grant create session, create user,create table, create procedure, unlimited tablespace to mngRole with admin option;
grant mngRole to manager;

--Selecting the SID AND S# of the blocker and the waiter after generating the situation(13)
select
blocker.sid as blockerSID,
blocker.serial# as blockerSerial,
waiter.sid as waiterSID,
waiter.serial# as waiter_serial
from
v$session blocker
join v$session waiter on blocker.sid = waiter.blocking_session
where waiter.blocking_session is not null;
