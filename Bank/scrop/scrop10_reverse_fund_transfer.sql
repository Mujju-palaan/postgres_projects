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
