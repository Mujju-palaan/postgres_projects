-- -- -- Banking_Application_System
-- -- --Mujju-pg-Bank-C10-Project
-- Chapter 10 - Projects
-- Final Capstone Project 1: Banking System in PostgreSQL

-- Assignment Tasks:
-- Stored Procedure Tasks:

-- 1)Stored Procedure for Employee Information
-- Write a stored procedure that retrieves all rows from the EMPLOYEE table where the city is a specific value passed as a input parameter.

--drop function fun_get_employee_details;

create or replace function fun_get_employee_details(iparam_city_id int)
returns table(
	iparam_employee_id int
	,iparam_employee_name text
	,iparam_hire_date date
	,iparam_salary numeric
	,iparam_branch_id int
	,iparam_city_name varchar
)
language plpgsql
as $$

BEGIN
	return query
	select a.employee_id
			,a.first_name||' '||a.last_name as employee_name
			,a.hire_date
			,a.salary
			,a.branch_id
			,b.city_name
	from employee a
	inner join city b using(city_id)
	where b.city_id = iparam_city_id;

END;
$$;

--select * from fun_get_employee_details(1);


-- ------------------------------------------------------------------------------------------------------------

-- 2)Stored Procedure for City Management
-- Write a stored procedure to insert a new record into the CITY table. The procedure should take country_name 
--and city_name as input parameters.

create or replace procedure scrop_insert_city_dml(
	IN iparam_country_name varchar
	,IN iparam_city_name varchar
)
language plpgsql
as $$

BEGIN
	--insert (select * from city)
	insert into city(country_name, city_name)
	values(iparam_country_name,iparam_city_name)
	;

END;
$$;

--call scrop_insert_city_dml('India','Hyderabad');

-- ------------------------------------------------------------------------------------------------------------

-- 3)Stored Procedure for Salary Management version 1
-- Write a stored procedure to update the salary of a specific EMPLOYEE by adding a updated salary. 
--The procedure should take employee_id and new salary as parameters.

--drop procedure scrop_update_salary;

create or replace procedure scrop_update_salary(
	IN iparam_employee_id int
	,IN iparam_salary numeric
)
language plpgsql
as $$

BEGIN
	---update (select * from employee)
	update employee set salary = iparam_salary
	where employee_id = iparam_employee_id
	;

END;
$$;

--call scrop_update_salary(1, 55000);
-- ------------------------------------------------------------------------------------------------------------

-- 4)Stored Procedure for Salary Management version 2
-- Design a database stored procedure to update employee salaries for multiple employee IDs provided as input. 
--The procedure should also accept the salary increase percentage as an input parameter. Utilize JSON, XML, or SQL 
--table variables to manage and process multiple employee records. Temporary tables can be used if required. 
--Input parameters: employee_ids and increase_percent.
create or replace fun fun_salary_management(
	IN iparam_employee_ids json
	,IN iparam_increase_percent
)
Declare 
		d_salary numeric;
		d_updated_salary numeric;
		
as $$

BEGIN
	---temp tbl
	create temp table temp_salary_management(
		employee_id int
		,salary numeric
	);
	
	---ids
	SELECT CAST(value AS INTEGER) AS emp_id FROM jsonb_array_elements_text(iparam_employee_ids::jsonb);

	--select
	select salary
	into d_salary
	from employee
	where employee_id = iparam_employee_ids;

	--calculate
	d_salary * iparam_increase_percent = d_updated_salary
	
	--insert
	insert into temp_salary_management(employee_id, salary)
	values(iparam_employee_ids, d_updated_salary)

END;
$$
language plpgsql;


-- ------------------------------------------------------------------------------------------------------------

-- 5)Stored Procedure for Customer Data Grid
-- Create a database stored procedure to retrieve comprehensive customer details, including phone_number and email, 
--for displaying in the Customer Management screen's data grid. The procedure should also calculate and return the 
--customer's cash balance, credit balance, and loan balance. Implement pagination for the UI grid using temporary tables, 
--with the UI grid page number passed as an input parameter.




-- ------------------------------------------------------------------------------------------------------------

-- 6)Stored Procedure for Loan Payments
-- Create a database stored procedure to fetch all loan instalments for a specific customer by accepting customer_id as an input parameter.
--The procedure should join the CUSTOMER, LOAN, and LOAN_INSTALMENTS tables to retrieve relevant details, including loan_id, 
--instalment_amount, due_date, paid_date, and loan_start_date.




-- ------------------------------------------------------------------------------------------------------------

-- 7)Stored Procedure for Banking Transactions
-- Develop an SQL stored procedure to process banking debit and credit transactions. The procedure should execute 
--the following tasks: log the transaction in the transaction table, update the account balance, and document the changes 
--in the account history. Additionally, if the transaction pertains to a credit card purchase, ensure the CARD table is updated accordingly.




-- ------------------------------------------------------------------------------------------------------------

-- 8)Stored Procedure for Loan Payment
-- Create a stored procedure to manage loan payments. The procedure should execute the following tasks: log the payment 
--in the transaction table, record the details in the loan payment table, update the loan instalment records, adjust the 
--account balance, and document the changes in the account history. If the payment clears the loan in full, update the 
--loan's end date in the LOAN table. To accommodate payments covering multiple months, accept instalment IDs as input and 
--distribute the funds across the specified monthly instalment buckets accordingly.




-- ------------------------------------------------------------------------------------------------------------

-- 9)Stored Procedure for Fund Transfer
-- Create a stored procedure to manage fund transfer details. The procedure should perform the following operations: 
--insert a record into the fund transfer table, log the transaction in the transaction table, update the account balance, 
--and record the changes in the account history.





-- ------------------------------------------------------------------------------------------------------------

-- 10)Stored Procedure to Reverse a Fund Transfer
-- Develop a stored procedure to handle fund transfer refunds. The procedure should execute the following actions. 
--update the fund transfer record, log the refund in the transaction table, adjust the account balance, and document 
--the changes in the account history.





-- ------------------------------------------------------------------------------------------------------------

-- 11)Stored Procedure for Customer Login
-- Create a database stored procedure to validate user login, fetch customer details, and update the last_login_datetime. 
--The procedure should return an error if the login ID is not found or the password does not match. Ensure the stored 
--encrypted password is decrypted during the validation process.





-- ------------------------------------------------------------------------------------------------------------

-- View Tasks:

-- 1)View for Customer Information
-- Create a db view that retrieves the first_name, last_name, email, and phone_number of all customers along with 
--their corresponding city names.
create view view_customer_info as
	select first_name
		,last_name
		,email
		,phone_number
		,city_name
	from customer
	inner join city using(city_id)
;

--select * from view_customer_info;

-- ------------------------------------------------------------------------------------------------------------
-- 2)View for Account Details
-- Create a database view that displays account details, customer_id, first_name, last_name, account_id, account_type, 
--and balance. Include the city name and country name using appropriate joins.

create or replace view customer_account_details as
	select a.customer_id
		,a.first_name
		,a.last_name
		,b.account_id
		,b.account_type
		,b.balance
		,c.city_name
		,c.country_name
	from customer a
	inner join account b using(customer_id)
	inner join city c using(city_id)
;

--select * from customer_account_details;

-- ------------------------------------------------------------------------------------------------------------

-- 3)View for Loan Details
-- Create a SQL view to summarize loan details, including: loan_id, customer_id, first_name, last_name, loan_amount, 
--interest_rate, loan_start_date, and loan_end_date. Include the total number of instalments and the sum of all 
--instalment amounts for each loan.

create or replace view view_loan_details as
	select b.loan_id
			,a.customer_id
			,a.first_name
			,a.last_name
			,b.loan_amount
			,b.interest_rate
			,b.loan_start_date
			,b.loan_end_date
			,count(c.instalment_id)
			,sum(c.instalment_amount)
	from customer a
	inner join account aa using(customer_id)
	inner join loan b using(account_id)
	inner join loan_instalments c	using(loan_id)
	group by b.loan_id ,a.customer_id
;

select * from view_loan_details;

-- ------------------------------------------------------------------------------------------------------------

-- Function Tasks:
-- 1)Function to Calculate Total Loan Balance per Customer
-- Write a database function to calculate the total outstanding loan balance for a customer based on their loans. 
--Use SQL variables within the function to implement this logic.

drop function fun_loan_balance_per_customer;

create or replace function fun_loan_balance_per_customer(iparam_customer_id int)
returns table(
	customer_id int
	,customer_name text
	,outstanding_amount numeric
)

as $$

BEGIN
	return query
	select a.customer_id
			,a.first_name||' '||a.last_name
			,c.instalment_amount * (extract(month from b.loan_end_date) - extract(month from current_date))
			-- ,instalment_amount
			-- ,extract(month from loan_end_date) - extract(month from current_date)
	from customer a
	inner join account aa using(customer_id)
	inner join loan b using(account_id)
	inner join loan_instalments c using(loan_id)
	where c.instalment_amount * (extract(month from b.loan_end_date) - extract(month from current_date)) > 0
			AND
			a.customer_id = iparam_customer_id
	;

END;
$$
language plpgsql;

--select * from fun_loan_balance_per_customer(2);

-- ------------------------------------------------------------------------------------------------------------

-- 2)Function to Calculate Interest on Loans
-- Write a database function that calculates the monthly interest to be added to the principal amount of a loan each month, 
--based on the loan_amount, interest_rate, and number_of_monthly_instalments.




-- ------------------------------------------------------------------------------------------------------------

-- 3)Function to display loan details
-- Write a database function that retrieves customer loan information based on the screen design provided at the bottom of this webpage.





-- ------------------------------------------------------------------------------------------------------------
-- Trigger Task:

-- 1)Trigger on Transaction Amount Changes

-- Create a trigger on the TRANSACTION table that logs changes to the amount field into the AUDIT_LOG table. 
--The log should capture the transaction_id, old_amount, new_amount, log_date, and employee_id.




-- ------------------------------------------------------------------------------------------------------------

-- 2)Insert and Update Triggers on ACCOUNT_HISTORY table -Create a trigger on the ACCOUNT_HISTORY table to ensure 
--that there is only one record per account_id where the latest_record boolean value is set to TRUE.





-- ------------------------------------------------------------------------------------------------------------

-- Submission Guidelines:
-- Each SQL object (procedure, view, function, trigger) should be in a separate .sql file named after the object.
-- Provide a brief report explaining the functionality of each SQL object and its relation to the respective UI screen.
-- This assignment will challenge students to implement advanced database components for a Banking System using PostgreSQL. The tasks will help them gain experience in creating and managing stored procedures, views, functions, and triggers in a real-world application scenario.

