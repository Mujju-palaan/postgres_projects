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