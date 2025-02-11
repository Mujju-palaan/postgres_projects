--Function Tasks:
--1) Function to Calculate Total Bill per Patient
--Write a function to calculate the total amount billed to a patient based on the treatments and services provided.
create function fun_calculate_total_bill_per_patient(iparam_patient_id int)
	returns numeric
as $$

DECLARE total_bill_per_patient numeric;

BEGIN
	select 
	-- c.patient_id,
	-- c.first_name||' '||c.last_name AS patient_name,
	sum((b.treatment_end_date - b.treatment_start_date)*d.daily_rate) AS total_bill_per_patient
	into total_bill_per_patient
	from appointment a
	inner join patient_admission b using(admission_id)
	inner join patient c ON b.patient_id=c.patient_id
	inner join room d ON a.room_id = d.room_id
	where c.patient_id = iparam_patient_id
	group by c.patient_id
	order by c.patient_id
	;

	return total_bill_per_patient;
END;
$$ 
language plpgsql;

--select fun_calculate_total_bill_per_patient(3);
