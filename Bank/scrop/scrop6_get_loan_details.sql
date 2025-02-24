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