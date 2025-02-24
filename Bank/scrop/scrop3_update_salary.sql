-- 3)Stored Procedure for Salary Management version 1
-- Write a stored procedure to update the salary of a specific EMPLOYEE by adding a updated salary. 
--The procedure should take employee_id and new salary as parameters.

--drop procedure scrop_update_salary;

create or replace procedure scrop_update_salary(
	IN iparam_employee_id int
	,IN iparam_salary numeric
)
language plpgsql
as $$

BEGIN
	---update (select * from employee)
	update employee set salary = iparam_salary
	where employee_id = iparam_employee_id
	;

END;
$$;

--call scrop_update_salary(1, 55000);