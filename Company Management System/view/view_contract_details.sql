-- View for Contract Details
-- Create a view to display project name, client name, start date, end date, Total amount, balance amount and project status.

create or replace view view_contract_details AS
select  
	b.project_name
	,c.client_name
	,b.start_date
	,b.end_date
	,a.amount as total_amount
	,d.amount_due as balance_amount
	,active_status as project_status
from contract a
inner join project b using(project_id)
inner join client c using(client_id)
inner join invoice d using(project_id)
;

-- select * from view_contract_details;