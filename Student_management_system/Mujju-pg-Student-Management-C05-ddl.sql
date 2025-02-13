-- Chapter 5 - DDL (Data Definition Language)
-- DDL ASSIGNMENT2 - Student Management System

--Question 1: Create a DEPARTMENT table:
create table DEPARTMENT(
	department_id int GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
	department_name varchar(255) not null,
	created_date date defalt current_date not null
);

--Question 2: Create the GRADE Table
create table GRADE(
	grade_id int GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
	grade_letter char(1) check(grade_letter in ('A','F')) not null,
	grade_description varchar(255) not null,
	start_percent numeric(10,2) not null,
	end_percent numeric(10,2) not null,
	created_date date defalt current_date not null
);	

--Question 4: Create the STUDENT Table
create table students(
	student_id int GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
	first_name varchar(255) not null,
	last_name varchar(255) not null,
	date_of_birth date not null,
	email varchar(255) unique not null,
	created_date date defalt current_date not null
);

--Question 5: Create the COURSE Table with Constraints
create table COURSE(
	course_id int GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
	course_name varchar(255) not null,
	department_id int,
	credits int not null,
	created_date date defalt current_date not null,
	foreign key(department_id) references department(department_id)
);

--Question 6: Create the ENROLLMENT Table
create table ENROLLMENT(
	enrollment_id int GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
	enrollment_date date defalt current_date not null,
	student_id int,
	course_id int,
	semester_id int,
	grade_id int,
	amount_paid numeric(10,2) not null,
	amount_due numeric(10,2) not null,
	foreign key(student_id) references student(student_id),
	foreign key(course_id) references course(course),
	foreign key(semester_id) references semester(semester_id),
	foreign key(grade_id) references grade(grade_id)

);

--Question 7: Create the TEACHER Table with a Foreign Key
create table TEACHER(
	teacher_id int GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
	first_name varchar(255) not null,
	last_name varchar(255) not null,
	email varchar(255) unique not null,
	hire_date date not null,
	department_id int,
	created_date date defalt current_date not null,
	foreign key(department_id) references department(department_id)
);

--Question 8: Define the TEACHER_COURSE Table
create table TEACHER_COURSE(
	teacher_course_id int GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
	teacher_id int,
	course_id int,
	created_date date defalt current_date not null,
	foreign key(teacher_id) references teacher(teacher_id),
	foreign key(course_id) references course(course_id)
);

--Question 9: Define the CLASSROOM Table with Relationships
create table CLASSROOM(
	classroom_id int GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
	room_number varchar(50) not null,
	capacity int not null,
	department_id int,
	created_date date defalt current_date not null,
	foreign key(department_id) references department(department_id)
);


-- Question 10: Define the CLASS_SCHEDULE Table with Relationships
-- Write the SQL statement to create a CLASS_SCHEDULE table that includes:
-- class_schedule_id as a primary key with auto-increment functionality.
-- semester_id as a foreign key referencing the SEMESTER table, not null.
-- course_id as a foreign key referencing the COURSE table, not null.
-- teacher_id as a foreign key referencing the TEACHER table, not null.
-- start_date as a date field, not null.
-- end_date as a date field, not null.
-- start_time as a time field, not null.
-- end_time as a time field, not null.
-- created_date as a date field, default it to system date, not null.


-- Question 11: Create the EXAM Table
-- Define an EXAM table with the following specifications:
-- exam_id as a primary key with auto-increment functionality.
-- exam_name as a date field, not null.
-- created_date as a date field, default it to system date, not null.


-- Question 12: Create the EXAM_SCHEDULE Table
-- Define an EXAM_SCHEDULE table with the following specifications:
-- exam_schedule_id as a primary key with auto-increment functionality.
-- exam_date as a date field, not null.
-- exam_id as a foreign key referencing the EXAM table, not null.
-- semester_id as a foreign key referencing the SEMESTER table, not null.
-- course_id as a foreign key referencing the COURSE table, not null.
-- room_id as a foreign key referencing the ROOM table, not null.
-- total_marks as an integer, not null.
-- start_time as time, not null.
-- end_time as time, not null.
-- created_date as a date field, default it to system date, not null.


-- Question 13: Create the EXAM_RESULT Table
-- Define an EXAM_RESULT table with the following specifications:
-- exam_schedule_id as a foreign key referencing the EXAM_SCHEDULE table, not null.
-- student_id as a foreign key referencing the STUDENT table, not null.
-- grade_id as a foreign key referencing the GRADE table, not null.
-- created_date as a date field, default it to system date, not null.
-- create composite primary key.


-- Question 14: Create the EXAM_RESULT_MASTER Table
-- Define an EXAM_RESULT table with the following specifications:
-- exam_id as a foreign key referencing the EXAM table, not null.
-- student_id as a foreign key referencing the STUDENT table, not null.
-- grade_id as a foreign key referencing the GRADE table, not null.
-- semester_id as a foreign key referencing the SEMESTER table, not null.
-- created_date as a date field, default it to system date, not null.
-- create composite primary key.


-- Question 15: Create the ATTENDANCE Table
-- Write a DDL SQL statement to create an ATTENDANCE table:
-- attendance_id as the primary key with auto-increment functionality.
-- attendance_date as a date field, not null.
-- student_id as a foreign key referencing the STUDENT table, not null.
-- course_id as a foreign key referencing the COURSE table, not null.
-- absence_flag as a boolean, true or false, not null.
-- created_date as a date field, default it to system date, not null.


-- Question 16: Create the FEE_STRUCTURE Table with Constraints
-- Write a DDL SQL statement to create a FEE_STRUCTURE table:
-- fee_id as a primary key with auto-increment functionality.
-- course_id as a foreign key referencing the COURSE table, not null.
-- fee_amount as a decimal (10, 2), not null.
-- Add a CHECK constraint to ensure the fee_amount is greater than 0.
-- created_date as a date field, default it to system date, not null.


-- Question 17: Create the FEE_PAYMENT Table with Constraints
-- Write a DDL SQL statement to create a FEE_PAYMENT table:
-- payment_id as a primary key with auto-increment functionality.
-- student_id as a foreign key referencing the STUDENT table, not null.
-- amount_paid as a decimal (10, 2), not null.
-- balance_amount as a decimal (10, 2), not null.
-- payment_date as a datetime, not null
-- Add a CHECK constraint to ensure the fee_amount is greater than 0.


-- Question 18: Create the EMPLOYEE_LOGIN Table
-- Write a DDL SQL statement to create an EMPLOYEE_LOGIN table (one-to-one relationship with employee table):
-- employee_id as a foreign key referencing the EMPLOYEE table.
-- login_id can use alpha numeric login id or email as login id, not null.
-- password must encrypt the password before storing it in the database table, not null.
-- active_flag use numeric, 0 or 1, you can lock the customer login when required, not null.
-- last_login_datetime as a timestamp, last successfull login date for a given employee.

-- Question 19: Create the AUDIT_LOG Table
-- Define an AUDIT_LOG table to track changes in the student management system:
-- log_id as a primary key with auto-increment functionality.
-- log_date as a date field, not null.
-- action as a string to describe the action performed, not null.
-- user_id as a foreign key referencing the TEACHER or STUDENT table.

-- Question 20: Add a Column to the TEACHER Table
-- Write a SQL statement to add a phone_number column of type VARCHAR(15) to the TEACHER table.

-- Question 21: Alter a Column in the STUDENT Table
-- Write a SQL statement to alter the email column in the STUDENT table, increasing its length to 255 characters.

-- Question 22: Drop an Index from the TEACHER Table
-- Write a SQL statement to drop the index on the phone_number column in the TEACHER table.

-- Question 23: Rename the FEE_PAYMENT Table
-- Write a SQL statement to rename the FEE_PAYMENT table to PAYMENT_TRANSACTION.

-- Question 24: Add Primary Key
-- Write a SQL statement to add primary key to the EMPLOYEE_LOGIN table.

-- Question 25: Add a Foreign Key column to the EXAM_SCHEDULE Table
-- Add a foreign key in the EXAM_SCHEDULE table to reference the CLASSROOM table.

-- Question 26: Drop a Column from the EXAM_SCHEDULE Table
-- Write a SQL statement to drop the class_id column from the EXAM_SCHEDULE table.

-- Question 27: Add Indexes to the STUDENT and COURSE Tables
-- Write SQL statements to:

-- Add an index on the last_name column in the STUDENT table.
-- Add an index on the course_name column in the COURSE table.
-- Question 28: Add a CHECK Constraint on the ENROLLMENT Table
-- Write a SQL statement to add a CHECK constraint to the ENROLLMENT table ensuring that the grade is between 'A' and 'F', or NULL.

-- Question 29: Drop the EMPLOYEE_LOGIN Table
-- Write a SQL statement to drop the EMPLOYEE_LOGIN table.

-- Question 30: Add a UNIQUE Constraint on the EXAM Table
-- Write a SQL statement to add a UNIQUE constraint to the EXAM table ensuring that the exam_name is not repeated.

-- Question 31: Enforce UNIQUE constraints on all applicable tables.
-- Apply UNIQUE constraints to columns across the entire database wherever duplicate data is not permitted.

-- GOOD LUCK WITH YOUR ASSIGNMENT!!!
-- Don't forget to contact us if you need any further assistance with your assignments, and most importantly, for a manual review and approval of your work.



