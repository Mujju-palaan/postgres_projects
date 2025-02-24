
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
		d_number_of_monthly_instalments int;
		d_true boolean = 'true';
		d_false boolean = 'false';

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
				when b.instalment_amount = iparam_amount then d_true
				else d_false
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
	values(last_instalment_id
			,last_transaction_id
	);

	----balance
	select balance
	into d_balance
	from account
	where account_id = iparam_account_id;
	
	-- adjust the account balance (select * from account)
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
	where a.account_id = b.account_id
		AND a.account_id = iparam_account_id 
	returning balance into d_updated_balance
	;
	
	-- document the changes in the account history (select * from account_history)
	insert into account_history(account_id, balance_before, balance_after, transaction_id)

	select iparam_account_id
			,d_balance
			,d_updated_balance
			,last_transaction_id
	from account
	;
	
	---declare d_loan_amount, d_number_of_monthly_instalments
	select loan_amount, number_of_monthly_instalments
	into d_loan_amount, d_number_of_monthly_instalments
	from loan
	where account_id = iparam_account_id
	; 
	
	-- If the payment clears the loan in full, update the loan's end date in the LOAN table.
	--update if they pay total loan amount (select * from loan)
	
	-- Check if the payment clears the loan in full,
    IF iparam_amount <= (d_loan_amount * d_number_of_monthly_instalments) THEN
        RAISE EXCEPTION 'Total instalments not paid';
	ELSE
		-- Update loan end date if fully paid
		update loan a
		set laon_end_date = current_date
		where account_id = iparam_account_id
		;
		RAISE NOTICE 'Loan fully paid and end date updated';
    END IF;
	
	-- To accommodate payments covering multiple months, accept instalment IDs as input 
	--and distribute the funds across the specified monthly instalment buckets accordingly.
	

END;
$$
language plpgsql;


-- CALL public.scrop_loan_payment(
-- 	800					--<IN iparam_amount numeric>,
-- 	,'debit'			-- <IN iparam_transaction_type  character varying>,
-- 	,'loan payment'		-- <IN iparam_payment_mode  character varying>,
-- 	,3					-- <IN iparam_account_id  integer>,
-- 	,'completed'		-- <IN iparam_transaction_status  character varying>,
-- 	,'loan payment'		-- <IN iparam_description  character varying>
-- )

-- select * from transaction;
-- select * from loan_instalments;
-- select * from loan_payment;
-- select * from account;
-- select * from account_history;
-- select * from loan;
