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
--select * from customer;

--drop procedure scrop_customer_details;

create or replace procedure scrop_customer_details(
	-- IN iparam_customer_id int
	-- ,IN iparam_
)

AS $$

BEGIN
	---temp tbl. (select * from temp_customer_details)
	create temp table IF NOT EXISTS temp_customer_details(
		customer_id int
		,customer_name text
		,phone_number varchar
		,email varchar
		,cash_balance numeric(10,2)
		,credit_balance numeric(10,2)
		,loan_balance varchar
	);

	--insert
	insert into temp_customer_details(customer_id, customer_name, phone_number, email, cash_balance, credit_balance, loan_balance)
	
	select a.customer_id
			,a.first_name||' '||a.last_name as customer_name
			,a.phone_number
			,a.email
			,b.balance as cash_balance
			,c.available_credit_limit as credit_balance
			-- ,d.loan_amount as loan_balance
			,case
				when
					(e.instalment_amount * ((extract(month from d.loan_end_date))-(extract(month from current_date)))) < 0
					then 'Loan Completed'
				else (e.instalment_amount * ((extract(month from d.loan_end_date))-(extract(month from current_date))))::varchar
			end as loan_balance
	from customer a
	inner join account b using(customer_id)
	inner join card c using(account_id)
	inner join loan d ON b.account_id=d.account_id
	inner join loan_instalments e using(loan_id)
	-- where customer_id = iparam_customer_id
	;

END;
$$
language plpgsql;

--call scrop_customer_details();
--select * from temp_customer_details;
-- ------------------------------------------------------------------------------------------------------------

-- 6)Stored Procedure for Loan Payments
-- Create a database stored procedure to fetch all loan instalments for a specific customer by accepting customer_id as an input parameter.
--The procedure should join the CUSTOMER, LOAN, and LOAN_INSTALMENTS tables to retrieve relevant details, including loan_id, 
--instalment_amount, due_date, paid_date, and loan_start_date.

create or replace procedure scrop_get_loan_details(
	IN iparam_customer_id int
)

AS $$

BEGIN
	---temp tbl
	create temp table loan_details(
		loan_id int
		,customer_name varchar
		,instalment_amount numeric
		,due_date date
		,paid_date date
		,loan_start_date date
	);

	--insert
	insert into loan_details(loan_id, customer_name, instalment_amount, due_date, paid_date, loan_start_date)

	select c.loan_id
			,a.first_name||' '||a.last_name as customer_name
			,d.instalment_amount
			,d.due_date
			,e.transaction_date as paid_date
			,c.loan_start_date
	from customer a 
	inner join account b using(customer_id)
	inner join loan c using(account_id)
	inner join loan_instalments d using(loan_id)
	inner join transaction e ON c.account_id=e.account_id
	where customer_id = iparam_customer_id
	;
	
END;
$$
language plpgsql;

--call scrop_get_loan_details(1)
--select * from loan_details;

------------------------ OR FUNCTION ------------------------

-- drop function fun_get_loan_details;

create or replace function fun_get_loan_details(iparam_customer_id int)
returns table(
	loan_id int
	,customer_name text
	,instalment_amount numeric
	,due_date date
	,paid_date date
	,loan_start_date date
)
AS $$

BEGIN

RETURN QUERY
	select c.loan_id
			,a.first_name||' '||a.last_name as customer_name
			,d.instalment_amount
			,d.due_date
			,e.transaction_date as paid_date
			,c.loan_start_date
	from customer a 
	inner join account b using(customer_id)
	inner join loan c using(account_id)
	inner join loan_instalments d using(loan_id)
	inner join transaction e ON c.account_id=e.account_id
	where customer_id = iparam_customer_id
	;
	
END;
$$
language plpgsql;

--select * from fun_get_loan_details(3);

-- ------------------------------------------------------------------------------------------------------------

-- 7)Stored Procedure for Banking Transactions
-- Develop an SQL stored procedure to process banking debit and credit transactions. The procedure should execute 
--the following tasks: log the transaction in the transaction table, update the account balance, and document the changes 
--in the account history. Additionally, if the transaction pertains to a credit card purchase, ensure the CARD table is updated accordingly.

--drop procedure scrop_insert_bank_transactions;

create or replace procedure scrop_insert_bank_transactions(
	IN iparam_amount numeric
	,IN iparam_transaction_type varchar
	,IN iparam_payment_mode	varchar		--('ATM', 'cash deposit', 'loan payment', 'fund transfer', 'debit card', 'fees', 'credit card')
	,IN iparam_account_id int
	,IN iparam_transaction_status varchar
	,IN iparam_description varchar
)

AS $$

DECLARE last_transaction_id int;

BEGIN
	--log the transaction in the transaction table (debit and credit transactions) select * from transaction
	--insert
	insert into transaction(amount, transaction_type, payment_mode, account_id, transaction_status, description)
	values(iparam_amount, iparam_transaction_type, iparam_payment_mode, iparam_account_id, iparam_transaction_status, iparam_description)
	returning transaction_id into last_transaction_id
	;

	--update the account balance (select * from account)
	update account a
	set balance = (select
					case
						when b.transaction_type = 'credit' then a.balance + iparam_amount
						else a.balance - iparam_amount
					end
					from account a
					inner join transaction b using(account_id)
					where b.transaction_id = last_transaction_id)
	from transaction b
	where a.account_id=b.account_id AND a.account_id = iparam_account_id 
	;


	--document the changes in the account history (select * from account_history)
	insert into account_history(account_id, balance_before, balance_after, transaction_id)
	
	select c.account_id
			,c.balance
			,(case
				when b.transaction_type = 'debit' then (c.balance - iparam_amount)
				else (c.balance + iparam_amount)
			end)
			,transaction_id
	from transaction b
	inner join account c ON b.account_id=c.account_id
	where transaction_id = last_transaction_id
	;

	-- Additionally, if the transaction pertains to a credit card purchase, ensure the CARD table is updated accordingly.
	-- (select * from card)
	update card a
	set available_credit_limit = a.available_credit_limit - iparam_amount
	from account aa
	inner join transaction b ON aa.account_id=b.account_id
	where a.account_id=aa.account_id AND b.payment_mode = 'credit card'
	;


END;
$$
language plpgsql;


-- CALL scrop_insert_bank_transactions(
-- 	5,				--<IN iparam_amount numeric>,
-- 	'credit',			--<IN iparam_transaction_type  character varying>,
-- 	'credit card',		--<IN iparam_payment_mode  character varying>,
-- 	1,					--<IN iparam_account_id  integer>,
-- 	'completed',			--<IN iparam_transaction_status  character varying>,
-- 	'paise dal re bhai'	--<IN iparam_description  character varying>
-- );

-- select * from transaction;
-- select * from account;
-- select * from account_history;
-- select * from card;
-- ------------------------------------------------------------------------------------------------------------

-- 8)Stored Procedure for Loan Payment
-- Create a stored procedure to manage loan payments. The procedure should execute the following tasks: log the payment 
--in the transaction table, record the details in the loan payment table, update the loan instalment records, adjust the 
--account balance, and document the changes in the account history. If the payment clears the loan in full, update the 
--loan's end date in the LOAN table. To accommodate payments covering multiple months, accept instalment IDs as input and 
--distribute the funds across the specified monthly instalment buckets accordingly.

create or replace procedure scrop_loan_payment(
	IN iparam_amount
	,IN iparam_transaction_type
	,IN iparam_payment_mode
	,IN iparam_account_id
	,IN iparam_transaction_status
	,IN iparam_description
	,IN iparam_
	,IN iparam_
	,IN iparam_
)
AS $$

DECLARE last_transaction_id int;

BEGIN
	-- log the payment in the transaction table (select * from transaction)
	--insert
	insert into transaction(amount, transaction_type, payment_mode, account_id, transaction_status, description)
	values(iparam_amount, iparam_transaction_type, iparam_payment_mode, iparam_account_id, iparam_transaction_status, iparam_description)
	returning transaction_id into last_transaction_id
	;
	
	-- record the details in the loan payment table
	-- update the loan instalment records
	-- adjust the account balance
	-- document the changes in the account history
	-- If the payment clears the loan in full, update the loan's end date in the LOAN table.
	-- To accommodate payments covering multiple months, accept instalment IDs as input and distribute the funds across the specified monthly instalment buckets accordingly.

END;
$$
language plpgsql;

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

--select * from view_loan_details;

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
			,c.
			* (extract(month from b.loan_end_date) - extract(month from current_date))
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

create or replace function fun_loan_interest()
returns table(
	amount
	,loan_amount
	,interest_rate
	,number_of_monthly_instalments	
)



-- ------------------------------------------------------------------------------------------------------------

-- 3)Function to display loan details
-- Write a database function that retrieves customer loan information based on the screen design provided at the bottom of this webpage.

create or replace function fun_customer_loan_details(iparam_customer_id int)
returns table(
	customer_id int
	,customer_name text
	,loan_amount numeric
)


as $$

BEGIN
	return Query
	--select
	select a.customer_id
			,a.first_name||' '||last_name as customer_name
			,b.loan_amount
	from customer a
	inner join account aa using(customer_id)
	inner join loan b using(account_id)
	where a.customer_id = iparam_customer_id
	;

END;
$$
language plpgsql;

--select * from fun_customer_loan_details(1);
-- ------------------------------------------------------------------------------------------------------------
-- Trigger Task:

-- 1)Trigger on Transaction Amount Changes

-- Create a trigger on the TRANSACTION table that logs changes to the amount field into the AUDIT_LOG table. 
--The log should capture the transaction_id, old_amount, new_amount, log_date, and employee_id.
-- select * from TRANSACTION;

create table transaction_log(
	transaction_id int
	,old_amount numeric(10,2)
	,new_amount numeric(10,2)
	,log_date timestamp default current_timestamp
	,account_id int
);

--function
create or replace function trg_fun_update_transaction_log()
returns trigger

AS $$

BEGIN
	-- select employee_id
	-- into d_employee_id ---variable
	-- from employee a
	-- join loan b ON a.employee_id=b.created_employee_id
	-- join account bb using(account_id)
	-- join transaction c ON bb.account_id=c.account_id
	-- where transaction_id = iparam_transaction_id
	-- ;
	
	IF old.amount is distinct from new.amount then
		INSERT INTO transaction_log(transaction_id, old_amount, new_amount, account_id)
		values(OLD.transaction_id, OLD.amount, NEW.amount, OLD.account_id);
	END IF;
	return NEW;
		
END;
$$
language plpgsql;

--trigger
create trigger trg_update_transaction_log
after update on transaction
for each row 
WHEN(OLD.amount is distinct from new.amount)
EXECUTE FUNCTION trg_fun_update_transaction_log();

--update transaction. (select * from transaction_log)
update transaction
set amount = 300
where transaction_id = 1;

-- ------------------------------------------------------------------------------------------------------------

-- 2)Insert and Update Triggers on ACCOUNT_HISTORY table -Create a trigger on the ACCOUNT_HISTORY table to ensure 
--that there is only one record per account_id where the latest_record boolean value is set to TRUE.
select * from ACCOUNT_HISTORY;

create table account_history_log(
	account_id int
	,history_id int
	,
)



-- ------------------------------------------------------------------------------------------------------------

-- Submission Guidelines:
-- Each SQL object (procedure, view, function, trigger) should be in a separate .sql file named after the object.
-- Provide a brief report explaining the functionality of each SQL object and its relation to the respective UI screen.
-- This assignment will challenge students to implement advanced database components for a Banking System using PostgreSQL. The tasks will help them gain experience in creating and managing stored procedures, views, functions, and triggers in a real-world application scenario.

