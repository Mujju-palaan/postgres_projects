
-- 8)Stored Procedure for Loan Payment
-- Create a stored procedure to manage loan payments. The procedure should execute the following tasks: log the payment 
--in the transaction table, record the details in the loan payment table, update the loan instalment records, adjust the 
--account balance, and document the changes in the account history. If the payment clears the loan in full, update the 
--loan's end date in the LOAN table. To accommodate payments covering multiple months, accept instalment IDs as input and 
--distribute the funds across the specified monthly instalment buckets accordingly.

create or replace procedure scrop_loan_payment(
	IN iparam_amount
	,IN iparam_transaction_type			--('debit', 'credit')
	,IN iparam_payment_mode				--('ATM', 'cash deposit', 'loan payment', 'fund transfer', 'debit card', 'fees', 'credit card')
	,IN iparam_account_id
	,IN iparam_transaction_status		--('processing', 'declined', 'completed')
	,IN iparam_description
	
)
AS $$

DECLARE 
		last_transaction_id int;
		last_instalment_id int;
		updated_balance numeric;

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
				when a.loan_amount = iparam_amount then 'true'
				else 'false'
			end
	from loan a
	inner join loan_instalments b using(loan_id)
	inner join transaction c using(account_id)
	where transaction_id = last_transaction_id
	returning instalment_id into last_instalment_id
	)
	;
	
	
	-- record the details in the loan payment table (select * from loan_payment)
	---insert
	insert into loan_payment(instalment_id, transaction_id)
	select(last_instalment_id, last_transaction_id)
	;
	
	-- adjust the account balance (select * from account)
	update account a
	set balance = (case
					when transaction_type = 'debit' then (balance - iparam_amount)
					else (balance + iparam_amount)
					)
	from transaction b 
	where a.account_id = iparam_account_id 
		AND a.account_id = b.account_id
	returning balance into updated_balance
	;
	
	-- document the changes in the account history (select * from account_history)
	insert into account_history(account_id, balance_before, balance_after, transaction_id)

	select iparam_account_id
			,balance_after
			,updated_balance
			,last_transaction_id
	from account
	;
	
	-- If the payment clears the loan in full, update the loan's end date in the LOAN table.
	--update if they pay total loan amount (select * from loan)
	update loan a
	set laon_end_date = current_date
	from transaction b
	where a.account_id=b.account_id
		AND (a.loan_amount * a.number_of_monthly_instalments) = iparam_amount
	;
	
	-- To accommodate payments covering multiple months, accept instalment IDs as input 
	--and distribute the funds across the specified monthly instalment buckets accordingly.
	

END;
$$
language plpgsql;