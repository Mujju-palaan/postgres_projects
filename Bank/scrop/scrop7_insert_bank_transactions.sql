
-- 7)Stored Procedure for Banking Transactions
-- Develop an SQL stored procedure to process banking debit and credit transactions. The procedure should execute 
--the following tasks: log the transaction in the transaction table, update the account balance, and document the changes 
--in the account history. Additionally, if the transaction pertains to a credit card purchase, ensure the CARD table is updated accordingly.

--drop procedure scrop_insert_bank_transactions;

create or replace procedure scrop_insert_bank_transactions(
	IN iparam_amount numeric
	,IN iparam_transaction_type varchar
	,IN iparam_payment_mode	varchar		--('ATM', 'cash deposit', 'loan payment', 'fund transfer', 'debit card', 'fees', 'credit card')
	,IN iparam_account_id int
	,IN iparam_transaction_status varchar
	,IN iparam_description varchar
)

AS $$

DECLARE last_transaction_id int;

BEGIN
	--log the transaction in the transaction table (debit and credit transactions) select * from transaction
	--insert
	insert into transaction(amount, transaction_type, payment_mode, account_id, transaction_status, description)
	values(iparam_amount, iparam_transaction_type, iparam_payment_mode, iparam_account_id, iparam_transaction_status, iparam_description)
	returning transaction_id into last_transaction_id
	;

	--update the account balance (select * from account)
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
	where a.account_id=b.account_id AND a.account_id = iparam_account_id 
	;


	--document the changes in the account history (select * from account_history)
	insert into account_history(account_id, balance_before, balance_after, transaction_id)
	
	select c.account_id
			,c.balance
			,(case
				when b.transaction_type = 'debit' then (c.balance - iparam_amount)
				else (c.balance + iparam_amount)
			end)
			,transaction_id
	from transaction b
	inner join account c ON b.account_id=c.account_id
	where transaction_id = last_transaction_id
	;

	-- Additionally, if the transaction pertains to a credit card purchase, ensure the CARD table is updated accordingly.
	-- (select * from card)
	update card a
	set available_credit_limit = a.available_credit_limit - iparam_amount
	from account aa
	inner join transaction b ON aa.account_id=b.account_id
	where a.account_id=aa.account_id AND b.payment_mode = 'credit card'
	;


END;
$$
language plpgsql;


-- CALL scrop_insert_bank_transactions(
-- 	5,				--<IN iparam_amount numeric>,
-- 	'credit',			--<IN iparam_transaction_type  character varying>,
-- 	'credit card',		--<IN iparam_payment_mode  character varying>,
-- 	1,					--<IN iparam_account_id  integer>,
-- 	'completed',			--<IN iparam_transaction_status  character varying>,
-- 	'paise dal re bhai'	--<IN iparam_description  character varying>
-- );

-- select * from transaction;
-- select * from account;
-- select * from account_history;
-- select * from card;