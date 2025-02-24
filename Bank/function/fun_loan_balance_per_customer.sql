
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
