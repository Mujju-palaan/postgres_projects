
--2) Function to Calculate Appointment Count per Doctor
--Write a function that calculates the number of appointments scheduled for a specific doctor.

--drop function calculate_appointment_per_doctor
create or replace function fun_calculate_appointment_per_doctor(iparam_doctor_id int)
	returns int

as $$
DECLARE appointment_per_doctor int;

BEGIN
	select count(a.appointment_id)
	into appointment_per_doctor
	from appointment a
	inner join doctor b using(doctor_id)
	where b.doctor_id = iparam_doctor_id
	group by b.doctor_id
	order by b.doctor_id
	;
	return appointment_per_doctor;
END;
$$
language plpgsql;

--select fun_calculate_appointment_per_doctor(2);
