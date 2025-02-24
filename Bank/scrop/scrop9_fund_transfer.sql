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
