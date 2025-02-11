--4
-- Assignment Tasks:
-- Stored Procedure Tasks:

--1) Stored Procedure for Medication Management
--Write a stored procedure to insert data into MEDICATION table.

-- select * from medication;
create or replace procedure scrop_insert_medication_data(
	IN iparam_medication_name varchar,
	IN iparam_medication_type varchar,
	IN iparam_dosage varchar
)
language plpgsql
AS $$
BEGIN

	----insert
	insert into mediacation(medication_name, medication_type, dosage)
	values(iparam_medication_name, iparam_medication_type, iparam_dosage);

END;
$$;

--call scrop_insert_medication_data(medication_name, iparam_medication_type, iparam_dosage)

----------------------------------------------------------------------------------------------------------------------------------------------
-- 2) Stored Procedure for Patient Admit Management
-- Write a stored procedure to update data in PATIENT_ADMIT table.
-- select * from patient_admission;

create or replace procedure scrop_update_patient_admission(
	IN iparam_admission_id int
)
language plpgsql
as $$
BEGIN
	---update
	update patient_admission set admit_type = 'In Patient'
	where admission_id = iparam_admission_id;

END;
$$;

--call scrop_update_patient_admission(admission_id);
--call scrop_update_patient_admission(2);

----------------------------------------------------------------------------------------------------------------------------------------------
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

----------------------------------------------------------------------------------------------------------------------------------------------
-- 4)Stored Procedure for Prescription Management
-- Create a stored procedure to display detailed prescription information.
---If a medicine is prescribed for 3 days, generate rows for each day, and if it is prescribed 3 times a day 
--for 3 days, display 9 rows. Utilize a dim_date table with a JOIN and apply the temporary table technique 
--to represent the morning, afternoon, and evening dosages.

--select * from prescription;
--select to_char(current_date, 'Day') AS DAY

--4a)
--drop procedure scrop_temp_Prescription_Management;
create or replace procedure scrop_temp_Prescription_Management(
	IN iparam_p_name varchar,
	IN iparam_dosage varchar,
	IN iparam_p_start_date date,
	IN iparam_p_end_date date,
	IN iparam_morning boolean,
	IN iparam_evening boolean,
	IN iparam_night boolean
)
language plpgsql
as $$
BEGIN
	---temp tbl
	create temp table temp_Prescription_Management(
		p_id int generated always as identity primary key, 
		p_name varchar(255) not null,
		dosage varchar(50) not null,
		p_start_date date default current_date not null,
		p_end_date date default current_date not null,
		morning boolean not null,
		evening boolean not null,
		night boolean not null,
		created_at date default current_date not null
);

	--inser into tbl
	insert into temp_Prescription_Management(p_name, dosage, p_start_date, p_end_date, morning, evening, night) 
	values(iparam_p_name, iparam_dosage, iparam_p_start_date, iparam_p_end_date, iparam_morning, iparam_evening, iparam_night);

END;
$$;

--call scrop_temp_Prescription_Management('Dolo 650', '650mg', '2025-01-01', '2025-01-03', true, true, true);

--select * from temp_Prescription_Management;

--4b)
--drop procedure scrop_temp_Prescription_Management;

create or replace procedure scrop_temp_Prescription_Management_4b(
	IN iparam_Prescription_name varchar,
	IN iparam_dosage varchar,
	IN iparam_Prescription_date date,
	IN iparam_morning boolean,
	IN iparam_evening boolean,
	IN iparam_night boolean
)
language plpgsql
as $$
BEGIN
	---temp tbl
	create temp table temp_Prescription_Management_4b(
		Prescription_id int generated always as identity primary key, 
		Prescription_name varchar(255) not null,
		dosage varchar(50) not null,
		Prescription_date date default current_date not null,
		morning boolean not null,
		evening boolean not null,
		night boolean not null,
		created_at date default current_date not null
);

	--inser into tbl
	insert into temp_Prescription_Management(Prescription_name, dosage, Prescription_date,morning, evening, night) 
	values(iparam_Prescription_name, iparam_dosage, iparam_Prescription_date,iparam_morning, iparam_evening, iparam_night);

	
END;
$$;

--call scrop_temp_Prescription_Management_4b('Dolo 650', '650mg', '2025-01-01', '2025-01-03', true, true, true);

--select * from temp_Prescription_Management_4b;

----------------------------------------------------------------------------------------------------------------------------------------------
-- 5)Stored Procedure for Billing Information 		----function
-- Create a stored procedure to display detailed billing information for a specified patient. 
--The output should include treatment details, patient data, billing data, and payment information. 
--Mark a record as overdue if the total amount remains unpaid for more than 3 days after the bill creation date. 
--If a single bill has multiple payments, present the receipt IDs as a comma-separated list.

-- select * from billing;
-- select * from patient;
-- select * from patient_admission;
-- select * from payment;

-- drop function fun_Billing_Information;

create or replace function fun_Billing_Information(iparam_patient_id int)
 returns table(
	iparam_first_name varchar,
	iparam_last_name varchar,
	iparam_date_of_birth date,
	iparam_email varchar,
	iparam_phone_number bigint,	
	iparam_admit_type varchar,
	iparam_treatment_description varchar,
	iparam_treatment_start_date date,
	iparam_treatment_end_date date,	
	iparam_bill_date date,
	iparam_bill_type varchar,
	iparam_total_amount numeric(10,2),
	iparam_balance_amount numeric(10,2),
	iparam_amount_paid numeric(10,2),
	iparam_payment_date date,
	iparam_bill_status text	
 )
as $$

BEGIN
	return QUERY
	--treatment details, patient data, billing data, and payment information. 
	select a.first_name, a.last_name, a.date_of_birth, a.email, a.phone_number,
			b.admit_type, b.treatment_description, b.treatment_start_date, b.treatment_end_date,
			c.bill_date, c.bill_type, c.total_amount, c.balance_amount,
			d.amount_paid, d.payment_date,
			CASE
                WHEN (c.total_amount - d.amount_paid) >= 0 AND (CURRENT_DATE - c.bill_date) <= 3 OR (CURRENT_DATE - c.bill_date) >= 0
                THEN 'Overdue'
                ELSE 'Paid'
            END AS bill_status
			from patient a
			inner join patient_admission b using(patient_id)
			inner join billing c using(admission_id)
			inner join payment d ON c.billing_id=d.bill_id
			where a.patient_id = iparam_patient_id
	;

END;
$$ language plpgsql;

-- select * from fun_Billing_Information(10);


----------------------------------------------------------------------------------------------------------------------------------------------
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


----------------------------------------------------------------------------------------------------------------------------------------------
-- 7)Stored Procedure for New Room Admits
-- Create a stored procedure to insert room admit details while ensuring that the assigned room is not double-booked. 
--Additionally, automatically generate a billing record based on the room's per-day fee.

create or replace procedure scrop_insert_room_admits_billing_details(
	IN iparam_start_date date,
	IN iparam_end_date date,
	IN iparam_room_id int,
	IN iparam_incharge_nurse_id int,
	IN iparam_admission_id int,
	--- select * from billing
	IN iparam_bill_date date,
	IN iparam_bill_type varchar,
	IN iparam_description text,
	-- IN iparam_total_amount numeric(10,2),
	IN iparam_balance_amount numeric(10,2),
	-- IN iparam_admission int,
	IN iparam_billing_status varchar
)
language plpgsql
as $$

DECLARE room_count int;
		room_charges numeric(10,2);
		last_admit_id int;

BEGIN
	----ensuring that the assigned room is not double-booked  select * from room;
	SELECT COUNT(a.room_id) into room_count
    FROM room a 
	inner join room_admit b using(room_id)
    WHERE (iparam_start_date between b.start_date and b.end_date)
	AND room_id = iparam_room_id;
	
	IF room_count > 0 THEN
        RAISE EXCEPTION 'Room is already booked for this time period';
    END IF;
	
	---insert room admit details   select * from room_admit;
	insert into room_admit(start_date, end_date, room_id, incharge_nurse_id, admission_id)
	values(iparam_start_date, iparam_end_date, iparam_room_id, iparam_incharge_nurse_id, iparam_admission_id)
	returning admit_id into last_admit_id;

	
	---generate a billing record based on the room's per-day fee. select * from billing;
	select ((a.end_date - a.start_date)*(b.daily_rate)) into room_charges
	from room_admit a
	inner join room b using(room_id)
	where admit_id = last_admit_id;
	
	---insert billing details   select * from billing;
	insert into billing(bill_date, bill_type, description, total_amount, balance_amount, admission_id, billing_status)
	values(iparam_bill_date, iparam_bill_type, iparam_description, room_charges, iparam_balance_amount,
			iparam_admission_id, iparam_billing_status);
			
END;
$$;

--call scrop_insert_room_admits_billing_details('2025-02-06','2025-02-11', 9, 2, 2, '2025-02-11', 'Room Charge'
	, 'Room Charges only', 1000, 'Not paid');

-- ---ensuring that the assigned room is not double-booked
-- SELECT COUNT(a.room_id) 
--     FROM room a 
-- 	inner join room_admit b using(room_id)
--     WHERE current_date between b.start_date and b.end_date
-- 	;

-- ---generate a billing record based on the room's per-day fee. select * from billing;
-- 	select ((a.end_date - a.start_date)*(b.daily_rate)) AS room_charges
-- 	from room_admit a
-- 	inner join room b using(room_id)

----------------------------------------------------------------------------------------------------------------------------------------------

-- 8)Stored Procedure for Payment Receipts
-- Create a stored procedure to insert payment receipt details and automatically update the associated bill 
--status to indicate whether it is fully paid or partially paid.
alter table billing add column billing_status varchar(50);
-- select * from payment;
-- select * from billing;
create or replace procedure scrop_insert_payment_receipt_update_billing_status(
	IN iparam_billing_id int,
	IN iparam_patient_id int,
	IN iparam_amount_paid numeric(10,2),
	IN iparam_payment_date date
)
language plpgsql
as $$
DECLARE d_total_amount numeric(10,2);
		d_total_paid numeric(10,2);
		last_billing_id int;
		
BEGIN

	----- Get the total amount of the bill
	SELECT total_amount into d_total_amount
	from billing
	where billing_id = iparam_billing_id;
	
	-- If no bill exists with the given ID, raise an error
    if d_total_amount is null then
	RAISE EXCEPTION 'BILL WITH ID % not found', iparam_billing_id;
	end if;
	
	--insert in payment
	insert into payment(bill_id, patient_id, amount_paid, payment_date)
	values(iparam_billing_id, iparam_patient_id, iparam_amount_paid, iparam_payment_date)
	returning bill_id into last_billing_id;

	--Get the total amount paid so far for the bill
	select coalesce(sum(amount_paid),0) into d_total_paid
	from payment
	where bill_id = last_billing_id;
	
	--update the associated bill status to indicate whether it is fully paid or partially paid.
	if d_total_paid >= d_total_amount then
	update billing set billing_status = 'fully_paid'
	where billing_id = last_billing_id;
	
	elsif d_total_paid > 0 then
	update billing set billing_status ='partially_paid'
	where billing_id = last_billing_id;
	
	ELSE UPDATE billing
	set billing_status = 'unpaid'
	where billing_id = last_billing_id;
	end if;

END;
$$;

--call scrop_insert_payment_receipt_update_billing_status(1,1,500,current_date);


------------------------------------------------------------------------------------------------------------------------------------------------


--View Tasks:
--1) View for Room Information. select * from room;
--Create a view to display room details including room id, room name, daily rate and room type.
create view view_room_details AS
	select room_id, room_number, room_type, daily_rate  
	from room;

--select * from view_room_details;

--2) View for Appointment Details,, select * from appointment,,select * from patient,,select * from doctor,,select * from billing
--Create a view to display appointment details including patient name, doctor name, doctor specialization, 
--appointment date, room name and status.
create view view_appointment_details AS
	select b.first_name||' '||b.last_name as patient_name,
			c.first_name||' '||c.last_name as doctor_name,
			c.specialization,
			a.appointment_date,
			d.room_type,
			billing_status			
	from appointment a 
	inner join patient b ON a.patient_id=b.patient_id
	inner join doctor c ON a.doctor_id=c.doctor_id
	inner join room d ON a.room_id=d.room_id
	inner join room_admit e ON a.admission_id=e.admission_id
	inner join billing f ON e.admission_id=f.admission_id
--select * from view_appointment_details;
			

--3) View for Monthly Room Occupancy Details
--Write a view that lists each room occupancy on daily basis with details such as calendar date, patient name, 
--incharge nurse, and daily billing rate. If a room is unoccupied on a given date, display the room ID without 
--any associated patient information. You need to JOIN date dim table with room admit table. LEFT JOIN plays crucial role in this solution.
create view view_monthly_room_occupancy_details as
	select 
			g.calendar_date
			,d.room_number
			,b.first_name||' '||b.last_name as patient_name
			,c.first_name||' '||c.last_name as nurse_name
			,c.nurse_id
			,f.bill_date
			-- ,f.total_amount
			,(e.end_date-e.start_date)*d.daily_rate as daily_billing_amount
	from appointment a
	left join patient b using(patient_id)
	left join nurse c ON a.incharge_nurse_id=c.nurse_id
	left join room d ON a.room_id=d.room_id
	left join room_admit e ON a.admission_id=e.admission_id
	left join billing f ON e.admission_id=f.admission_id
	left join date_dim g ON g.calendar_date = f.bill_date
	;
	

--select * from view_monthly_room_occupancy_details;

--4) View for Patient Discharge Billing Information
--Create a view to display treatment billing information, including treatment description, bill date, bill amount, 
--paid amount, pay receipt id, and balance amount. If multiple payments have been made for a single bill, display the 
--receipt IDs as a comma-separated list. There shall be one record per bill, repeating treatment information is ok.
create view view_patient_discharge_billing_info AS
	select a.bill_date, a.total_amount as bill_amount, --billing
			b.amount_paid,  ---payment
			COALESCE(STRING_AGG(b.payment_id::TEXT, ', '), 'No Payment') AS receipt_ids,			
			a.balance_amount --billing
			from billing a
			inner join payment b ON a.billing_id=b.bill_id
			group by b.amount_paid, b.payment_id,a.bill_date, a.total_amount,balance_amount
	;

--select * from view_patient_discharge_billing_info;


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

--Trigger Task:
--Trigger on Appointment Status Change
---Create a trigger on the APPOINTMENT table that logs changes to the status field into the AUDIT_LOG table. 
--Capture the appointment_id, old_status, new_status, log_date, and user_id.
--select * from appointment_log;

create table appointment_log(
	log_id int GENERATED ALWAYS AS IDENTITY,
	appointment_id int,
	old_status varchar(50),
	new_status varchar(50),
	log_date timestamp default current_timestamp,
	doctor_id int,
	nurse_id int
);

---function
create or replace function trg_fun_update_status()
returns trigger

as $$
BEGIN
	IF OLD.status is DISTINCT from NEW.status then
		INSERT INTO appointment_log(appointment_id, old_status, new_status, doctor_id, nurse_id)
		VALUES(OLD.appointment_id, OLD.status, NEW.status, OLD.doctor_id, OLD.incharge_nurse_id);
	END IF;
	return NEW;
	
END;
$$
language plpgsql;


---create trigger
create or replace trigger trg_update_status
AFTER update on appointment
for each row 
WHEN(OLD.status is distinct from new.status)
EXECUTE FUNCTION trg_fun_update_status();

update appointment
set status = 'Scheduled'
where appointment_id = 1;	