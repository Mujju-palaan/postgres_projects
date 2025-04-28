-- Function to Calculate Profit for a given Project
-- Write a function that retrieves profit of a given project after considering employee cost, product used cost and contract value.

create or replace function fun_calculate_profit(iparam_project_id int)
returns table(
	project_id int
	,project_name varchar
	,employee_count int
	,employee_cost numeric(10,2)
	,product_used int
	,product_used_cost numeric(10,2)
	,contract_value numeric(10,2)
)
AS $$

BEGIN
	return query

	------ select * from product
	select 
		a.project_id
		,a.project_name
		,count(c.employee_id)::int as employee_count
		,sum(c.salary) as all_employee_salary
		,count(product_id)::int as product_count
		,sum(e.price) as product_used_cost
		,d.amount as contract_value
	from project a
	 join project_product_used b using(project_id)
	 join employee_project aa using(project_id)
	 join employee c using(employee_id)
	 join contract d using(project_id)
	 join product e using(product_id)
	group by a.project_id, a.project_name, c.salary, d.amount
	having a.project_id = iparam_project_id
	order by 1
	;
	
END;
$$ language plpgsql;


-- select * from fun_calculate_profit(3);