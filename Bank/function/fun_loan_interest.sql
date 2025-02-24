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