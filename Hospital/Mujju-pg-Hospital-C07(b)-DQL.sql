--Chapter 7 - DQL (Data Query Language)
--DQL Assignment 4 - PostgreSQL Logic for Dashboard Reporting in a Hospital Management System


-- Assignment Tasks:
-- 1. Patient Overview
-- Metrics:
-- Total number of patients.
-- List of patients with date of birth and email.
-- Number of appointments per patient.

-- SQL Queries:
-- Count total patients.
select count(*) from patient;

-- Retrieve patient names, date of birth, and email.
select first_name||' '||last_name as patient_name, date_of_birth, email from patient;

-- Retrieve the number of appointments per patient (join PATIENT and APPOINTMENT).
select 	a.patient_id,
		a.first_name||' '||a.last_name as patient_name,
		a.date_of_birth,
		a.email,
		count(b.appointment_id) as number_of_appointments_per_patient
from patient a
inner join appointment b using(patient_id)
group by a.patient_id
;
---------------------------------------------------------------------------------------------------

-- 2. Doctor Overview
-- Metrics:
-- Total number of doctors.
-- Doctors by specialization.
-- Doctor assignments (how many departments per doctor).

-- SQL Queries:
-- Count total doctors.
select count(*) from doctor;

-- Retrieve doctors grouped by specialization.
select 	specialization,
		count(doctor_id)
from doctor
group by specialization;

-- List doctor per department (join DOCTOR, DOCTOR_DEPARTMENT, and DEPARTMENT).
select 	department_name,
		count(doctor_id)
from doctor
inner join DOCTOR_DEPARTMENT using(doctor_id)
inner join DEPARTMENT using(DEPARTMENT_id)
group by department_name
;

---------------------------------------------------------------------------------------------------
-- 3. Appointment Overview
-- Metrics:
-- Total appointments per doctor.
-- Recent appointments (within the last 3 months).
-- Appointments by status (Scheduled, Completed, Cancelled).

-- SQL Queries:
-- Count total appointments per doctor.
select a.doctor_id, a.first_name||' '||a.last_name as doctor_name,
		count(b.appointment_id) as appointments_per_doctor
from doctor a
inner join appointment b using(doctor_id)
group by a.doctor_id
order by a.doctor_id;

-- Retrieve recent appointments.
select * from appointment
where appointment_date = current_date;

-- Retrieve appointments grouped by status.
select status, count(appointment_id) 
from appointment
group by status;

---------------------------------------------------------------------------------------------------
-- 4. Room Overview
-- Metrics:
-- Room availability (by room type: General, ICU, Private).
-- Rooms by department.
-- Total number of rooms.

-- SQL Queries:
-- Count total rooms grouped by room type.
select room_type, 
		count(room_id) 
from room
group by room_type;

-- Retrieve rooms grouped by department (join ROOM and DEPARTMENT).



-- Count total rooms available in the system.
select count(*) from room;

---------------------------------------------------------------------------------------------------
-- 5. Treatment Overview
-- Metrics:
-- Treatments by doctor.
-- Patients receiving treatments (linked to doctors).
-- Recent treatments (conducted within the last year).

-- SQL Queries:
-- Retrieve treatments performed by each doctor (join TREATMENT, DOCTOR, and PATIENT).
select 	d.first_name||' '||d.last_name as patient_name
		,a.doctor_id
		,c.treatment_start_date
		,c.treatment_end_date
from doctor a
inner join appointment b using(doctor_id)
inner join patient_admission c using(admission_id)
inner join patient d ON c.patient_id=d.patient_id
order by a.doctor_id
;

-- Retrieve treatments linked to patients and doctors.
select patient_id, doctor_id from appointment
order by 1,2;

-- Retrieve treatments conducted in the last year.
select * from patient_admission
where extract(year from treatment_start_date) = extract(year from current_date) - 1;

---------------------------------------------------------------------------------------------------
-- 6. Audit Log Overview
-- Metrics:
-- List of recent system changes.
-- Changes made by doctors.
-- Number of logs per day.

-- SQL Queries:
-- Retrieve recent actions from the AUDIT_LOG table.
select * from audit_log
where log_date = current_date;

-- Retrieve actions performed by doctors (join AUDIT_LOG with DOCTOR).


-- Count the number of audit logs per day.
select log_date
		,count(*)
from audit_log
group by log_date
;

---------------------------------------------------------------------------------------------------
-- Key Visuals and Corresponding SQL Queries:
-- Note: All dashboard queries must work against current month or current year filters

---------------------------------------------------------------------------------------------------
-- Bar Chart - Patient Admits
-- SQL Query: Retrieve admit counts grouped by month.
-- X-Axis: Month.
-- Y-Axis: Number of patient admits.
select extract(month from treatment_start_date) as Months
		,count(patient_id)
from patient_admission
group by extract(month from treatment_start_date)
order by extract(month from treatment_start_date)
;

---------------------------------------------------------------------------------------------------
-- Pie Chart - Doctors by Specialization
-- SQL Query: Retrieve doctors grouped by their specialization.
-- Pie Sections: Number of doctors per specialization.
select Specialization
		,count(*)
from doctor
group by Specialization
order by Specialization
;

---------------------------------------------------------------------------------------------------
-- Line Graph - Doctor Visits by Month
-- SQL Query: Retrieve doctor appointments conducted per month.
-- X-Axis: Treatment date grouped by month.
-- Y-Axis: Number of appointments.
select extract(month from appointment_date)
		,count(*)
from appointment
group by extract(month from appointment_date)
order by extract(month from appointment_date)
;


---------------------------------------------------------------------------------------------------
-- Table - Occupancy Summary
-- SQL Query: Retrieve patient names and room admit dates.
-- Columns: Calendar Date, Room Name, Patient Name.
-- Note: Retrieve data for a specified month across all rooms, including rooms without any patients
select extract(month from b.start_date)
		-- ,a.room_type
		,a.room_number
		,d.first_name||' '||d.last_name as patient_name
from room a
left join room_admit b using(room_id)
left join patient_admission c using(admission_id)
left join patient d using(patient_id) 
;


select b.start_date
		,string_agg(a.room_type,',')
		,string_agg(a.room_number::char,',')
		,string_agg(d.first_name||' '||d.last_name,',')
from room a
left join room_admit b using(room_id)
left join patient_admission c using(admission_id)
left join patient d using(patient_id) as patient_name
group by b.start_date
;

---------------------------------------------------------------------------------------------------
-- Gauge - In Patient VS Out Patient
-- SQL Query: Count the total number of in patient and out patient admits.
-- Display: Total patient count.
select admit_type
		,count(*)
from patient_admission
group by admit_type
;

---------------------------------------------------------------------------------------------------