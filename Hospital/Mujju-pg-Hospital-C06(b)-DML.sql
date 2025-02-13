--hospital_db_data

--Question 2: Insert a New Patient
--select * from Patient;
insert into patient (first_name, last_name, date_of_birth, email, phone_number)
values ('Mujju','Palaan','1997-11-03','mujju@example.com','7867837866');

---Question 3: Insert Multiple Doctors
--select * from Doctor;
insert into doctor(first_name, last_name, specialization, email, phone_number, per_visit_cost, active, login_id)
values ( 'Dr.Mujju', 'Smith','Cardiology','mujju.smith@example.com', '1234567890',400,'t','dr_mujju'),
		( 'Dr.Muzzu', 'Brown', 'Neurology', 'muzzu.brown@example.com', '1234567891',250,'t','dr_muzzu')
;

---Question 4: Insert an Appointment
--select * from APPOINTMENT
insert into APPOINTMENT(appointment_date, appointment_time, status ,patient_id, doctor_id, room_id, incharge_nurse_id, admission_id)
values ('2024-09-10', '12:12:12', 'Scheduled','1','2','3','4','5');

--Question 5: Update Patient Information
--Write a SQL statement to update the email and phone number of the patient with patient_id = 1.
--select * from patient
update patient  set email='smith.alice@tansy.com', phone_number='1234567890'
where patient_id = 1;

--Question 6: Delete an Appointment
--Write a SQL statement to delete an appointment where appointment_id = 5.
------delete from APPOINTMENT where appointment_id = 11;

---Question 7: Insert Data Using Subquery
--Insert a new appointment into the APPOINTMENT table using a subquery to find the patient_id of 
--the patient whose last_name is 'Johnson' and doctor_id of the doctor with specialization 'Cardiology'.
-- select * from APPOINTMENT;
-- select * from patient;
-- select * from doctor;
insert into APPOINTMENT(appointment_date, appointment_time, status ,patient_id, doctor_id, room_id, incharge_nurse_id, admission_id)
values ('2025-02-01',
		'09:00:00',
		'Scheduled',
		(select patient_id from patient where first_name = 'Johnson'),
		(select doctor_id from doctor where specialization = 'Cardiology'),
		1,1,2);

--Question 8: Update Doctor's Specialization
--Write a SQL statement to update the specialization of the doctor with doctor_id = 2 to 'Pediatrics'.
-- select * from doctor;
update doctor set specialization = 'Pediatrics' where doctor_id = 1;

--Question 9: Insert into DOCTOR_DEPARTMENT Table
--Insert a record into the DOCTOR_DEPARTMENT table, associating doctor_id 2 with department_id 3.
--select * from DOCTOR_DEPARTMENT;
insert into DOCTOR_DEPARTMENT (doctor_id, department_id)
values (2,3);

--Question 10: Insert Multiple Departments
--select * from DEPARTMENT
insert into DEPARTMENT (department_name, location )
values ('Medical Research','Bulding A'),
		('Pharmacy Department','Bulding B'),
		('Nursing Department','Bulding C');

--Question 11: Update with INNER JOIN
--Write a SQL statement to update the total_amount in the BILLING table by increasing it by 500 for 
--all patients who have an appointment with a doctor in the 'Cardiology' specialization. 
--Use an INNER JOIN between BILLING, PATIENT, APPOINTMENT, and DOCTOR tables.
-- select * from billing;
-- select * from patient;
-- select * from APPOINTMENT;
-- select * from DOCTOR;
update billing set total_amount = total_amount+500 
where total_amount in (select a.total_amount from billing a
							inner join APPOINTMENT b using(admission_id)
							inner join patient c using(patient_id)
							inner join doctor d using(doctor_id)
							where specialization = 'Cardiology');

--Question 12: Delete with INNER JOIN
--Write a SQL statement to delete all appointments where the patient's last_name is 'Johnson' 
--and the doctor is specialized in 'Neurology', using an INNER JOIN between the APPOINTMENT, PATIENT, and DOCTOR tables.
-- select * from APPOINTMENT;
-- select * from PATIENT;
-- select * from DOCTOR;
delete from appointment 
where patient_id in (
					select b.patient_id from appointment a
					inner join patient b using(patient_id)
					inner join doctor c using(doctor_id)
					where c.specialization = 'Neurology'
					and  b.last_name = 'Johnson');

--Question 13: Update with Subquery
--Write a SQL statement to update the appointment_date in the APPOINTMENT table to '2024-09-15' for 
--all appointments where the patient has a pending bill (balance_amount > 0) in the BILLING table.
-- select * from APPOINTMENT
-- select * from BILLING
update APPOINTMENT set appointment_date = '2024-09-15' 
where admission_id in (select admission_id from billing where balance_amount > 1000);

--Question 14: Insert a New Prescription
--Write a SQL statement to insert a new prescription into the PRESCRIPTION table for a patient, doctor, and medication:
--prescription_date: '2024-09-25',medication_id: 1,patient_id: 1,doctor_id: 2
--select * from PRESCRIPTION
insert into PRESCRIPTION(prescription_date, medication_id, patient_id, doctor_id, start_date, 
end_date, morning_flag, noon_flag, evening_flag, admission_id)
values ('2025-01-21',1,1,1,'2025-02-11','2025-02-21','t','t','t',1);

--Question 15: Update Prescription Information
--Write a SQL statement to update the medication_id for a prescription where prescription_id = 3.
--select * from Prescription;
update PRESCRIPTION set medication_id = 2 where prescription_id = 11;

--Question 16: Delete a Treatment Record
--Write a SQL statement to delete a treatment record where the treatment_id = 4.
--delete from treatment where treatment_id = 4;

--Question 17: Insert a New Nurse
--Write a SQL statement to insert a new nurse into the NURSE table with the following details:
--first_name: 'Nina'last_name: 'Williams'email: 'nina.williams@example.com'hire_date: '2022-03-01'
--select * from nurse;
insert into nurse(first_name, last_name, date_of_birth, email, phone_number, hire_date, active, login_id) 
values ('Nina','Williams','1997-11-03','nina.williams@example.com', '78678372346', '2022-03-01','f','nina_williams');

--Question 18: Insert Data into ROOM Table
--Write a SQL statement to insert a new room into the ROOM table:
--room_number: '303'room_type: 'ICU'department_id: 1
---select * from room;
insert into room(room_number, room_type, daily_rate, department_id)
values (203, 'ICU', 400, 1);

--Question 19: Select Into Backup Table
--Write a SQL statement to create a backup of all rows in the PATIENT table into a new table called PATIENT_BACKUP.
create table PATIENT_BACKUP as
 select * from PATIENT;

---select * from PATIENT_BACKUP;

--Question 20: Add JSON Column to PATIENT Table
--Write a SQL statement to add a meta_data column of type JSON to the PATIENT table.
alter table patient add column meta_data jsonb;

--Question 21: Insert into JSON Column
--Write a SQL statement to insert JSON data into the meta_data column of the PATIENT table for a specific patient.
--The JSON should contain keys like "insurance_provider", "policy_number", and "policy_expiry_date".
--select * from PATIENT;
insert into patient(first_name, last_name, date_of_birth, email, phone_number, meta_data)
values ('Jim','Carter','1974-11-03','jim@tansy.com','332224333333','{"insurance_provider":"TATA",
"policy_number":"1234010","policy_expiry_date":"2026-03-11"}');

--Question 22: Update JSON Column
--Write a SQL statement to update the meta_data JSON column of the PATIENT table by 
--adding or updating the "policy_expiry_date" for a specific patient.
--update patient set meta_data[2] = '2025-12-12' where patient_id = 1;
UPDATE patient
SET meta_data = '{"insurance_provider":"TATA",
"policy_number":"1234010","policy_expiry_date":"2026-03-11"}'
WHERE patient_id = 1;

UPDATE PATIENT  
SET meta_data = jsonb_set(meta_data::jsonb, '{policy_expiry_date}', '"2025-06-31"', true)  
WHERE patient_id = 1;
--Question 23: Delete JSON Data
--Write a SQL statement to remove the "policy_number" field from the meta_data JSON column for a specific patient.
--select * from PATIENT;
UPDATE PATIENT
SET meta_data = meta_data - 'policy_number'
WHERE patient_id = 1;


--Question 24: Update Billing Information
--Write a SQL statement to update the total_amount in the BILLING table where billing_id = 2 by increasing it by 200.
--select * from BILLING;
update BILLING set total_amount= total_amount+200 where billing_id = 2;

--Question 25: Delete a Room
--Write a SQL statement to delete a room where room_id = 5.
--select * from room;
delete from room where room_id = 11;

--Question 26: Truncate the APPOINTMENT Table
--Write a SQL statement to truncate the APPOINTMENT table, removing all rows without generating individual delete triggers.
--select * from APPOINTMENT;
truncate table APPOINTMENT;

--Question 27: PostgreSQL UPSERT (INSERT ON CONFLICT)
--Write a SQL statement to insert a new doctor record or update the email if the doctor_id already exists.
--select * from doctor;
insert into doctor(first_name, last_name, specialization, email, phone_number, per_visit_cost, active, login_id) 
values ('Dr. Mujju', 'Palaan', 'Kaatpeet', 'Mujju.palaan@tansy.com', '9999999999', 99, 't', 'dr_palaan')
ON CONFLICT (email)
DO UPDATE SET phone_number = EXCLUDED.phone_number;

--Question 28: SUPER Complex INSERT.
--Write a single INSERT SQL statement to add multiple records for all doctors into the APPOINTMENTS table 
--with null patient id, for every Sunday of the current month:

--Create a DATE_DIM table with columns: date_id, calendar_date, year, month, day_of_the_month, week_day_number, 
--week_day_name, yearly_week_number, month_start_date_flag, month_end_date_flag, year_start_date_flag, 
--year_end_date_flag, holiday_flag
--The date_id should be populated in the YYYYMM format (e.g., 202401).
--Populate the DATE_DIM table with data for current year and the next year.
Create table DATE_DIM (
    date_id int unique NOT NULL PRIMARY KEY, -- YYYYMM
    calendar_date DATE default current_date NOT NULL,                       
    year INT NOT NULL,
    month INT check(month in (1,2,3,4,5,6,7,8,9,10,11,12)) NOT NULL,
    day_of_the_month INT check(day_of_the_month >= 1 AND day_of_the_month <=31) NOT NULL,                    
    week_day_number INT check(week_day_number >= 1 AND week_day_number <=7) NOT NULL,
    week_day_name VARCHAR(9) 
    check(week_day_name in ('Monday','Tuesday','Wednesday','Thursday','Friday','Saturday','Sunday')) NOT NULL,
    yearly_week_number INT check(yearly_week_number >= 1 AND yearly_week_number <=53) NOT NULL,
    month_start_date_flag BOOLEAN NOT NULL,
    month_end_date_flag BOOLEAN NOT NULL,
    year_start_date_flag BOOLEAN NOT NULL,
    year_end_date_flag BOOLEAN NOT NULL,
    holiday_flag BOOLEAN NOT NULL
);

insert into DATE_DIM(date_id, year, month, day_of_the_month, week_day_number, week_day_name, yearly_week_number,
month_start_date_flag, month_end_date_flag, year_start_date_flag, year_end_date_flag, holiday_flag)
values(202403, 2024, 6, 22, 6, 'Sunday', 52, 'false', 'true', 'false', 'true', 'true'); 

insert into DATE_DIM(date_id, calendar_date, year, month, day_of_the_month, week_day_number, week_day_name, yearly_week_number,
month_start_date_flag, month_end_date_flag, year_start_date_flag, year_end_date_flag, holiday_flag)
values(202501, '2025-01-01', 2024, 6, 22, 6, 'Sunday', 52, 'false', 'true', 'false', 'true', 'true'); 

--select * from date_dim;

---GOOD LUCK WITH YOUR ASSIGNMENT!!!