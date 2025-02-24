-- Trigger Task:

-- 1)Trigger on Transaction Amount Changes

-- Create a trigger on the TRANSACTION table that logs changes to the amount field into the AUDIT_LOG table. 
--The log should capture the transaction_id, old_amount, new_amount, log_date, and employee_id.
-- select * from TRANSACTION;

create table transaction_log(
	transaction_id int
	,old_amount numeric(10,2)
	,new_amount numeric(10,2)
	,log_date timestamp default current_timestamp
	,account_id int
);

--function
create or replace function trg_fun_update_transaction_log()
returns trigger

AS $$

BEGIN
	
	IF old.amount is distinct from new.amount then
		INSERT INTO transaction_log(transaction_id, old_amount, new_amount, account_id)
		values(OLD.transaction_id, OLD.amount, NEW.amount, OLD.account_id);
	END IF;
	return NEW;
		
END;
$$
language plpgsql;

--trigger
create trigger trg_update_transaction_log
after update on transaction
for each row 
WHEN(OLD.amount is distinct from new.amount)
EXECUTE FUNCTION trg_fun_update_transaction_log();

--update transaction. (select * from transaction_log)
update transaction
set amount = 500
where transaction_id = 1;
