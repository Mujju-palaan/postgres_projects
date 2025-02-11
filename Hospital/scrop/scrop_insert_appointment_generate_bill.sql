-- 6)Stored Procedure for New Appointments
-- Create a stored procedure to insert patient appointment details while ensuring that the assigned doctor 
--or room is not double-booked. Additionally, automatically generate a billing record based on the doctor's per-visit fee.


--ensuring that the assigned doctor or room is not double-booked
-- automatically generate a billing record based on the doctor's per-visit fee
-- select * from appointment;
-- select * from patient_admission;
-- select * from billing;
-- select * from room;
-- select * from doctor;
call scrop_insert_appointment_generate_bill('2025-02-17', '12:32:00','Scheduled', 1,2,7,4,5,'2025-02-07','Doctor Appointment',
											'Check up and medication', 'unpaid');

create or replace procedure scrop_insert_appointment_generate_bill(
	IN iparam_appointment_date date,
	IN iparam_appointment_time time,
	IN iparam_status varchar,
	IN iparam_patient_id int,
	IN iparam_doctor_id int,
	IN iparam_room_id int,
	IN iparam_incharge_nurse_id int,
	IN iparam_admission_id int,
	---billing
	IN iparam_bill_date date,
	IN iparam_bill_type varchar,
	IN iparam_description text,
	-- IN iparam_total_amount numeric(10,2),
	-- IN iparam_balance_amount numeric(10,2),
	-- IN iparam_admission_id int,
	IN iparam_billing_status varchar
)
language plpgsql
as $$

DECLARE 
		room_count int;
		appointment_count int;
		doctor_fee numeric(10,2);
		room_fee numeric(10,2);
		last_patient_id int;

BEGIN
	----  select * from appointment;
	SELECT COUNT(*) 
    FROM appointment into appointment_count
    WHERE appointment_date = iparam_appointment_date;

	IF appointment_count > 0 THEN
        RAISE EXCEPTION 'Doctor is already booked for this time';
    END IF;

	----  select * from room;   select * from room_admit;
	SELECT COUNT(*) 
    FROM room_admit into room_count
    WHERE iparam_appointment_date between start_date and end_date;

	IF room_count > 0 THEN
        RAISE EXCEPTION 'Room is already booked for this date:%', ;
    END IF;
	
	---insert patient appointment details
	insert into appointment(appointment_date, appointment_time, status, patient_id, doctor_id, room_id, incharge_nurse_id, admission_id )
	values(iparam_appointment_date, iparam_appointment_time, iparam_status, iparam_patient_id, iparam_doctor_id,
			iparam_room_id, iparam_incharge_nurse_id, iparam_admission_id)
			returning patient_id into last_patient_id;
	
	---doctor fee select * from doctor
	SELECT ((a.per_visit_cost)*(count(b.patient_id))) INTO doctor_fee
    FROM doctor a
	inner join appointment b using(doctor_id)
	WHERE doctor_id = iparam_doctor_id AND patient_id = last_patient_id
	group by a.per_visit_cost ;
	
	---insert patient billing details
	insert into billing(bill_date, bill_type, description, total_amount, balance_amount, admission_id, billing_status)
	values(iparam_bill_date, iparam_bill_type, iparam_description, doctor_fee
			, doctor_fee, iparam_admission_id, iparam_billing_status);
	
END;
$$;

