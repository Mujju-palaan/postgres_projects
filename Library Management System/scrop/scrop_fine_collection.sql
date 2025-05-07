-- Stored Procedure for Fine Collections
-- Write a stored procedure to handle fine collections. Compute the fine using the daily fine rate 
--from the Fine Policy table, insert the fine into the FINES table, mark the book as returned 
--in the Loan table, and record the return branch ID.

create or replace procedure scrop_fine_collection(
	IN iparam_loan_id int
)
AS $$

DECLARE d_date int;
		d_fine_per_day numeric;
		d_issue_branch_id int;
		d_employee_id int;
BEGIN
	--- Compute the fine using the daily fine rate from the Fine Policy table
	---	select * from overdue_policy,		select * from loan
	select (due_date - loan_date), issue_branch_id, employee_id
	into d_date, d_issue_branch_id, d_employee_id
	from loan
	where loan_id = iparam_loan_id
	;

	select fine_per_day
	into d_fine_per_day
	from overdue_policy
	where max_days_allowed = d_date
	;
	
	--- insert the fine into the FINES table-
	--select * from fine
	insert into fine(fine_amount, fine_date, overdue_days, return_time, loan_id, 
					collected_by_employee_id, collected_branch_id)
	values(
		(d_fine_per_day*d_date)
		,current_date
		,d_date
		,current_time
		,iparam_loan_id
		,d_employee_id
		,d_issue_branch_id
	);
	
	--- mark the book as returned in the Loan table, and record the return branch ID.
	---	select * from loan
	update loan
	set return_branch_id = d_issue_branch_id , return_date = current_date
	where loan_id = iparam_loan_id
	;

	
END;
$$ language plpgsql;

-- call scrop_fine_collection (2);