-- Trigger on Amount Change
-- Create a trigger on the CONTRACT table that logs any changes made to the total_amount field into the AUDIT_LOG table. 
--Ensure it captures the contract_id, old_total, new_total, and log_date.
-- select * from AUDIT_CONTRACT_AMOUNT
-- select * from CONTRACT
create table AUDIT_CONTRACT_AMOUNT(
	log_id int generated always as identity primary key
	,log_date date default current_date not null
	,contract_id  int not null
	,old_total numeric(10,2)
	,new_total numeric(10,2)
	,foreign key(contract_id) references contract(contract_id)
);

-------function
create or replace function trg_fun_on_amount_change()
returns trigger
AS $$

BEGIN
	IF OLD.amount is distinct from NEW.amount
	THEN 
	insert into AUDIT_CONTRACT_AMOUNT( contract_id, old_total, new_total)
	values( OLD.contract_id, OLD.amount, NEW.amount);
	END IF;
	return NEW;
	
END;
$$ language plpgsql;


----trigger
create or replace trigger trg_on_amount_change
after update on CONTRACT
for each row
WHEN( OLD.amount is distinct from NEW.amount)
EXECUTE function trg_fun_on_amount_change()
;

-------update (select * from CONTRACT)
update CONTRACT
set amount = 100000
where contract_id = 1
;



