-- 3)Stored Procedure for Doctor Management
-- Write a stored procedure to select data from DOCTOR table.
--select * from doctor;

create or replace function fun_get_doctor_details(iparam_doctor_id int)
returns table(
	iparam_first_name varchar,
	iparam_last_name varchar,
	iparam_specialization varchar,
	iparam_email varchar,
	iparam_phone_number bigint,
	iparam_per_visit_cost numeric(10,2),
	iparam_active boolean,
	iparam_login_id varchar
)
as $$
BEGIN
	RETURN query
	select first_name, last_name, specialization, email, phone_number, per_visit_cost, active, login_id
	from doctor
	where doctor_id = iparam_doctor_id;

END;
$$ language plpgsql;

--select * from fun_get_doctor_details(1);
