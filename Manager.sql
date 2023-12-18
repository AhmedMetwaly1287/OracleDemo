--Creating both users(3)
create user user1 identified by 123;
create user user2 identified by 123;

--Granting Privs to both Users(4)
grant create session,create table, unlimited tablespace to user1;
grant create session,unlimited tablespace to user2;
grant create procedure to user1,user2;
