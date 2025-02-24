
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