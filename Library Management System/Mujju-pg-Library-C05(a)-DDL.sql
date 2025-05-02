-- Question 1: Define the LIBRARY_BRANCH Table with Relationships

-- Write the SQL statement to create a LIBRARY_BRANCH table that includes:
-- branch_id as a primary key with auto-increment functionality.
-- branch_name as a string of maximum length 255 characters, not null.
-- location as a string with a maximum length of 255 characters, not null.
-- created_at as a datetime field, default it to system timestamp, not null.
create table LIBRARY_BRANCH(
	branch_id int generated always as identity primary key
	,branch_name varchar(255) unique not null
	,location varchar(255) unique not null
	,created_at date default current_date not null
);

-- Question 2: Create the EMPLOYEE Table
-- Create an EMPLOYEE table:
-- employee_id as a primary key with auto-increment functionality.
-- first_name as strings, not null.
-- last_name as strings, not null.
-- email as a unique string, not null.
-- hire_date as a date field, not null.
-- salary as a decimal (10, 2) field, not null.
-- branch_id as a foreign key referencing the BOOK table, not null.
-- created_at as a datetime field, not null.
create table EMPLOYEE(
	employee_id int generated always as identity primary key
	,first_name varchar(255) not null
	,last_name varchar(255) not null
	,email varchar(255) unique not null
	,hire_date date not null
	,salary numeric(10,2) not null
	,branch_id int not null
	,created_at date default current_date not null
);

-- Question 3: Create the AUTHOR Table with Constraints
-- Create a AUTHOR table with the following specifications:

-- author_id as a primary key with auto-increment functionality.
-- first_name as a string with a maximum length of 100 characters, and cannot be null.
-- last_name as a string with a maximum length of 100 characters.
-- email as a unique string, not null.
-- phone_number as a string, not null.
-- created_at as a datetime field, default it to system timestamp, not null.
create table AUTHOR(
	author_id  int generated always as identity primary key
	,first_name  varchar(255) not null
	,last_name  varchar(255) not null
	,email  varchar(255) unique not null
	,phone_number varchar(255) unique not null
	,created_at date default current_date not null
);

-- Question 4: Create the BOOK_CATEGORY Table with a Foreign Key
-- Define a BOOK_CATEGORY table:

-- book_category_id as a primary key with auto-increment functionality.
-- category_name as a string of maximum length 100 characters, not null.
-- created_at as a datetime field, default it to system timestamp, not null.
create table BOOK_CATEGORY(
	book_category_id  int generated always as identity primary key
	,category_name  varchar(255) not null
	,created_at date default current_date not null
);

-- Question 5: Create the PUBLISHER Table
-- Write a DDL SQL statement to create a PUBLISHER table with the following details:

-- publisher_id as the primary key with auto-increment functionality.
-- publisher_name as a string with a maximum length of 255 characters, unique, not null.
-- created_at as a datetime field, default it to system timestamp, not null.
create table PUBLISHER(
	publisher_id  int generated always as identity primary key
	,publisher_name varchar(255) not null
	,created_at  date default current_date not null
);

-- Question 6: Create the BOOK Table
-- Write a DDL SQL statement to create a BOOK table with the following requirements:

-- book_id as a primary key with auto-increment functionality.
-- title as a string of maximum length 255 characters, not null.
-- publication_year as an integer, not null.
-- publisher_id as an integer, not null.
-- isbn as a unique string of length 13, not null.
-- created_at as a datetime field, default it to system timestamp, not null.
create table IF NOT EXISTS BOOK(
	book_id  int generated always as identity primary key
	,title  varchar(255) not null
	,publication_year int not null
	,publisher_id  int not null
	,isbn varchar(13) unique not null
	,foreign key(publisher_id) references publisher(publisher_id)
	,created_at  date default current_date not null
);

-- Question 7: Define the BOOK_AUTHOR Table
-- Write the SQL statement to create a many-to-many relationship between books and authors. This will require the BOOK_AUTHOR table, which includes:

-- book_id as a foreign key referencing the BOOK table, not null.
-- author_id as a foreign key referencing the AUTHOR table, not null.
create table IF NOT EXISTS BOOK_AUTHOR(
	book_id int
	,author_id int
	,foreign key(book_id) references book(book_id)
	,foreign key(author_id) references author(author_id)
);

-- Question 8: Create the BOOK_INVENTORY Table
-- Write a DDL SQL statement to create a BOOK_INVENTORY table:

-- inventory_id as the primary key with auto-increment functionality.
-- book_id as a foreign key referencing the BOOK table, not null.
-- branch_id as a foreign key referencing the LIBRARY_BRANCH table, not null.
-- quantity as an integer, not null.
-- created_at as a datetime field, default it to system timestamp, not null.
-- drop table BOOK_INVENTORY
create table IF NOT EXISTS BOOK_INVENTORY(
	inventory_id  int generated always as identity primary key
	,book_id int not null
	,branch_id int  not null
	,quantity int check(quantity > 0) not null
	,foreign key(book_id) references book(book_id)
	,foreign key(branch_id) references LIBRARY_BRANCH(branch_id)
	,created_at  date default current_date not null
);

-- Question 9: Create the OVERDUE_POLICY Table with Constraints
-- Write a DDL SQL statement to create an OVERDUE_POLICY table:

-- policy_id as a primary key with auto-increment functionality.
-- max_days_allowed as an integer, not null.
-- fine_per_day as a decimal (5, 2), not null.
-- created_at as a datetime field, default it to system timestamp, not null.
-- Add a CHECK constraint to ensure max_days_allowed is greater than 0.
create table IF NOT EXISTS OVERDUE_POLICY(
	policy_id  int generated always as identity primary key
	,max_days_allowed int check(max_days_allowed > 0) not null
	,fine_per_day  numeric(10,2) not null
	,created_at  date default current_date not null
);

-- Question 10: Create the MEMBER Table with Constraints
-- Create a MEMBER table with the following specifications:

-- member_id as a primary key with auto-increment functionality.
-- first_name as a string with a maximum length of 100 characters, not null.
-- last_name as a string with a maximum length of 100 characters.
-- email as a unique string, not null.
-- phone_number as a string, not null.
-- gender as a string, null.
-- membership_expiry_date as a date field, with the default value of the current date.
-- created_at as a datetime field, default it to system timestamp, not null.
-- Add a CHECK constraint to ensure gender is M or F.
create table IF NOT EXISTS MEMBERS(
	member_id  int generated always as identity primary key
	,first_name varchar(255) not null
	,last_name  varchar(255) not null
	,email  varchar(255) unique not null
	,phone_number  varchar(255) unique not null
	,gender  varchar(255) check(gender in ('M','F')) not null
	,membership_expiry_date date default current_date + interval '1 year' not null
	,created_at  date default current_date not null
);

-- Question 11: Create the MEMBERSHIP_TYPE Table with Constraints
-- Write a DDL SQL statement to create a MEMBERSHIP_TYPE table:

-- membership_type_id as a primary key with auto-increment functionality.
-- membership_type as a string (e.g., "Free", "Premium"), not null.
-- active_flag as a boolean, default to true, not null.
-- validity_days as a number, not null.
-- created_at as a datetime field, default it to system timestamp, not null.
-- Add a CHECK constraint to ensure the subscription_type is in ("Free", "Standard:, "Standard").
-- drop table MEMBERSHIP_TYPE
create table IF NOT EXISTS MEMBERSHIP_TYPE(
	membership_type_id  int generated always as identity primary key
	,membership_type varchar check(membership_type in ('Free','Standard','Standard'))
	,active_flag boolean default 'true' not null
	,validity_days int not null
	,created_at  date default current_date not null
);

-- Question 12: Create the MEMBERSHIP_PAYMENT Table with Constraints
-- Write a DDL SQL statement to create a MEMBERSHIP_PAYMENT table:

-- payment_id as a primary key with auto-increment functionality.
-- membership_type_id as a foreign key referencing the MEMBERSHIP_TYPE table, not null.
-- amount_paid as a decimal (10, 2), not null.
-- payment_date as a datetime, not null.
-- member_id as a foreign key referencing the MEMBER table, not null.
-- created_at as a datetime field, default it to system timestamp, not null.
-- Add a CHECK constraint to ensure the amount_paid is greater than 0.
create table IF NOT EXISTS MEMBERSHIP_PAYMENT(
	payment_id  int generated always as identity primary key
	,membership_type_id int
	,amount_paid numeric(10,2) check(amount_paid > 0) not null
	,payment_date timestamp not null
	,member_id int
	,foreign key(membership_type_id) references membership_type(membership_type_id)
	,foreign key(member_id) references members(member_id)
	,created_at  date default current_date not null
);

-- Question 13: Create the LOAN Table
-- Define a LOAN table with the following details:

-- loan_id as a primary key with auto-increment functionality.
-- loan_date as a date field, not null, with the default value of the current date, null.
-- due_date as a date field, not null.
-- return_date as a date field, nullable.
-- book_id as a foreign key referencing the BOOK table, not null.
-- member_id as a foreign key referencing the MEMBER table, not null.
-- issue_branch_id as a foreign key referencing the LIBRARY_BRANCH table, not null.
-- return_branch_id as a number, null.
-- created_at as a datetime field, default it to system timestamp, not null.
create table IF NOT EXISTS LOAN(
	loan_id int generated always as identity primary key
	,loan_date date default current_date not null
	,due_date date not null
	,return_date date
	,book_id int not null
	,member_id int not null
	,issue_branch_id int not null
	,return_branch_id int not null
	,foreign key(book_id) references book(book_id)
	,foreign key(member_id) references members(member_id)
	,foreign key(issue_branch_id) references LIBRARY_BRANCH(branch_id)
	,created_at  date default current_date not null
);

-- Question 14: Create the FINE Table
-- Define a FINE table with the following specifications:

-- fine_id as a primary key with auto-increment functionality.
-- fine_amount as a decimal (5, 2), not null.
-- fine_date as a date, not null.
-- overdue_days as a number, not null.
-- return_time as a time, not null.
-- loan_id as a foreign key referencing the LOAN table, not null.
-- collected_by_employee_id as a foreign key referencing the EMPLOYEE table, not null.
-- collected_branch_id as a foreign key referencing the LIBRARY_BRANCH table, not null.
-- created_at as a datetime field, default it to system timestamp, not null.
create table IF NOT EXISTS FINE(
	fine_id  int generated always as identity primary key
	,fine_amount numeric(10,2) not null
	,fine_date date not null
	,overdue_days int not null
	,return_time time not null
	,loan_id int not null
	,collected_by_employee_id int
	,collected_branch_id int
	,foreign key(loan_id) references loan(loan_id)
	,foreign key(collected_by_employee_id) references employee(employee_id)
	,foreign key(collected_branch_id) references LIBRARY_BRANCH(branch_id)
	,created_at  date default current_date not null
);

-- Question 15: Create the AUDIT_LOG Table
-- Define an AUDIT_LOG table to track changes in the library system:

-- log_id as a primary key with auto-increment functionality.
-- log_date as a date field, not null.
-- action as a string to describe the action performed.
-- employee_id as a foreign key referencing the EMPLOYEE table.
create table IF NOT EXISTS AUDIT_LOG(
	log_id  int generated always as identity primary key
	,log_date timestamp default current_timestamp not null
	,action varchar(255) not null
	,employee_id int not null
	,foreign key(employee_id) references employee(employee_id)
	,created_at  date default current_date not null
);

-- Question 16: Create the EMPLOYEE_LOGIN Table
-- Write a DDL SQL statement to create an EMPLOYEE_LOGIN table (one-to-one relationship with employee table):

-- employee_id as a foreign key referencing the CUSTOMER table.
-- login_id can use alpha numeric login id or email as login id, not null.
-- password must encrypt the password before storing it in the database table, not null.
-- active_flag use numeric, 0 or 1, you can lock the customer login when required, not null.
-- last_login_datetime as a timestamp, last successfull login date for a given employee.

CREATE EXTENSION IF NOT EXISTS pgcrypto;

-- SELECT pgp_sym_encrypt('my_password', 'my_secret_key');                         --to encrypt
-- SELECT pgp_sym_decrypt(encrypted_password, 'my_secret_key');                --to dencrypt

create table IF NOT EXISTS EMPLOYEE_LOGIN(
	employee_id  int generated always as identity primary key
	,login_id varchar not null
	,password  BYTEA NOT NULL
	,active_flag int check(active_flag in (0,1)) not null
	,last_login_datetime  timestamp default current_timestamp not null
);


