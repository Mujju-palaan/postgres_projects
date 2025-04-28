-- Function to Calculate Total Contracts for Customer
-- Write a function that calculates the total number of contracts placed by a specific client.
-- select * from contract

create or replace function fun_total_contract( iparam_client_id int)
returns table(
	client_id int
	,contract_id int
)
AS $$

BEGIN
	return query
	--- select
	select 
		a.client_id
		,count(a.contract_id)::int
	from contract a
	where a.client_id = iparam_client_id
	group by a.client_id
	order by 1,2
	;

END;
$$ language plpgsql;

-- select * from fun_total_contract(1);