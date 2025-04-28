-- Stored Procedure for Customer Management
-- Create a stored procedure to insert customer information for the Customer Management screen.
-- select * from employee;

create or replace procedure scrop_insert_employee_data(
	IN iparam_first_name varchar
	,IN iparam_last_name varchar
	,IN iparam_hire_date date
	,IN iparam_salary numeric(10,2)
	,IN iparam_yearly_leave_count int
	,IN iparam_phone_number varchar
	,IN iparam_department_id int
)
as $$

BEGIN
	----insert 
	insert into employee(first_name, last_name, hire_date, salary, yearly_leave_count, phone_number, department_id)
	values(iparam_first_name, iparam_last_name, iparam_hire_date, iparam_salary, iparam_yearly_leave_count, iparam_phone_number, iparam_department_id)
	;
	
END;
$$ language plpgsql;


-- call scrop_insert_employee_data();

-- CALL public.scrop_insert_employee_data(
-- 	'Mujju'		-- <IN iparam_first_name character varying>,
-- 	,'palaan'		-- <IN iparam_last_name  character varying>,
-- 	,'2002-01-01'		-- <IN iparam_hire_date  date>,
-- 	,30000				-- <IN iparam_salary  numeric>,
-- 	,16				-- <IN iparam_yearly_leave_count  integer>,
-- 	,'7868777777'			-- <IN iparam_phone_number  character varying>,
-- 	,1				-- <IN iparam_department_id  integer>
-- );











