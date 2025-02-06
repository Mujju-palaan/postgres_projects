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


-- 2) Stored Procedure for Patient Admit Management
-- Write a stored procedure to update data in PATIENT_ADMIT table.
select * from patient_admission;

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

-- 4)Stored Procedure for Prescription Management
-- Create a stored procedure to display detailed prescription information.
---If a medicine is prescribed for 3 days, generate rows for each day, and if it is prescribed 3 times a day 
--for 3 days, display 3 rows. Utilize a dim_date table with a JOIN and apply the temporary table technique 
--to represent the morning, afternoon, and evening dosages.

--select * from prescription;
--select to_char(current_date, 'Day') AS DAY

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
	insert into temp_Prescription_Management_9rows(p_name, dosage, p_start_date, p_end_date, morning, evening, night) 
	values(iparam_p_name, iparam_dosage, iparam_p_start_date, iparam_p_end_date, iparam_morning, iparam_evening, iparam_night);

END;
$$;

--call scrop_temp_Prescription_Management('Dolo 650', '650mg', '2025-01-01', '2025-01-03', true, true, true);

--select * from temp_Prescription_Management;


-- 5)Stored Procedure for Billing Information 		----function
-- Create a stored procedure to display detailed billing information for a specified patient. 
--The output should include treatment details, patient data, billing data, and payment information. 
--Mark a record as overdue if the total amount remains unpaid for more than 3 days after the bill creation date. 
--If a single bill has multiple payments, present the receipt IDs as a comma-separated list.

select * from billing;
select * from patient;
select * from patient_admission;
select * from payment;

drop function fun_Billing_Information;

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

select * from fun_Billing_Information(10);

-- 6)Stored Procedure for New Appointments
-- Create a stored procedure to insert patient appointment details while ensuring that the assigned doctor 
--or room is not double-booked. Additionally, automatically generate a billing record based on the doctor's per-visit fee.


-- 7)Stored Procedure for New Room Admits
-- Create a stored procedure to insert room admit details while ensuring that the assigned room is not double-booked. 
--Additionally, automatically generate a billing record based on the room's per-day fee.


-- 8)Stored Procedure for Payment Receipts
-- Create a stored procedure to insert payment receipt details and automatically update the associated bill 
--status to indicate whether it is fully paid or partially paid.
