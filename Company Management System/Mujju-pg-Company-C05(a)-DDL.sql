Chapter 5 - DDL (Data Definition Language)
SQL DDL ASSIGNMENT1 - Company Management System

Question 1: Create the DEPARTMENT Table
Write a DDL SQL statement to create a DEPARTMENT table with the following requirements:

department_id as a primary key with auto-increment functionality.
department_name as a string of maximum length 255 characters, not null.
location as a string.
created_at as a datetime field, default it to system timestamp, not null.


Question 2: Create the EMPLOYEE Table with Constraints
Create an EMPLOYEE table with the following specifications:

employee_id as the primary key with auto-increment functionality.
first_name as a variable character string, not to exceed 100 characters, not null.
last_name as a string with a maximum of 100 characters.
hire_date as a date field, not null.
salary as a decimal with a maximum precision of 10, 2.
Add a CHECK constraint on salary to ensure it is greater than 0.
yearly_leave_count as a number.
created_at as a datetime field, not null.


Question 3: Create the PRODUCT Table with a CHECK Constraint
Write a DDL SQL statement to create a PRODUCT table:

product_id as the primary key with auto-increment functionality.
product_name as a string of maximum length 255 characters, not null.
price as a decimal, not null.
Add a CHECK constraint to ensure the price is greater than 0.
product_category as string, not null.
order_level as number
current_quantity as number
created_at as a datetime field, default it to system timestamp, not null.


Question 4: Create the CLIENT Table
Define a CLIENT table:

client_id as a primary key with auto-increment functionality.
client_name as a string with a maximum length of 255 characters, not null.
email as a string that must be unique and cannot be null.
created_at as a datetime field, default it to system timestamp, not null.


Question 5: Create the SUPPLIER Table
Write a DDL SQL statement to create a SUPPLIER table with the following details:

supplier_id as the primary key with auto-increment functionality.
supplier_name as a string of maximum length 255 characters, not null.
contact_number as a string.
Ensure that the contact_number is unique across all suppliers.
created_at as a datetime field, default it to system timestamp, not null.


Question 6: Create the PURCHASE_ORDER Table
Write a DDL SQL statement to create a PURCHASE_ORDER table with the following details:

order_id as the primary key with auto-increment functionality.
order_date as a date field, not null.
total_amount as a decimal field, not null.
created_at as a datetime field, default it to system timestamp, not null.


Question 7: Create the PURCHASE_ORDER_DETAIL Table
Write a DDL SQL statement to create a PURCHASE_ORDER_DETAIL table with the following details:

order_detail_id as the primary key with auto-increment functionality.
quantity as a number field, not null.
unit_amount as a decimal field, not null.
total_amount as a decimal field, not null.
product_id as a foreign ke, not null.
order_id as a foreign key referencing the PURCHASE_ORDER table.


Question 8: Create the PROJECT Table
Define a PROJECT table with the following details:

project_id as the primary key with auto-increment functionality.
project_name as a string with a maximum length of 255 characters, not null.
start_date as a date field, not null.
end_date as a date field.
Add a CHECK constraint to ensure end_date is greater than start_date.
active_status as boolean, default to true.
created_at as a datetime field, default it to system timestamp, not null.


Question 9: Define the PROJECT_PRODUCT_USED Relationship Table
Write the SQL statement to create an PROJECT_PRODUCT_USED table that tracks which employees are working on which projects. Include:

project_id as a foreign key, not null.

product_id as a foreign key, not null.

quantity as a number, not null.

created_at as a datetime field, default it to system timestamp, not null.

Set up a composite primary key using both columns.


Question 10: Define the EMPLOYEE_PROJECT Relationship Table
Write the SQL statement to create an EMPLOYEE_PROJECT table that tracks which employees are working on which projects. Include:

project_id as a foreign key, not null.
employee_id as a foreign key, not null.
task as a string.
task_due_date as a date.
created_at as a datetime field, default it to system timestamp, not null.


Question 11: Define the CONTRACT Table with Foreign Keys
Write the SQL statement to create a CONTRACT table that includes:

contract_id as an auto-incrementing primary key.
contract_date as a date, not null.
amount as a decimal (12, 2), not null.
client_id as a foreign key, not null.
project_id as a foreign key, not null.
created_at as a datetime field, default it to system timestamp, not null.


Question 12: Create the INVOICE Table with Constraints
Define an INVOICE table with the following specifications:

invoice_id as the primary key with auto-increment functionality.
project_id as the foreign key, not null.
invoice_date as a date, with the default value being the current date.
amount_due as a decimal (12, 2), not null.
status as paid or unpaid
Add a CHECK constraint to ensure the amount_due is greater than 0.
created_at as a datetime field, default it to system timestamp, not null.


Question 13: Create the RECEIVABLE_TRANSACTION Table with a CHECK Constraint
Write a DDL SQL statement to create a PAYABLE_TRANSACTION table:

receivable_transaction_id as the primary key with auto-increment functionality.
description as a string of maximum length 255 characters.
amount as a decimal, not null.
payment_date as a timestamp, not null.
contract_invoice_id as the foreign key to INVOICE table, not null.
Add a CHECK constraint to ensure the amount is greater than 0.


Question 14: Create the PAYABLE_TRANSACTION Table with a CHECK Constraint
Write a DDL SQL statement to create a PAYABLE_TRANSACTION table:

payable_transaction_id as the primary key with auto-increment functionality.
description as a string of maximum length 255 characters.
amount as a decimal, not null.
payment_date as a timestamp, not null.
purchase_order_id as the foreign key to PURCHASE_ORDER table, not null.
Add a CHECK constraint to ensure the amount is greater than 0.


Question 15: Create the TIMESHEET Table with Defaults
Create a TIMESHEET table:

timesheet_id as the primary key with auto-increment functionality.
employee_id as a foreign key, not null.
date as a date field, defaulted to the current date.
hours_worked as a time value, not null.
project_id as a foreign key, not null.
created_at as a datetime field, default it to system timestamp, not null.


Question 16: Create the EMPLOYEE_LEAVES Table
Define an EMPLOYEE_LEAVES table to track system changes:

leave_id as the primary key with auto-increment functionality.
employee_id as a foreign key, not null.
start_date as a date field, not null.
end_date as a date field, not null.
reason as a string.
approved_employee_id as a foreign key referencing the EMPLOYEE table.
created_at as a datetime field, default it to system timestamp, not null.


Question 17: Create the AUDIT_LOG Table
Define an AUDIT_LOG table to track system changes:

log_id as the primary key with auto-increment functionality.
log_date as a date field, not null.
action as a string to describe the action performed.
employee_id as a foreign key referencing the EMPLOYEE table.


Question 18: Create the EMPLOYEE_LOGIN Table
Write a DDL SQL statement to create an EMPLOYEE_LOGIN table (one-to-one relationship with employee table):

employee_id as a foreign key referencing the EMPLOYEE table.
login_id can use alpha numeric login id or email as login id, not null.
password must encrypt the password before storing it in the database table.
active_flag as boolean, 0 or 1, you can lock the customer login when required, not null.
last_login_datetime as a timestamp, last successful login date for a given customer.


