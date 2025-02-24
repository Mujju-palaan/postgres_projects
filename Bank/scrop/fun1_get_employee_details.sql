
-- 1)Stored Procedure for Employee Information
-- Write a stored procedure that retrieves all rows from the EMPLOYEE table where the city is a specific value passed as a input parameter.

--drop function fun_get_employee_details;

create or replace function fun_get_employee_details(iparam_city_id int)
returns table(
	iparam_employee_id int
	,iparam_employee_name text
	,iparam_hire_date date
	,iparam_salary numeric
	,iparam_branch_id int
	,iparam_city_name varchar
)
language plpgsql
as $$

BEGIN
	return query
	select a.employee_id
			,a.first_name||' '||a.last_name as employee_name
			,a.hire_date
			,a.salary
			,a.branch_id
			,b.city_name
	from employee a
	inner join city b using(city_id)
	where b.city_id = iparam_city_id;

END;
$$;

--select * from fun_get_employee_details(1);
