-- 4)Stored Procedure for Salary Management version 2
-- Design a database stored procedure to update employee salaries for multiple employee IDs provided as input. 
--The procedure should also accept the salary increase percentage as an input parameter. Utilize JSON, XML, or SQL 
--table variables to manage and process multiple employee records. Temporary tables can be used if required. 
--Input parameters: employee_ids and increase_percent.

create or replace procedure scrop_salary_management(
	IN iparam_employee_ids json
	,IN iparam_increase_percent numeric
)
		
as $$

BEGIN
	
	--procedure should also accept the salary increase percentage as an input parameter
	---temp tbl
	create temp table temp_salary_management(
		employee_id int
	);

	---ids
	-- SELECT CAST(value AS INTEGER) AS emp_id FROM jsonb_array_elements_text('[1, 2, 3]'::jsonb);
	-- SELECT json_array_elements('[1, 2, 3]'::JSON);

	--insert
	insert into temp_salary_management(employee_id)
	-- SELECT CAST(value AS INTEGER) AS emp_id FROM jsonb_array_elements_text('[1, 2, 3]'::jsonb)
	SELECT CAST(value AS INTEGER) AS emp_id FROM jsonb_array_elements_text(iparam_employee_ids::jsonb)
	;

	----update employee salaries for multiple employee IDs provided as input.	(select * from employee)
	update employee a
	set salary = (a.salary * iparam_increase_percent/100)
	from temp_salary_management b
	where a.employee_id = b.employee_id
	;
	
END;
$$
language plpgsql;

-- call scrop_salary_management('[1,2,3]',13);

-- select * from temp_salary_management;
-- drop table temp_salary_management;

-- select * from employee;