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
