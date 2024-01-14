![image](https://github.com/AhmedMetwaly1287/DB2Proj/assets/139663311/3ed3218d-eb8a-41b8-b2f1-604cbceb1fdc)


<h1>Database Systems 2 Project Repository</h1>

<p><b>This repository was made for Database Systems 2 (IS 312) Course for the Faculty of Computers and Artificial Intelligence - Helwan University</b></p>


<h2>Details</h2>

<b>This project involves the implementation and management of an Oracle Database using the Oracle SQL Developer IDE. The goal is to create a structured,secure environment with appropriate user roles, privileges, and demonstrate scenarios such as blocker-waiting and deadlock situations.</b>

<h3>Project Phases:</h3>

<b>Initialization:</b>

Creation of an initial Database Administrator (DBA) User under the name 'Admin'.
The DBA User is assigned the responsibility of managing roles and privileges within the Oracle database.

<b>Role Creation:</b>

The DBA User creates a Manager Role and grants privileges to Create a Session to be able to establish connection with the database, creating different users and tables and creating procedures with admin option to give the user assigned the role freedom to grant these privileges to other users a manager user is then created and granted the role.


<b>User Management:</b>

The Manager User is utilized to create two additional users: user1 and user2.
Each user is assigned distinct privileges that correspond to the tasks they need to carry out within the Database.

<b>User1:</b>
<ol>
  <li value='1'>Creating a session</li>
  <li>Creating a table</li>
  <li>Creating a procedure</li>
</ol>
<b>User2:</b>
<ol>
<li value='1'>Creating a session</li>
<li>Creating a procedure</li>
</ol>

<b>Table Creation and Data Insertion:</b>

User1, utilizing their assigned privileges, creates two different tables within the database.
Data is then inserted into both tables.

User1 grants table access to user2, enabling data manipulation within the specified tables.

<b>Blocker-Waiting Situation:</b>

A scenario is created where user2 attempts to modify data in one of the tables while user1 is holding a conflicting lock.
The system will demonstrate a blocker-waiting situation, showcasing how the database handles concurrent access.

<b>Deadlock Demonstration:</b>

A deadlock scenario is intentionally induced, where two or more transactions are unable to proceed due to a user putting a lock on different resources.
In this project, User 1 attempts to update the information of one of the employees, User2 attempts to update the info of another employees, User1 then attempts to access the resources User2's Employee which causes a lock, User2 attempts to access the resources for User1's Employee which causes a lock, resulting in a deadlock scenario which can be easily identified by executing the query found in the Admin.sql file. 

<b>Creating functions</b>

A set of functions are then created by user1 who then grants access to user2 to use those function, each function carries out a specific set of operations over one of the table created in the database.

<h3>Summary:</h3>

In this project we demonstrated:

A well-organized Oracle database environment with defined roles and users.

Demonstration of effective privilege management and access control.

Realistic scenarios showcasing blocker-waiting and deadlock situations.

Insights into Oracle's transaction management and concurrency control mechanisms.

Created different functions to carry out different operations in each function.

<b>Tools Used:</b>

Oracle SQL Developer IDE
Oracle Database 11g Express Edition

<b>HINT: Use the order found in the ExecOrder.docx file for successful demonstration.</b>
