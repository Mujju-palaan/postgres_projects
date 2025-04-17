-- Chapter 5 - DDL (Data Definition Language)
-- DDL ASSIGNMENT2 - Student Management System

--Question 1: Create a DEPARTMENT table:
create table DEPARTMENT(
	department_id int GENERATED ALWAYS AS IDENTITY PRIMARY KEY
	,department_name varchar(255) not null
	,created_date date default current_date not null
);

--Question 2: Create the GRADE Table
create table GRADE(
	grade_id int GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
	grade_letter char(1) check(grade_letter in ('A','F')) not null,
	grade_description varchar(255) not null,
	start_percent numeric(10,2) not null,
	end_percent numeric(10,2) not null,
	created_date date default current_date not null
);	

--Question 3: Create the SEMESTER Table
create table SEMESTER(
	semester_id int GENERATED ALWAYS AS IDENTITY PRIMARY KEY
	,semester_name varchar(255) not null
	,start_date date not null
	,end_date date not null
	,enrollment_status char(5) check(enrollment_status in ('open', 'close')) not null
	,created_date date default current_date
);

--Question 4: Create the STUDENT Table
create table student(
	student_id int GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
	first_name varchar(255) not null,
	last_name varchar(255) not null,
	date_of_birth date not null,
	email varchar(255) unique not null,
	created_date date default current_date not null
);

--Question 5: Create the COURSE Table with Constraints
create table COURSE(
	course_id int GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
	course_name varchar(255) not null,
	department_id int,
	credits int not null,
	created_date date default current_date not null,
	foreign key(department_id) references department(department_id)
);

--Question 6: Create the ENROLLMENT Table select semester_id from semester
CREATE TABLE ENROLLMENT (
    enrollment_id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    enrollment_date DATE DEFAULT CURRENT_DATE NOT NULL,
    student_id INT NOT NULL,
    course_id INT NOT NULL,
    semester_id INT NOT NULL,
    grade_id INT NOT NULL,
    amount_paid NUMERIC(10,2) NOT NULL DEFAULT 0.00,
    amount_due NUMERIC(10,2) NOT NULL DEFAULT 0.00,
    
    FOREIGN KEY (student_id) REFERENCES STUDENT(student_id),
    FOREIGN KEY (course_id) REFERENCES COURSE(course_id),
    FOREIGN KEY (semester_id) REFERENCES SEMESTER(semester_id),
    FOREIGN KEY (grade_id) REFERENCES GRADE(grade_id)
);


--Question 7: Create the TEACHER Table with a Foreign Key
create table TEACHER(
	teacher_id int GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
	first_name varchar(255) not null,
	last_name varchar(255) not null,
	email varchar(255) unique not null,
	hire_date date not null,
	department_id int,
	created_date date default current_date not null,
	foreign key(department_id) references department(department_id)
);

--Question 8: Define the TEACHER_COURSE Table
create table TEACHER_COURSE(
	teacher_course_id int GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
	teacher_id int,
	course_id int,
	created_date date default current_date not null,
	foreign key(teacher_id) references teacher(teacher_id),
	foreign key(course_id) references course(course_id)
);

--Question 9: Define the CLASSROOM Table with Relationships
create table CLASSROOM(
	classroom_id int GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
	room_number varchar(50) not null,
	capacity int not null,
	department_id int,
	created_date date default current_date not null,
	foreign key(department_id) references department(department_id)
);


-- Question 10: Define the CLASS_SCHEDULE Table with Relationships
create table CLASS_SCHEDULE(
	class_schedule_id int GENERATED ALWAYS AS IDENTITY PRIMARY KEY
	,semester_id int
	,course_id int
	,teacher_id int
	,start_date date not null
	,end_date date not null
	,start_time time not null
	,end_time time not null
	,created_date date default current_date
	,foreign key(semester_id) references semester(semester_id)
	,foreign key(course_id) references course(course_id)
	,foreign key(teacher_id) references teacher(teacher_id)
);

-- Question 11: Create the EXAM Table
create table exam (
	exam_id int GENERATED ALWAYS AS IDENTITY PRIMARY KEY
	,exam_name varchar(255) not null
	,course_id int
	,total_marks int not null
	,created_date date default current_date not null
	,foreign key(course_id) references course(course_id)
);


-- Question 12: Create the EXAM_SCHEDULE Table
create table EXAM_SCHEDULE(
	exam_schedule_id int GENERATED ALWAYS AS IDENTITY PRIMARY KEY
	,exam_date date not null
	,exam_id int
	,semester_id int
	,course_id int
	,classroom_id int
	,total_marks int not null
	,start_time time not null
	,end_time time not null
	,created_date date default current_date not null
	,foreign key(exam_id) references exam(exam_id)
	,foreign key(semester_id) references semester(semester_id)
	,foreign key(course_id) references course(course_id)
	,foreign key(classroom_id) references classroom(classroom_id)
);

-- Question 13: Create the EXAM_RESULT Table
create table EXAM_RESULT(
	exam_schedule_id int
	,student_id int
	,grade_id int
	,created_date date default current_date not null
	,foreign key(exam_schedule_id) references exam_schedule(exam_schedule_id)
	,foreign key(student_id) references student(student_id)
	,foreign key(grade_id) references grade(grade_id)
	,primary key(student_id, grade_id, exam_schedule_id)
);


-- Question 14: Create the EXAM_RESULT_MASTER Table
create table EXAM_RESULT_MASTER(
	exam_id int
	,student_id int
	,grade_id int
	,semester_id int
	,created_date date default current_date not null
	,foreign key(exam_id) references exam(exam_id)
	,foreign key(student_id) references student(student_id)
	,foreign key(grade_id) references grade(grade_id)
	,foreign key(semester_id) references semester(semester_id)
	,primary key(exam_id, student_id, grade_id, semester_id)
);

-- Question 15: Create the ATTENDANCE Table
create table ATTENDANCE(
	 attendance_id int GENERATED ALWAYS AS IDENTITY PRIMARY KEY
	,attendance_date date not null
	,student_id int
	,course_id int
	,absence_flag boolean not null
	,created_date date default current_date not null
	,foreign key(student_id) references student(student_id)
	,foreign key(course_id) references course(course_id)
);

-- Question 16: Create the FEE_STRUCTURE Table with Constraints
create table FEE_STRUCTURE(
	fee_id int GENERATED ALWAYS AS IDENTITY PRIMARY KEY
	,course_id int
	,fee_amount numeric(10,2) check (fee_amount > 0) not null
	,created_date date default current_date not null
	,foreign key(course_id) references course(course_id)
);

-- Question 17: Create the FEE_PAYMENT Table with Constraints
create table FEE_PAYMENT(
	payment_id int GENERATED ALWAYS AS IDENTITY PRIMARY KEY
	,student_id int
	,amount_paid numeric(10,2) not null
	,balance_amount numeric(10,2) not null
	,payment_date date default current_date not null
	,foreign key(student_id) references student(student_id)
);

-- Question 18: Create the EMPLOYEE_LOGIN Table
create table EMPLOYEE_LOGIN(
	employee_id int GENERATED ALWAYS AS IDENTITY PRIMARY KEY
	,login_id varchar(50) unique not null
	,password text not null 		---store it encrypted
	,active_flag int check(active_flag in (0,1)) not null
	,last_login_datetime timestamp default current_timestamp
);


-- Question 19: Create the AUDIT_LOG Table
create table AUDIT_LOG(
	log_id int GENERATED ALWAYS AS IDENTITY PRIMARY KEY
	,log_date timestamp default current_timestamp not null
	,action varchar(255) not null
	,user_id int not null
	,FOREIGN KEY(user_id) REFERENCES teacher(teacher_id)
    ,FOREIGN KEY(user_id) REFERENCES student(student_id)
);

-- Question 20: Add a Column to the TEACHER Table
-- Write a SQL statement to add a phone_number column of type VARCHAR(15) to the TEACHER table.
alter table TEACHER
add column phone_number VARCHAR(15) not null
;

-- Question 21: Alter a Column in the STUDENT Table
-- Write a SQL statement to alter the email column in the STUDENT table, increasing its length to 255 characters.
alter table STUDENT
alter column email type varchar(255)
;

-- Question 22:Create and Drop an Index from the TEACHER Table
-- Write a SQL statement to drop the index on the phone_number column in the TEACHER table.
create index idx_phone_number
on teacher(phone_number)
;

drop index idx_phone_number;


-- Question 23: Rename the FEE_PAYMENT Table
-- Write a SQL statement to rename the FEE_PAYMENT table to PAYMENT_TRANSACTION.

--alter table FEE_PAYMENT rename to PAYMENT_TRANSACTION;

-- Question 24: Add Primary Key
-- Write a SQL statement to add primary key to the EMPLOYEE_LOGIN table.

--alter table EMPLOYEE_LOGIN 
-- ADD constraint pk_login primary key(login_id);

-- Question 25: Add a Foreign Key column to the EXAM_SCHEDULE Table
-- Add a foreign key in the EXAM_SCHEDULE table to reference the CLASSROOM table.

-- alter table EXAM_SCHEDULE
-- ADD constraint fk_CLASSROOM foreign key(classroom_id) references  CLASSROOM(classroom_id);

-- Question 26: Drop a Column from the EXAM_SCHEDULE Table
-- Write a SQL statement to drop the class_id column from the EXAM_SCHEDULE table.

-- alter table EXAM_SCHEDULE
-- drop column class_id;

-- Question 27: Add Indexes to the STUDENT and COURSE Tables
-- Write SQL statements to:
-- Add an index on the last_name column in the STUDENT table.
create index idx_STUDENT_last_name
on STUDENT(last_name);

-- Add an index on the course_name column in the COURSE table.
create index idx_course_name
on COURSE(course_name);

-- Question 28: Add a CHECK Constraint on the ENROLLMENT Table
-- Write a SQL statement to add a CHECK constraint to the ENROLLMENT table ensuring that the grade is between 'A' and 'F', or NULL.
select * from ENROLLMENT;


-- Question 29: Drop the EMPLOYEE_LOGIN Table
-- Write a SQL statement to drop the EMPLOYEE_LOGIN table.

-- drop table EMPLOYEE_LOGIN;

-- Question 30: Add a UNIQUE Constraint on the EXAM Table
-- Write a SQL statement to add a UNIQUE constraint to the EXAM table ensuring that the exam_name is not repeated.

alter table exam
ADD constraint unique_exam_name unique(exam_name);

-- Question 31: Enforce UNIQUE constraints on all applicable tables.
-- Apply UNIQUE constraints to columns across the entire database wherever duplicate data is not permitted.

alter table department
ADD constraint unique_department_name unique(department_name);

alter table course
ADD constraint unique_course_name unique(course_name);

alter table teacher
ADD constraint unique_email unique(email);

alter table classroom
ADD constraint unique_room_number unique(room_number);

alter table exam
ADD constraint unique_exam_namee unique(exam_name);

-- GOOD LUCK WITH YOUR ASSIGNMENT!!!
-- Don't forget to contact us if you need any further assistance with your assignments, and most importantly, for a manual review and approval of your work.



