-- Question 19: Add a Column to the EMPLOYEE Table
-- Write a SQL statement to add a phone_number column of type VARCHAR(15) to the EMPLOYEE table.
alter table EMPLOYEE add column phone_number VARCHAR(15) unique not null;
-- select * from EMPLOYEE;


-- Question 20: Alter a Column in the CLIENT Table
-- Write a SQL statement to alter the email column in the CLIENT table, increasing its length to 255 characters.
-- select * from CLIENT;
alter table CLIENT alter column email type varchar(225);

-- Question 21: Drop a Column from the PAYABLE_TRANSACTION Table
-- Write a SQL statement to drop the description column from the PAYABLE_TRANSACTION table.
-- select * from PAYABLE_TRANSACTION;
alter table PAYABLE_TRANSACTION drop column description;

-- Question 22: Rename the AUDIT_LOG Table
-- Write a SQL statement to rename the AUDIT_LOG table to AUDIT_LOGS.
-- select * from AUDIT_LOGs;
alter table AUDIT_LOG rename to AUDIT_LOGs;

-- Question 23: Drop the EMPLOYEE_LOGIN Table
-- Write a SQL statement to drop the ** EMPLOYEE_LOGIN** table.
-- select * from EMPLOYEE_LOGIN;
drop table EMPLOYEE_LOGIN;

-- Question 24: Add a Primary Key on the EMPLOYEE_PROJECT Table
-- Set up a composite primary key using project_id and employee_id.
-- select * from EMPLOYEE_PROJECT;
alter table EMPLOYEE_PROJECT
add constraint pk_pj primary key(project_id, employee_id); 

-- Question 25: Add a Foreign Key column to the EMPLOYEE Table
-- Add a foreign key in the EMPLOYEE table to reference the DEPARTMENT table.
-- select * from EMPLOYEE;
ALTER TABLE EMPLOYEE
ADD COLUMN department_id INT REFERENCES DEPARTMENT(department_id);


-- Question 26: Alter the PURCHASE_ORDER Table to Add a Foreign Key
-- Write a SQL statement to add a supplier_id foreign key to the PURCHASE_ORDER table, referencing the SUPPLIER table.
-- select * from PURCHASE_ORDER;
-- select * from SUPPLIER;
alter table PURCHASE_ORDER
ADD COLUMN supplier_id int references supplier(supplier_id);


-- Question 27: Add a CHECK Constraint on the PURCHASE_ORDER Table
-- Write a SQL statement to add a CHECK constraint to the PURCHASE_ORDER table, ensuring that the total_amount is greater than 0.



-- Question 28: Add a UNIQUE Constraint on the PROJECT Table
-- Write a SQL statement to add a UNIQUE constraint to the PROJECT table ensuring that the project_name is not repeated.
-- select * from PROJECT;
alter table PROJECT
add constraint unk UNIQUE(project_name);


-- Question 29: Add a default Constraint on the EMPLOYEE Table
-- Write a SQL statement to add a current system timestamp DEFAULT constraint to the EMPLOYEE table on created_at column.



-- Question 30: Add Indexes to the EMPLOYEE and PROJECT Tables
-- Write SQL statements to:
-- Add an index on the last_name column in the EMPLOYEE table.
create index idx_emp_last_name ON EMPLOYEE(last_name);

-- Add an index on the project_name column in the PROJECT table.
create index idx_PROJECT_name ON PROJECT(project_name);


-- Question 31: Drop an Index from the EMPLOYEE Table
-- Write a SQL statement to drop the index on the last_name column in the EMPLOYEE table.
drop index idx_emp_last_name;

-- Question 32: Enforce UNIQUE constraints on all applicable tables.
-- Apply UNIQUE constraints to columns across the entire database wherever duplicate data is not permitted.

