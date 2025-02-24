-- 2)Insert and Update Triggers on ACCOUNT_HISTORY table -Create a trigger on the ACCOUNT_HISTORY table to ensure 
--that there is only one record per account_id where the latest_record boolean value is set to TRUE.

--select * from ACCOUNT_HISTORY;

create table account_history_log(
	account_id int
	,history_id int
	,balance_before numeric(10,2)
	,balance_after numeric(10,2)
	,transaction_id int
);
--select * from account_history_log;

---------function----------
create or replace function trg_fun_insert_account_history_log()
returns trigger

AS $$

BEGIN
	IF OLD.balance_before is distinct from NEW.balance_before
		AND
	 	OLD.balance_after is distinct from NEW.balance_after
	then
		INSERT INTO account_history_log(account_id, balance_before, balance_after, transaction_id )
		values(OLD.account_id, NEW.balance_before, NEW.balance_after, OLD.transaction_id);
	END IF;
	return NEW;
END;
$$
language plpgsql;


--trigger
create trigger trg_insert_account_history
after insert on account_history
for each row 
EXECUTE FUNCTION trg_fun_insert_account_history_log();

--trigger
create trigger trg_update_account_history
after update on account_history
for each row 
WHEN(OLD.balance_before is distinct from new.balance_before)
	-- AND (OLD.balance_after is distinct from new.balance_after)
EXECUTE FUNCTION trg_fun_insert_account_history_log();
-- ------------------------------------------------------------------------------------------------------------
