-- Stored Procedure for Contract Management
-- Create a stored procedure to add a new contract and a new project, ensuring the contract is associated with a client. 
--Additionally, generate  three invoices by dividing the total amount into three equal parts, with each invoice having a due date spaced one month apart.

create or replace procedure scrop_contract_management(
	
	--- project
	IN iparam_project_name varchar
	,IN iparam_start_date date
	,IN iparam_end_date date
	,IN iparam_active_status boolean			----true, false
	--- contract
	,IN iparam_client_id int
	,IN iparam_contract_date date
	,IN iparam_amount numeric(10,2)
	--- invoice
	-- ,IN iparam_status varchar 		---- (paid, unpaid)
)
AS $$

DECLARE d_amount numeric(10,2);
		d_project_id int;
		d_amount_due numeric(10,2);
BEGIN

	--- new project (select * from project)
	insert into project(project_name, start_date, end_date, active_status)
	values(iparam_project_name, iparam_start_date, iparam_end_date, iparam_active_status)
	returning project_id into d_project_id
	;

	--- new contract (select * from contract)
	insert into contract(contract_date, amount, client_id, project_id)
	values(iparam_contract_date, iparam_amount, iparam_client_id, d_project_id)
	returning amount into d_amount
	;

	d_amount_due = d_amount/3;
	
	---invoice  (select * from invoice)
	insert into invoice(project_id, invoice_date, amount_due, status)
	values(d_project_id, current_date, d_amount_due, 'paid')
	;

	insert into invoice(project_id, invoice_date, amount_due, status)
	values(d_project_id, current_date + interval '1 month', d_amount_due, 'paid')
	;

	insert into invoice(project_id, invoice_date, amount_due, status)
	values(d_project_id, current_date + interval '2 month', d_amount_due, 'paid')
	;
	
END;
$$ language plpgsql;


-- CALL public.scrop_contract_management(
-- 	'Mujju LT'								-- <IN iparam_project_name character varying>,
-- 	,current_date							-- <IN iparam_start_date  date>,
-- 	,(current_date + interval '3 month')::date		-- <IN iparam_end_date  date>,
-- 	,'true'									-- <IN iparam_active_status  boolean>,
-- 	,1										-- <IN iparam_client_id  integer>,
-- 	,current_date							-- <IN iparam_contract_date  date>,
-- 	,300000									-- <IN iparam_amount  numeric>
-- );


-- select * from project
-- select * from contract
-- select * from invoice




