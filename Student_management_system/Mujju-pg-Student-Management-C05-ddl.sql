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



