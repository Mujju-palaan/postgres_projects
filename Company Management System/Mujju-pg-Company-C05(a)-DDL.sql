-- Chapter 5 - DDL (Data Definition Language)
-- SQL DDL ASSIGNMENT1 - Company Management System

-- Question 1: Create the DEPARTMENT Table
-- Write a DDL SQL statement to create a DEPARTMENT table with the following requirements:
create table DEPARTMENT(
	department_id int generated always as identity primary key
	,department_name varchar(255) not null
	,location varchar(255) not null
	,created_at date default current_date
);

-- Question 2: Create the EMPLOYEE Table with Constraints
-- Create an EMPLOYEE table with the following specifications:
create table EMPLOYEE(
	employee_id int generated always as identity primary key
	,first_name  varchar(100) not null
	,last_name  varchar(100) not null
	,hire_date date not null
	,salary numeric(10,2) check(salary > 0) not null
	,yearly_leave_count int not null
	,created_at date default current_date not null
);

-- Question 3: Create the PRODUCT Table with a CHECK Constraint
-- Write a DDL SQL statement to create a PRODUCT table:
create table product(
	product_id int generated always as identity primary key
	,product_name varchar(100) unique not null
	,price numeric(10,2) check(price > 0) not null
	,product_category varchar(255) not null
	,order_level int not null
	,current_quantity  int not null
	,created_at date default current_date not null
);

-- Question 4: Create the CLIENT Table
-- Define a CLIENT table:
create table CLIENT(
	client_id int generated always as identity primary key
	,client_name varchar(255) not null
	,email varchar(255) unique not null
	,created_at date default current_date not null
);

-- Question 5: Create the SUPPLIER Table
-- Write a DDL SQL statement to create a SUPPLIER table with the following details:
create table SUPPLIER(
	supplier_id int generated always as identity primary key
	,supplier_name varchar(255) not null
	,contact_number varchar(255) unique not null
	,created_at date default current_date not null
);

-- Question 6: Create the PURCHASE_ORDER Table
-- Write a DDL SQL statement to create a PURCHASE_ORDER table with the following details:
create table PURCHASE_ORDER(
	order_id int generated always as identity primary key
	,order_date  date not null
	,total_amount numeric(10,2) check(total_amount > 0) not null
	,created_at date default current_date not null
);

-- Question 7: Create the PURCHASE_ORDER_DETAIL Table
-- Write a DDL SQL statement to create a PURCHASE_ORDER_DETAIL table with the following details:
create table PURCHASE_ORDER_DETAIL(
	order_detail_id int generated always as identity primary key
	,quantity int not null
	,unit_amount numeric(10,2) not null
	,total_amount numeric(10,2) check(total_amount > 0) not null
	,product_id int not null
	,order_id int not null
	,foreign key(product_id) references product(product_id)
	,foreign key(order_id) references PURCHASE_ORDER(order_id)
	,created_at date default current_date not null
);

-- Question 8: Create the PROJECT Table
-- Define a PROJECT table with the following details:
create table PROJECT(
	project_id int generated always as identity primary key
	,project_name varchar(255) not null
	,start_date date not null
	,end_date date check(end_date > start_date) not null
	,active_status boolean default 'true' 
	,created_at  date default current_date not null
);


-- Question 9: Define the PROJECT_PRODUCT_USED Relationship Table
-- Write the SQL statement to create an PROJECT_PRODUCT_USED table that tracks which employees are working on which projects. Include:
create table PROJECT_PRODUCT_USED(
	project_id int
	,product_id int
	,quantity int not null
	,created_at date default current_date not null
	,foreign key(project_id) references project(project_id)
	,foreign key(product_id) references product(product_id)
	,primary key(project_id, product_id)
);

-- Question 10: Define the EMPLOYEE_PROJECT Relationship Table
-- Write the SQL statement to create an EMPLOYEE_PROJECT table that tracks which employees are working on which projects. Include:
create table EMPLOYEE_PROJECT(
	project_id int  not null
	,employee_id int  not null
	,task  varchar(255) not null
	,task_due_date date not null
	,foreign key(project_id) references project(project_id)
	,foreign key(employee_id) references employee(employee_id)
	,created_at date default current_date not null	
);

-- Question 11: Define the CONTRACT Table with Foreign Keys
-- Write the SQL statement to create a CONTRACT table that includes:

-- contract_id as an auto-incrementing primary key.
-- contract_date as a date, not null.
-- amount as a decimal (12, 2), not null.
-- client_id as a foreign key, not null.
-- project_id as a foreign key, not null.
-- created_at as a datetime field, default it to system timestamp, not null.
create table CONTRACT(
	contract_id int generated always as identity primary key
	,contract_date date not null
	,amount numeric(12,2) not null
	,client_id int  not null
	,project_id int  not null
	,foreign key(client_id) references client(client_id)
	,foreign key(project_id) references project(project_id)
	,created_at date default current_date not null	
);

-- Question 12: Create the INVOICE Table with Constraints
-- Define an INVOICE table with the following specifications:

-- invoice_id as the primary key with auto-increment functionality.
-- project_id as the foreign key, not null.
-- invoice_date as a date, with the default value being the current date.
-- amount_due as a decimal (12, 2), not null.
-- status as paid or unpaid
-- Add a CHECK constraint to ensure the amount_due is greater than 0.
-- created_at as a datetime field, default it to system timestamp, not null.
create table INVOICE(
	invoice_id int generated always as identity primary key
	,project_id int not null
	,invoice_date date default current_date not null	
	,amount_due  numeric(12,2)  check(amount_due > 0) not null
	,status varchar(255) check(status in ('paid','unpaid')) not null
	,foreign key(project_id) references project(project_id)
	,created_at date default current_date not null	
);

-- Question 13: Create the RECEIVABLE_TRANSACTION Table with a CHECK Constraint
-- Write a DDL SQL statement to create a PAYABLE_TRANSACTION table:

-- receivable_transaction_id as the primary key with auto-increment functionality.
-- description as a string of maximum length 255 characters.
-- amount as a decimal, not null.
-- payment_date as a timestamp, not null.
-- contract_invoice_id as the foreign key to INVOICE table, not null.
-- Add a CHECK constraint to ensure the amount is greater than 0.
create table RECEIVABLE_TRANSACTION(
	receivable_transaction_id int generated always as identity primary key
	,description  varchar(255) not null
	,amount  numeric(12,2)  check(amount > 0) not null
	,payment_date timestamp  not null
	,contract_invoice_id int
	,foreign key(contract_invoice_id) references INVOICE(invoice_id)
	,created_at date default current_date not null
);

-- Question 14: Create the PAYABLE_TRANSACTION Table with a CHECK Constraint
-- Write a DDL SQL statement to create a PAYABLE_TRANSACTION table:

-- payable_transaction_id as the primary key with auto-increment functionality.
-- description as a string of maximum length 255 characters.
-- amount as a decimal, not null.
-- payment_date as a timestamp, not null.
-- purchase_order_id as the foreign key to PURCHASE_ORDER table, not null.
-- Add a CHECK constraint to ensure the amount is greater than 0.
create table PAYABLE_TRANSACTION(
	payable_transaction_id  int generated always as identity primary key
	,description  varchar(255) not null
	,amount numeric(12,2)  check(amount > 0) not null
	,payment_date date not null
	,purchase_order_id int  not null
	,foreign key(purchase_order_id) references PURCHASE_ORDER(order_id)
	,created_at date default current_date not null
);

-- Question 15: Create the TIMESHEET Table with Defaults
-- Create a TIMESHEET table:

-- timesheet_id as the primary key with auto-increment functionality.
-- employee_id as a foreign key, not null.
-- date as a date field, defaulted to the current date.
-- hours_worked as a time value, not null.
-- project_id as a foreign key, not null.
-- created_at as a datetime field, default it to system timestamp, not null.
create table TIMESHEET(
	timesheet_id int generated always as identity primary key
	,employee_id int not null
	,t_date date default current_date not null
	,hours_worked time not null
	,project_id int
	,foreign key(employee_id) references employee(employee_id)
	,foreign key(project_id) references project(project_id)
	,created_at date default current_date not null
);

-- Question 16: Create the EMPLOYEE_LEAVES Table
-- Define an EMPLOYEE_LEAVES table to track system changes:

-- leave_id as the primary key with auto-increment functionality.
-- employee_id as a foreign key, not null.
-- start_date as a date field, not null.
-- end_date as a date field, not null.
-- reason as a string.
-- approved_employee_id as a foreign key referencing the EMPLOYEE table.
-- created_at  as a datetime field, default it to system timestamp, not null.
create table EMPLOYEE_LEAVES(
	leave_id int generated always as identity primary key
	,employee_id int not null
	,start_date date not null
	,end_date  date not null
	,reason  varchar(255) not null
	,approved_employee_id int not null
	,foreign key(employee_id) references employee(employee_id)
	,foreign key(approved_employee_id) references employee(employee_id)
	,created_at date default current_date not null
);

-- Question 17: Create the AUDIT_LOG Table
-- Define an AUDIT_LOG table to track system changes:

-- log_id as the primary key with auto-increment functionality.
-- log_date as a date field, not null.
-- action as a string to describe the action performed.
-- employee_id as a foreign key referencing the EMPLOYEE table.
create table AUDIT_LOG(
	log_id int generated always as identity primary key
	,log_date date not null
	,action varchar(255) not null
	,employee_id  int not null
	,foreign key(employee_id) references employee(employee_id)
);

-- Question 18: Create the EMPLOYEE_LOGIN Table
-- Write a DDL SQL statement to create an EMPLOYEE_LOGIN table (one-to-one relationship with employee table):

-- employee_id as a foreign key referencing the EMPLOYEE table.
-- login_id can use alpha numeric login id or email as login id, not null.
-- password must encrypt the password before storing it in the database table.
-- active_flag as boolean, 0 or 1, you can lock the customer login when required, not null.
-- last_login_datetime as a timestamp, last successful login date for a given customer.
CREATE EXTENSION IF NOT EXISTS pgcrypto;

create table EMPLOYEE_LOGIN(
	employee_id int not null
	,login_id varchar(255) not null
	,password BYTEA NOT NULL
	,active_flag INT NOT NULL CHECK (active_flag IN (0, 1))
	,last_login_datetime timestamp default current_timestamp not null
	,foreign key(employee_id) references employee(employee_id)
);

