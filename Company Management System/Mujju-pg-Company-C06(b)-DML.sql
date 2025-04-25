DML ASSIGNMENT1 - Company Management System
Requirements:
You must complete the Chapter 5 DDL assignment before starting this one. In this assignment, you will use the same tables from the DDL assignment to write your DML queries.

Question 2: Insert Multiple Records into the TIMESHEET Table
Write a SQL query to insert multiple records into the TIMESHEET table in a single statement. Insert at least 5 timesheet records, each with different employee_id, date, and hours_worked.

Question 3: Insert Data into EMPLOYEE_PROJECT Using SELECT INTO
Insert all records from the EMPLOYEE_PROJECT table where project_id = 3 into a temporary table called TEMP_EMPLOYEE_PROJECT.

Question 4: Insert a Record into the AUDIT_LOG Table with Default Values
Insert a record into the AUDIT_LOG table using default values for all fields except action, which should be set to 'Data Cleanup'.

Question 5: Insert Data into the PROJECT Table Using a Subquery
Insert a new project into the PROJECT table, where the start_date is the same as the start date of the project with project_id = 1, but set a unique project_name.

Question 6: Update the Salary in the EMPLOYEE Table
Update the salary of the employee with employee_id = 5 in the EMPLOYEE table by increasing it by 5%.

Question 7: Perform an UPSERT (INSERT ON DUPLICATE KEY UPDATE) on the CLIENT Table
Write an SQL query to insert a new client into the CLIENT table with the following data:

Client Name: 'GlobalTech', Email: 'contact@globaltech.com'. If the client already exists, update the email to 'info@globaltech.com'.
Question 8: Update Employee Details Using a JOIN
Update the department_id for all employees in the EMPLOYEE table to 4 where the associated location in the DEPARTMENT table is 'New York'.

Question 9: Update the Total Amount in the PURCHASE_ORDER Table Using a Subquery
Update the total_amount in the PURCHASE_ORDER table by calculating the sum of all associated product prices in the PRODUCT table for the same order_id.

Question 10: Delete a CLIENT Record by Email
Write a SQL query to delete the client from the CLIENT table where the email is 'oldclient@example.com'.

Question 11: Delete from EMPLOYEE_PROJECT Using a Join
Delete all records from the EMPLOYEE_PROJECT table where the associated project in the PROJECT table has been completed (end_date is not null).

Question 12: Truncate the TEMP_EMPLOYEE_PROJECT Table
Truncate the TEMP_EMPLOYEE_PROJECT table to remove all data while keeping the table structure intact.

Question 13: Add a JSON Column to the CLIENT Table
Write an SQL query to add a JSON column named client_info to the CLIENT table to store additional client details.

Question 14: Insert Data into the JSON Column in the CLIENT Table
Insert JSON data into the client_info column for the client with client_id = 2. The JSON data should include the fields:

{"contact_person": "John Doe", "client_type": "VIP", "preferred_contact_method": "email"}
Question 15: Update Data in the JSON Column in the CLIENT Table
Update the client_info column for the client with client_id = 2 to change the preferred_contact_method to 'phone'.

Question 16: Delete a Field from the JSON Column in the CLIENT Table
Remove the client_type field from the client_info column for the client with client_id = 2.

Question 17: Insert Data into the INVOICE Table Using a Subquery
Insert a new invoice into the INVOICE table for the contract with the highest amount from the CONTRACT table. The invoice should include the current date and an amount due of 10% of the contract's total amount.

Question 18: Perform a Batch Update on the PRODUCT Table
Write an SQL query to decrease the price of all products in the PRODUCT table by 5% where the price is greater than 100.00.

Question 19: Delete All Records from CONTRACT Table Older Than a Specific Date
Write an SQL query to delete all records from the CONTRACT table where the contract_date is older than '2022-01-01'.

Question 20: Perform an Update on the EMPLOYEE_PROJECT Table Using a JOIN
Update the project_id in the EMPLOYEE_PROJECT table to 2 for all employees who are part of a department in the DEPARTMENT table with location = 'Chicago'.

Question 21: SUPER Complex INSERT.
Create a DATE_DIM table with columns: date_id, calendar_date, year, month, day_of_the_month, week_day_number, week_day_name, yearly_week_number, month_start_date_flag, month_end_date_flag, year_start_date_flag, year_end_date_flag, holiday_flag
The date_id should be populated in the YYYYMM format (e.g., 202401).
Populate the DATE_DIM table with data for current year and the next year.


Additional Instructions:
Ensure that your queries are designed to run in a MySQL environment.
Maintain the integrity of foreign key relationships when performing updates or deletes.
Use subqueries and JOINs where necessary, especially for inserting or updating data based on conditions from related tables.
Pay special attention to JSON column operations using MySQL’s JSON functions like JSON_SET(), JSON_REMOVE(), etc.
Ensure your queries follow best practices for data integrity.
GOOD LUCK WITH YOUR ASSIGNMENT!!!
Don't forget to contact us if you need any further assistance with your assignments, and most importantly, for a manual review and approval of your work.

