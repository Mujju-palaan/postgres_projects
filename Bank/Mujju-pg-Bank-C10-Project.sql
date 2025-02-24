--8,11
-- 10)what if balance is already refunded then how to write if else statement to avoid double refund???????

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

create or replace procedure scrop_salary_management(
	IN iparam_employee_ids json
	,IN iparam_increase_percent numeric
)
		
as $$

BEGIN
	
	--procedure should also accept the salary increase percentage as an input parameter
	---temp tbl
	create temp table temp_salary_management(
		employee_id int
	);

	---ids
	-- SELECT CAST(value AS INTEGER) AS emp_id FROM jsonb_array_elements_text('[1, 2, 3]'::jsonb);
	-- SELECT json_array_elements('[1, 2, 3]'::JSON);

	--insert
	insert into temp_salary_management(employee_id)
	-- SELECT CAST(value AS INTEGER) AS emp_id FROM jsonb_array_elements_text('[1, 2, 3]'::jsonb)
	SELECT CAST(value AS INTEGER) AS emp_id FROM jsonb_array_elements_text(iparam_employee_ids::jsonb)
	;

	----update employee salaries for multiple employee IDs provided as input.	(select * from employee)
	update employee a
	set salary = (a.salary * iparam_increase_percent/100)
	from temp_salary_management b
	where a.employee_id = b.employee_id
	;
	
END;
$$
language plpgsql;

-- call scrop_salary_management('[1,2,3]',13);

-- select * from temp_salary_management;
-- drop table temp_salary_management;

-- select * from employee;
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
	where a.account_id=b.account_id 
		AND a.account_id = iparam_account_id 
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
	IN iparam_amount numeric
	,IN iparam_transaction_type	 varchar		--('debit', 'credit')
	,IN iparam_payment_mode	varchar			--('ATM', 'cash deposit', 'loan payment', 'fund transfer', 'debit card', 'fees', 'credit card')
	,IN iparam_account_id int
	,IN iparam_transaction_status varchar		--('processing', 'declined', 'completed')
	,IN iparam_description varchar
	
)
AS $$

DECLARE 
		last_transaction_id int;
		last_instalment_id int;
		d_balance numeric;
		d_updated_balance numeric;
		d_loan_amount numeric;
		number_of_monthly_instalments int;

BEGIN
	-- log the payment in the transaction table (select * from transaction)
	--insert
	insert into transaction(amount, transaction_type, payment_mode, account_id, transaction_status, description)
	values(iparam_amount, iparam_transaction_type, iparam_payment_mode, iparam_account_id, iparam_transaction_status, iparam_description)
	returning transaction_id into last_transaction_id
	;
	
	-- update the loan instalment records (select * from loan_instalments)
	insert into loan_instalments(loan_id, instalment_amount, due_date, paid_status)

	(select a.loan_id
			,iparam_amount
			,b.due_date
			,case 
				when b.instalment_amount = iparam_amount then 'true'
				else 'false'
			end
	from loan a
	inner join loan_instalments b using(loan_id)
	inner join transaction c using(account_id)
	where transaction_id = last_transaction_id
	)
	returning instalment_id into last_instalment_id
	;
	
	
	-- record the details in the loan payment table (select * from loan_payment)
	---insert
	insert into loan_payment(instalment_id, transaction_id)
	select(last_instalment_id, last_transaction_id)
	;

	----balance
	select balance
	into d_balance
	from account
	where account_id = iparam_account_id;
	
	-- adjust the account balance (select * from account)
	update account a
	set balance = case
					when transaction_type = 'debit' then (a.balance - iparam_amount)
					else (a.balance + iparam_amount)
					
	from transaction b 
	where a.account_id = iparam_account_id 
		AND a.account_id = b.account_id
	returning balance into d_updated_balance
	;
	
	-- document the changes in the account history (select * from account_history)
	insert into account_history(account_id, balance_before, balance_after, transaction_id)

	select iparam_account_id
			,d_balance
			,updated_balance
			,last_transaction_id
	from account
	;
	
	---declare d_loan_amount, d_number_of_monthly_instalments
	select loan_amount, number_of_monthly_instalments
	into d_loan_amount, d_number_of_monthly_instalments
	from loan
	where account_id = iparam_account_id; 
	;
	
	-- Check if the payment clears the loan in full,
    IF iparam_amount <= (d_loan_amount * d_number_of_monthly_instalments) 
	THEN
        RAISE EXCEPTION 'Total instalments not paid';
    END IF;
	
	-- If the payment clears the loan in full, update the loan's end date in the LOAN table.
	--update if they pay total loan amount (select * from loan)
	update loan a
	set laon_end_date = current_date
	-- ,loan_amount = 0
	from transaction b
	where a.account_id=b.account_id
		AND (a.loan_amount * a.number_of_monthly_instalments) = iparam_amount
	;
	
	-- To accommodate payments covering multiple months, accept instalment IDs as input 
	--and distribute the funds across the specified monthly instalment buckets accordingly.
	

END;
$$
language plpgsql;

-- ------------------------------------------------------------------------------------------------------------

-- 9)Stored Procedure for Fund Transfer
-- Create a stored procedure to manage fund transfer details. The procedure should perform the following operations: 
--insert a record into the fund transfer table, log the transaction in the transaction table, update the account balance, 
--and record the changes in the account history.

create or replace procedure scrop_fund_transfer(
	IN iparam_account_id int
	,IN iparam_amount numeric
	,IN iparam_transaction_type varchar	--('debit', 'credit')
	-- ,IN iparam_payment_mode varchar		--('ATM', 'cash deposit', 'loan payment', 'fund transfer', 'debit card', 'fees', 'credit card')
	,IN iparam_transaction_status varchar	--('processing', 'declined', 'completed')
	-- ,IN iparam_description varchar
)
AS $$

DECLARE 
		d_transaction_id int;
		d_balance numeric;
		d_updated_balance numeric;

BEGIN
	
	--log the transaction in the transaction table. (select * from transaction)
	insert into transaction(transaction_date, amount, transaction_type, payment_mode, account_id, transaction_status, description)
	values( 
			current_date
			,iparam_amount
			,iparam_transaction_type
			,'fund transfer'
			,iparam_account_id
			,iparam_transaction_status
			,'fund transfer'
	)
	returning transaction_id into d_transaction_id
	;


	--insert a record into the fund transfer table, (select * from fund_transfer)
	insert into fund_transfer(beneficiary_id, transaction_id, transfer_status)
	select
		a.beneficiary_id
		,d_transaction_id
		,'completed'
	from beneficiary a
	inner join customer b ON a.primary_consumer_id=b.customer_id
	inner join account c ON b.customer_id=c.customer_id
	where account_id = iparam_account_id
	;

	----into balance
	select balance 
	into d_balance
	from account
	where account_id = iparam_account_id;
	RAISE NOTICE 'Balance: %', d_balance;
	
	--update the account balance (select * from account)
	update account
	set balance = (select 
					CASE
						when iparam_transaction_type = 'debit' then b.balance - iparam_amount
						else b.balance + iparam_amount
					END
					from transaction a
					inner join account b using(account_id)
					where transaction_id = d_transaction_id
	)
	where account_id = iparam_account_id
	returning balance into d_updated_balance
	;
	RAISE NOTICE 'Updated Balance: %', d_updated_balance;

	--record the changes in the account history (select * from account_history)
	insert into account_history(account_id, balance_before, balance_after, transaction_id)
	select 
		iparam_account_id
		,d_balance
		,d_updated_balance
		,d_transaction_id
	;
	
	
END;
$$
language plpgsql;

-- CALL public.scrop_fund_transfer(
-- 	1,				--<IN iparam_account_id integer>,
-- 	200,			--<IN iparam_amount  numeric>,
-- 	'credit',		--<IN iparam_transaction_type  character varying>,
-- 	'completed'		--<IN iparam_transaction_status  character varying>,
-- )

-- select * from transaction;
-- select * from fund_transfer;
-- select * from account;
-- select * from account_history;


-- ------------------------------------------------------------------------------------------------------------

-- 10)Stored Procedure to Reverse a Fund Transfer
-- Develop a stored procedure to handle fund transfer refunds. The procedure should execute the following actions. 
--update the fund transfer record, log the refund in the transaction table, adjust the account balance, and document 
--the changes in the account history.

create or replace procedure scrop_reverse_fund_transfer(
	IN iparam_transaction_id int
)

AS $$
DECLARE d_amount numeric;
		d_balance numeric;
		d_updated_balance numeric;

BEGIN
	--update the fund transfer record, (select * from fund_transfer)
	--what if balance is already refunded then how to write if else statement to avoid double refund???????
	update fund_transfer a
	set refund_transaction_id = iparam_transaction_id 
		,transfer_timestamp = current_timestamp 
		,transfer_status = 'completed'
	from transaction b
	where a.transaction_id=b.transaction_id 
		AND
		a.transaction_id = iparam_transaction_id 
		-- AND 
		-- b.description NOT LIKE '%Refunded%'
	;
	
	--log the refund in the transaction table,  (select * from transaction)
	insert into transaction(transaction_date, amount, transaction_type, payment_mode, account_id, transaction_status, description)
	select 
			current_date
			,a.amount
			,a.transaction_type
			,a.payment_mode
			,a.account_id
			,transaction_status
			,('Refunded Amount :',a.amount)
	from transaction a
	inner join fund_transfer b using(transaction_id)
	where b.refund_transaction_id = iparam_transaction_id
	returning amount into d_amount
	;

	----declare
	select a.balance
	into d_balance
	from account a
	inner join transaction b using(account_id)
	inner join fund_transfer c using(transaction_id)
	where c.refund_transaction_id = iparam_transaction_id
	;
	
	--adjust the account balance,  (select * from account)
	update account a
	set balance = a.balance + d_amount
	from transaction b
	join fund_transfer c using(transaction_id)
	where a.account_id=b.account_id AND c.refund_transaction_id=iparam_transaction_id
	returning a.balance into d_updated_balance
	;
	
	--document the changes in the account history. (select * from account_history)
	insert into account_history(account_id, balance_before, balance_after, transaction_id)
	select 
			account_id
			,d_balance
			,d_updated_balance
			,transaction_id
	from transaction
	inner join fund_transfer using(transaction_id)
	where refund_transaction_id = iparam_transaction_id
	;
	
END;
$$
language plpgsql;

--call scrop_reverse_fund_transfer(2);

-- select * from fund_transfer;
-- select * from transaction;
-- select * from account;
-- select * from account_history;

--what if balance is already refunded then how to write if else statement to avoid double refund???????

-- ------------------------------------------------------------------------------------------------------------

-- 11)Stored Procedure for Customer Login
-- Create a database stored procedure to validate user login, fetch customer details, and update the last_login_datetime. 
--The procedure should return an error if the login ID is not found or the password does not match. Ensure the stored 
--encrypted password is decrypted during the validation process.

-- Enable the pgcrypto extension if not already enabled
CREATE EXTENSION IF NOT EXISTS pgcrypto;

SELECT pgp_sym_encrypt('my_password', 'my_secret_key'); 			--to encrypt
SELECT pgp_sym_decrypt(encrypted_password, 'my_secret_key');		--to dencrypt

-------- select * from customer_login;
--drop FUNCTION validate_user_login();

CREATE OR REPLACE FUNCTION validate_user_login(
    p_login_id text,
    p_password text
)
RETURNS BOOLEAN AS $$
DECLARE
	d_login_id text;
    v_encrypted_password text;
    -- v_decrypted_password TEXT;
    -- secret_key TEXT = 'my_secret_key'; -- Replace with a secure key
BEGIN
	-- Retrieve the given login ID
    SELECT login_id INTO d_login_id
    FROM customer_login
    WHERE login_id = p_login_id;
	
    -- Retrieve encrypted password for the given login ID
    SELECT password INTO v_encrypted_password
    FROM customer_login
    WHERE login_id = p_login_id;

    -- Check if the login ID was found
    IF d_login_id <> p_login_id THEN
        RAISE EXCEPTION 'Login ID not found';
    END IF;

    -- -- Decrypt the stored password
    -- v_decrypted_password = pgp_sym_decrypt(v_encrypted_password::BYTEA, secret_key);

    -- -- Compare decrypted password with input
    -- IF v_decrypted_password IS DISTINCT FROM p_password THEN
    --     RAISE EXCEPTION 'Invalid password';
    -- END IF;

	-- Compare decrypted password with input
    IF v_encrypted_password IS DISTINCT FROM p_password THEN
        RAISE EXCEPTION 'Invalid password';
    END IF;

	update customer_login
	set last_login_datetime = current_timestamp
	WHERE login_id = p_login_id; 

    -- Return TRUE if login is successful
    RETURN TRUE;
END;
$$ 
LANGUAGE plpgsql;

-- select * from validate_user_login('user1','password123');

--select * from customer_login;
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

create or replace view view_customer_account_details as
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

--select * from view_customer_account_details;

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

--drop function fun_loan_balance_per_customer;

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

--drop function fun_loan_interest;

create or replace function fun_loan_interest()
returns table(
	instalment_amount numeric(10,2)
	,interest_rate numeric(10,2)
	,number_of_monthly_instalments int
	,monthly_interest numeric(10,2)
	,loan_amount numeric(10,2)
)
AS $$

BEGIN
RETURN QUERY
	select 
		b.instalment_amount
		,a.interest_rate
		,a.number_of_monthly_instalments
		,(b.instalment_amount * a.interest_rate/100)
		,(b.instalment_amount * a.number_of_monthly_instalments) + 
			((b.instalment_amount * a.number_of_monthly_instalments) * a.interest_rate/100) 
	from loan a
	inner join loan_instalments b using(loan_id)
	;

END;
$$
language plpgsql;

-- select * from fun_loan_interest();
-- ------------------------------------------------------------------------------------------------------------

-- 3)Function to display loan details
-- Write a database function that retrieves customer loan information based on the screen design provided at the bottom of this webpage.

--drop function fun_customer_loan_details;

create or replace function fun_customer_loan_details(iparam_customer_id int)
returns table(
	customer_id int
	,customer_name text
	,loan_amount numeric
	,months_to_pay numeric
	,instalment_amount numeric
	,total_amount_remaining numeric
)
as $$

BEGIN
	return Query
	--select
	select a.customer_id
			,a.first_name||' '||last_name as customer_name
			,CASE
				when (extract(month from b.loan_end_date) - extract(month from current_date)) <0 then 0
				else b.loan_amount
			END
			,CASE
				when (extract(month from b.loan_end_date) - extract(month from current_date)) <0 then 0
				else (extract(month from b.loan_end_date) - extract(month from current_date))
			END
			,CASE
				when (extract(month from b.loan_end_date) - extract(month from current_date)) <0 then 0
				else c.instalment_amount
			END
			,CASE
				when ((extract(month from b.loan_end_date) - extract(month from current_date)) * c.instalment_amount) <0 then 0
				else ((extract(month from b.loan_end_date) - extract(month from current_date)) * c.instalment_amount)
			END
	from customer a
	inner join account aa using(customer_id)
	inner join loan b using(account_id)
	inner join loan_instalments c using(loan_id)
	where a.customer_id = iparam_customer_id
	;

END;
$$
language plpgsql;

-- select * from fun_customer_loan_details(2);
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
set amount = 500
where transaction_id = 1;

-- ------------------------------------------------------------------------------------------------------------

-- 2)Insert and Update Triggers on ACCOUNT_HISTORY table -Create a trigger on the ACCOUNT_HISTORY table to ensure 
--that there is only one record per account_id where the latest_record boolean value is set to TRUE.

--select * from ACCOUNT_HISTORY;

create table account_history_log(
	account_id int
	,history_id int
	,balance_before numeric(10,2)
	,balance_after numeric(10,2)
	,transaction_id int
);
--select * from account_history_log;

---------function----------
create or replace function trg_fun_insert_account_history_log()
returns trigger

AS $$

BEGIN
	IF OLD.balance_before is distinct from NEW.balance_before
		AND
	 	OLD.balance_after is distinct from NEW.balance_after
	then
		INSERT INTO account_history_log(account_id, balance_before, balance_after, transaction_id )
		values(OLD.account_id, NEW.balance_before, NEW.balance_after, OLD.transaction_id);
	END IF;
	return NEW;
END;
$$
language plpgsql;


--trigger
create trigger trg_insert_account_history
after insert on account_history
for each row 
EXECUTE FUNCTION trg_fun_insert_account_history_log();

--trigger
create trigger trg_update_account_history
after update on account_history
for each row 
WHEN(OLD.balance_before is distinct from new.balance_before)
	-- AND (OLD.balance_after is distinct from new.balance_after)
EXECUTE FUNCTION trg_fun_insert_account_history_log();
-- ------------------------------------------------------------------------------------------------------------

-- Submission Guidelines:
-- Each SQL object (procedure, view, function, trigger) should be in a separate .sql file named after the object.
-- Provide a brief report explaining the functionality of each SQL object and its relation to the respective UI screen.
-- This assignment will challenge students to implement advanced database components for a Banking System using PostgreSQL. The tasks will help them gain experience in creating and managing stored procedures, views, functions, and triggers in a real-world application scenario.

