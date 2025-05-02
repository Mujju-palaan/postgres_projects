-- Question 17: Add a Column to the EMPLOYEE Table
-- Write a SQL statement to add a phone_number column of type VARCHAR(15) to the EMPLOYEE table.
-- select * from employee;
alter table employee
add column phone_number varchar(15) unique not null;

-- Question 18: Alter a Column in the MEMBER Table
-- Write a SQL statement to alter the email column in the MEMBER table, increasing its length to 300 characters.
-- select * from members;
alter table members
alter email type varchar(300);


-- Question 19: Drop a Column from the EMPLOYEE_LOGIN Table
-- Write a SQL statement to drop the active_flag column from the EMPLOYEE_LOGIN table.
-- select * from EMPLOYEE_LOGIN
alter table EMPLOYEE_LOGIN drop column active_flag;

-- Question 20: Rename the AUDIT_LOG Table
-- Write a SQL statement to rename the AUDIT_LOG table to AUDIT_LOGS.
alter table audit_log rename to AUDIT_LOGS;

-- Question 21: Drop the EMPLOYEE_LOGIN Table
-- Write a SQL statement to drop the EMPLOYEE_LOGIN table.
drop table EMPLOYEE_LOGIN;

-- Question 22: Add a Primary Key on the BOOK_AUTHOR Table
-- Set up a composite primary key using author_id and book_id.
-- select * from BOOK_AUTHOR
alter table BOOK_AUTHOR
add constraint pk primary key(author_id, book_id);

-- Question 23: Add a Foreign Key column to the BOOK Table
-- Add a foreign key in the BOOK table to reference the BOOK_CATEGORY table.
-- select * from BOOK
alter table book
add column book_category_id int references book_category(book_category_id)
;

-- Question 24: Add a Foreign Key to BOOK Table
-- Add a foreign key in the BOOK table to referencing to PUBLISHER table.
-- select * from BOOK


-- Question 25: Add a Foreign Key column to the LOAN Table
-- Add a foreign key in the LOAN table to reference the EMPLOYEE table (indicating which employee issued the loan).
-- select * from LOAN
alter table loan
add column employee_id int references employee(employee_id);

-- Question 26: Add a CHECK Constraint on the LOAN Table
-- Write a SQL statement to add a CHECK constraint to the LOAN table ensuring that the loan_date is before the due_date.
-- select * from LOAN
alter table loan
add constraint chk_loan_dates CHECK (loan_date < due_date);

-- Question 27: Add a UNIQUE Constraint on the BOOK_CATEGORY Table
-- Write a SQL statement to add a UNIQUE constraint to the BOOK_CATEGORY table ensuring that the category_name is not repeated.
-- select * from BOOK_CATEGORY
alter table BOOK_CATEGORY
add constraint unique_BOOK_CATEGORY unique(category_name);

-- Question 28: Add a default Constraint on the EMPLOYEE Table
-- Write a SQL statement to add a current system timestamp DEFAULT constraint to the EMPLOYEE table on created_at column.
-- select * from EMPLOYEE


-- Question 29: Add Indexes to the BOOK and MEMBER Tables
-- Write SQL statements to:

-- Add an index on the title column in the BOOK table.
create index idx_title ON book(title);

-- Add an index on the last_name column in the MEMBER table.
create index idx_last_name ON members(last_name);

-- Question 30: Drop an Index from the BOOK Table
-- Write a SQL statement to drop the index on the title column in the BOOK table.
drop index idx_title;

-- Question 31: Enforce UNIQUE constraints on all applicable tables.
-- Apply UNIQUE constraints to columns across the entire database wherever duplicate data is not permitted.

