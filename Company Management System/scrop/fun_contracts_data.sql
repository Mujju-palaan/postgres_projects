-- Stored Procedure for All Contracts Data Grid
-- Write a stored procedure to retrieve project name, client name, start date, end date, total amount, paid amount, balance amount and project status.
-- select * from contract;

create or replace function fun_contracts_data()
returns table(
	project_name varchar
	,client_name varchar
	,start_date date
	,end_date date
	,total_amount numeric(10,2)
	,paid_amount numeric(10,2)
	,balance_amount numeric(10,2)
	,project_status boolean
)
AS $$

BEGIN
	return query
	-----select
	select 
		b.project_name
		,c.client_name
		,b.start_date
		,b.end_date
		,a.amount as total_amount
		,e.total_amount as paid_amount
		,d.amount_due as balance_amount
		,b.active_status as project_status
	from contract a
	inner join project b using(project_id)
	inner join client c using(client_id)
	inner join invoice d using(project_id)
	inner join project_product_used aa using(project_id)
	inner join PURCHASE_ORDER_DETAIL bb using(product_id)
	inner join PURCHASE_ORDER e using(order_id)
	; 

END;
$$ language plpgsql;

select * from fun_contracts_data();