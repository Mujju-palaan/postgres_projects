-- Trigger on Loan Return Date Changes
-- Create a trigger on the LOAN table that logs changes to the return_date field into the AUDIT_LOG table. 
--Include the loan_id, old_return_date, new_return_date, and employee_id.
-- select * from return_date_log

create table return_date_log(
	log_id int generated always as identity primary key
	,loan_id int
	,old_return_date date
	,new_return_date date
	,employee_id int
);

create or replace function trg_fun_return_date_log()
	returns trigger
AS $$
BEGIN
	---
	IF OLD.return_date is DISTINCT from NEW.return_date THEN
		insert into return_date_log(loan_id, old_return_date, new_return_date, employee_id)
		values(OLD.loan_id, OLD.return_date, NEW.return_date, OLD.employee_id);
	END IF;
	return NEW;
	
END;
$$ language plpgsql;



create or replace trigger trg_return_date_log
AFTER UPDATE ON loan
for each row
WHEN(OLD.return_date is DISTINCT from NEW.return_date)
EXECUTE function trg_fun_return_date_log();


-- update loan
-- set return_date = current_date
-- where loan_id = 1
-- ;