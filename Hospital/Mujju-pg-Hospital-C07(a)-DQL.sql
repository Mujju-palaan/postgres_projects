--Chapter 7 - DQL (Data Query Language)
--DQL ASSIGNMENT2 - Hospital Management System

-- 1. SELECT Command
-- Select all columns from the PATIENT table.
select * from patient;

-- Select the first_name, last_name, and email of all patients.
select first_name, last_name,  email from patient;

-- Select all specialization from the DOCTOR table.
select specialization from doctor;

-- Select the appointment_date and status from the APPOINTMENT table.
select appointment_date, status from APPOINTMENT;

-- 2. WHERE Command
-- Select all patients where date_of_birth is before '1990-01-01'.
select * from patient where date_of_birth < '1990-01-01';

-- Select all doctors whose specialization is 'Cardiology'.
select * from doctor where specialization = 'Cardiology';

-- Select all appointments where status is 'Scheduled'.
select * from appointment where status = 'Scheduled';

-- Select all patient admits where treatment_start_date is after '2022-01-01'.
-- select first_name||' '||last_name as name, treatment_date from treatment a
-- inner join patient b using(patient_id)
-- where treatment_date > '2022-01-01';


-- 3. ORDER BY Command
-- Select all patients and order them by last_name in ascending order.
select * from patient order by last_name asc; 

-- Select all doctors and order them by first_name in descending order.
select * from patient order by first_name desc; 

-- Select all appointments and order them by appointment_date in descending order.
select * from appointment order by appointment_date;

-- Select all medications and order them by medication_name in ascending order.
select * from medication order by medication_name asc;

-- 4. LIMIT Command
-- Select the first 10 patients from the PATIENT table.
select * from patient limit 10;

-- Select the first 5 doctors from the DOCTOR table.
select * from doctor limit 5;

-- Select the top 3 appointments ordered by appointment_date.
select * from appointment limit 3 ;

-- Select the first 5 prescriptions from the PRESCRIPTION table.
select * from prescription limit 5;

-- 5. DISTINCT Command
-- Select distinct specialization from the DOCTOR table.
select distinct specialization from DOCTOR; 
-- Select distinct status from the APPOINTMENT table.
select distinct status from APPOINTMENT; 
-- Select distinct department_name from the DEPARTMENT table.
select distinct department_name from DEPARTMENT; 
-- Select distinct last_name from the PATIENT table.
select distinct last_name from PATIENT; 

-- 6. GROUP BY Command
-- Group by specialization from the DOCTOR table and count the number of doctors per specialization.
select specialization, count(*) from doctor
group by specialization;

-- Group by status in the APPOINTMENT table and count the number of appointments per status.
select status, count(*) from appointment
group by status;

-- Group by department_name from the ROOM table and calculate the number of rooms in each type.
select department_name, count(*) from room a
inner join department b using(department_id)
group by department_name;

-- Group by medication_type in the MEDICATION table and calculate the total number of medications per type.
select medication_type, count(*) from MEDICATION
group by medication_type;

-- 7. HAVING Command
-- Select specialization from the DOCTOR table and group by it, having more than 2 doctors per specialization.
select specialization, count(*) as doc_count from DOCTOR
group by specialization
having count(*) >=2;

-- Group by department_name and calculate the number of doctors in each department, having more than 3 doctors.
select a.department_name, count(c.doctor_id) from department a
inner join doctor_department b using(department_id)
inner join doctor c using(doctor_id)
group by a.department_name
having count(c.doctor_id)> 1;

-- Group by status in the APPOINTMENT table and filter the groups having more than 5 appointments.
select status, count(*) from APPOINTMENT
group by status
having count(*) > 5;

-- Group by medication_type and calculate the total medications, having more than 3 medications per type.
select medication_type, count(*) from medication
group by medication_type
having  count(*) > 1;

-- 8. INNER JOIN Command
-- Select all patients and their corresponding appointments using INNER JOIN between PATIENT and APPOINTMENT.
select first_name||' '||last_name as Name, email, phone_number, appointment_date, appointment_time from PATIENT a
inner join APPOINTMENT b using(patient_id);

-- Select all treatments along with the corresponding doctor details using INNER JOIN between PATIENT_ADMIT and DOCTOR.

-- Select all prescriptions along with the corresponding medication details using INNER JOIN between PRESCRIPTION and MEDICATION.
select prescription_date, medication_name, dosage, morning_flag, noon_flag, evening_flag  from prescription a
inner join medication b using(medication_id);

-- Select all doctors and the departments they belong to using INNER JOIN between DOCTOR and DOCTOR_DEPARTMENT.
select first_name||' '||last_name as Doctor_name, department_name FROM doctor a
inner join doctor_department b using(doctor_id)
inner join department c using(department_id);

-- 9. LEFT JOIN Command
-- Select all doctors and their corresponding departments using LEFT JOIN, including doctors without any departments.
select first_name||' '||last_name as Doctor_name, c.department_name from doctor
left join  doctor_department b using(doctor_id)
left join department c using(department_id);

-- Select all patients and their appointments using LEFT JOIN, including patients without appointments.
select a.first_name||' '||a.last_name as patient_name, b.appointment_date from patient a
left join appointment b using(patient_id);

-- Select all nurses and their assingned rooms using LEFT JOIN, including nurses without assigned rooms.
select first_name||' '||last_name as nurse_name, room_number from nurse a
left join room_admit b ON a.nurse_id=b.incharge_nurse_id
left join room c using(room_id);

-- Select all medication and the corresponding prescriptions using LEFT JOIN, including medication without prescriptions.

-- 10. COUNT, SUM, AVG Command
-- Count the total number of patients in the PATIENT table.
select count(*) from patient;
-- Count the number of distinct specialization in the DOCTOR table.
select count(*) distinct from doctor;
-- Calculate the sum of total_amount in the BILLING table.
select sum(total_amount) from billing;
-- Calculate the average dosage for medications in the MEDICATION table.
-- select medication_name, avg(dosage) from MEDICATION
-- group by medication_name;

-- 11. CASE Command
-- Select all appointments and use a CASE statement to show 'Upcoming' 
--if the appointment_date is after the current date, and 'Past' otherwise.
select appointment_id, appointment_date, appointment_time, 
	case 
		when appointment_date > current_date then 'Upcoming'
		else 'Past'
	end as appointment_date
from appointment;

-- Select all patients and categorize them as 'Senior' if their date_of_birth is before '1950-01-01', otherwise 'Adult'.
select first_name||' '||last_name as patients_name,
	case
		when date_of_birth < '1950-01-01' then 'Senior'
		else 'Adult'
	end as date_of_birth
from patient;

-- Use a CASE statement to categorize patient admits as 'Recent' if the treatment_start_date is within the last year, otherwise 'Old'.
select first_name||' '||last_name as patient_name,
	case
		when treatment_start_date = current_date - interval '1 year' then 'Recent'
		else 'Old'
	end as treatment_start_date
from patient a
inner join  patient_admission b using(patient_id);

-- Use a CASE statement in the APPOINTMENT table to label appointments as 'Critical' if the patient has undergone multiple doctor visits.
select first_name||' '||last_name as Patient_name,
	case
		when (select count(*) from appointment where patient_id=b.patient_id) >= 2
		then 'Critical'
		else 'Normal'
	end as Patient_status
from appointment a
inner join patient b using(patient_id);

-- 12. EXISTS and NOT EXISTS Command
-- Select all patients where an appointment exists in the APPOINTMENT table using EXISTS
select * FROM  patient a 
	where EXISTS (SELECT * FROM APPOINTMENT b
					where a.patient_id=b.patient_id
					)
order by patient_id;

-- Select all doctors where no appointments exist in the APPOINTMENT table using NOT EXISTS.
select * from doctor a
	where not exists (select * from APPOINTMENT b
					where a.doctor_id = b.doctor_id
					)
order by doctor_id;

-- 13. SUBQUERY Command
-- Select all doctors whose doctor_id is in the result of a subquery selecting doctor_id
--from the APPOINTMENT table where status is 'Scheduled'.
select * from doctor
	where doctor_id in (select doctor_id from APPOINTMENT
						where status = 'Scheduled')
order by doctor_id;		

-- Select all medications where the medication_id is in the result of a subquery selecting medication_id from the PRESCRIPTION table.
select * from medication
where medication_id in (select medication_id from PRESCRIPTION)
order by medication_id;

-- Select all patients who have not scheduled an appointment using a subquery.
select * from patient
where patient_id not in (select patient_id from appointment)
order by patient_id;

-- Select all patient admits where the patient has been admitted more than once using a subquery.
select * from patient_admission
where patient_id in (select patient_id from patient_admission
						group by patient_id
						having count(admission_id) > 1)
;

-- 14. RANK and DENSE_RANK Command
-- Rank patients based on the number of appointments using RANK().
select patient_id,
		count(appointment_id),
		rank() over (order by count(appointment_id)) as rank
from appointment
group by patient_id
order by 3,2,1;

-- Use DENSE_RANK() to rank doctors based on their specialization.
select first_name||' '||last_name as doctor_name,
		specialization,
		DENSE_RANK() over(order by specialization)
from doctor;

-- Rank medications by their dosage using RANK().
select medication_name,
		dosage,
		rank() over (order by dosage)
from medication;

-- Use DENSE_RANK() to rank treatments by treatment_date.
select appointment_date,
		DENSE_RANK() over( order by appointment_date)
		from appointment
;

-- 15. PIVOT and UNPIVOT
-- Pivot the APPOINTMENT data by status and patient_id.
-- Unpivot the treatment details to show the treatment_description and doctor_id in a single row per patient.
-- Pivot the room data grouped by room_type and daily_rate.
-- Unpivot medication data by medication_name and dosage.

-- 16. UNION and UNION ALL Command
-- Select all doctors from different departments using UNION ALL.
(select doctor_id from doctor a 
inner join doctor_department aa using(doctor_id)
inner join department b ON aa.department_id=b.department_id
where b.department_id = 1

union all

select doctor_id from doctor a 
inner join doctor_department aa using(doctor_id)
inner join department b ON aa.department_id=b.department_id
where b.department_id = 2

union all

select doctor_id from doctor a 
inner join doctor_department aa using(doctor_id)
inner join department b ON aa.department_id=b.department_id
where b.department_id = 3
union all

select doctor_id from doctor a 
inner join doctor_department aa using(doctor_id)
inner join department b ON aa.department_id=b.department_id
where b.department_id = 4

union all

select doctor_id from doctor a 
inner join doctor_department aa using(doctor_id)
inner join department b ON aa.department_id=b.department_id
where b.department_id = 5

union all

select doctor_id from doctor a 
inner join doctor_department aa using(doctor_id)
inner join department b ON aa.department_id=b.department_id
where b.department_id = 6
);

-- Use UNION to combine scheduled and completed appointments.
select status from appointment
where status = 'Scheduled'
union
select status from appointment
where status = 'Completed' 
;
-- Use UNION ALL to select all patient admits from two different years.
(select * from patient_admission 
where extract(year from treatment_start_date) in (select extract( year from current_date))

union all

select * from patient_admission
where extract(year from treatment_start_date) in (select extract( year from current_date - interval '1 year'))
);


-- 17. COALESCE, IFNULL, NULLIF Command
-- Select all patients and use COALESCE to replace null emails with 'No Email'.
select 
	first_name||' '||last_name as patient_name,
	COALESCE(email,'No Email') 
	from patient;
	
-- Use IFNULL to replace null phone_number values in the DOCTOR table.
select 
	first_name||' '||last_name as doctor_name,
	COALESCE(cast(phone_number as varchar),'Not Provided') 
	from doctor;
	
-- Use NULLIF to compare treatment_start_date and appointment_date in the PATIENT_ADMIT table 
--and return NULL if they are the same.
select b.patient_id, a.appointment_date, c.treatment_start_date,
	NULLIF (c.treatment_start_date, a.appointment_date) AS adjusted_treatment_start_date 
	---If treatment_start_date = appointment_date, it returns NULL.
	from appointment a
	inner join patient b using(patient_id)
	inner join patient_admission c ON b.patient_id=c.patient_id
;
-- Select all nurses and replace null hire_date with 'Unknown' using COALESCE.
select nurse_id, coalesce(hire_date::varchar, 'Unknown') from nurse;


-- 18. STRING Functions
-- Select all patients' first_name in uppercase using the UPPER() function.
select upper(first_name) from patient;

-- Select all doctors' specialization in lowercase using the LOWER() function.
select lower(specialization) from doctor;

-- Use CONCAT() to combine the first_name and last_name of doctors.
select concat(first_name,' ', last_name) from doctor;
select first_name||' '||last_name from doctor;

-- Select all patients' last_name and find the length of the name using LENGTH().
select length(last_name) from doctor;

-- 19. DATE Functions
-- Select all patients and show their date_of_birth formatted as 'YYYY-MM-DD' using TO_CHAR().
select to_char(date_of_birth, 'YYYYMMDD') from patient;

-- Add 1 year to all appointment_date values in the APPOINTMENT table using AGE().
--select * from appointment;
update APPOINTMENT set appointment_date = appointment_date + interval '1 year'
where appointment_id = 12
;

-- Subtract 1 month from all treatment_start_date values using INTERVAL.
update APPOINTMENT set appointment_date = appointment_date - interval '1 year'
where appointment_id = 12
;

-- Select all nurses and extract the year from their hire_date using EXTRACT().
select nurse_id, extract(year from hire_date) from nurse;


-- 20. NUMERIC Functions
-- Select the dosage from the MEDICATION table and round it to the nearest integer using ROUND().
select dosage from MEDICATION;
SELECT ROUND( 10.81 );

-- Select all total_amount from the BILLING table and use CEIL() to round up.
select CEIL(total_amount) from billing;

-- Use FLOOR() to round down the total_amount in the BILLING table.
select FLOOR(total_amount) from billing;

-- Select the highest total_amount from the BILLING table using MAX().
select MAX(total_amount) from billing;


-- 21. CAST and CONVERT Command
-- Select all patients and cast the patient_id as a string using CAST().
select patient_id::char from patient;

-- Convert total_amount in the BILLING table to DECIMAL using CONVERT().
select total_amount::decimal from billing;

-- Cast treatment_id in the TREATMENT table to INTEGER.
select admission_id::int from patient_admission;

-- Convert the appointment_date from the APPOINTMENT table into TEXT.
select appointment_date::text from appointment;

-- 22. CONCAT and CONCAT_WS Functions
-- Use CONCAT() to join first_name and last_name with a space in between in the DOCTOR table.
select first_name||' '||last_name from doctor;

-- Use CONCAT_WS() to combine the department_name and location with a comma in the DEPARTMENT table.
select CONCAT_WS(' , ',department_name,location) from DEPARTMENT;

-- Use CONCAT() to combine the room_number and room_type from the ROOM table.
select room_number||' '||room_type from room;

-- Use CONCAT_WS() to combine first_name, last_name, and email from the PATIENT table.
select CONCAT_WS(' , ',first_name,last_name,email) from patient;

-- 23. LIKE and NOT LIKE
-- Select patients whose email ends with 'hospital.com' using LIKE.
select email from patient
where email LIKE '%hospital.com'

-- Select doctors where specialization contains 'Surgery' using LIKE.
select specialization from doctor
where specialization LIKE 'Surgery';

-- Select patients whose last_name does not start with 'J' using NOT LIKE.
select last_name from patient
where last_name NOT LIKE 'J%';

-- Select departments where department_name contains 'Oncology' using LIKE.
select department_name from department
where department_name LIKE 'Oncology';

-- 24. EXISTS and NOT EXISTS
-- Select doctors where appointments exist in the APPOINTMENT table using EXISTS.

-- Select patients where no prescriptions exist using NOT EXISTS.

-- Select rooms where treatments exist using EXISTS.

-- Select departments where no doctors are assigned using NOT EXISTS.

-- 25. JOIN Commands
-- Select all patients and their corresponding appointments using INNER JOIN between the PATIENT and APPOINTMENT tables.
select a.first_name||' '||a.last_name as patient_name, a.phone_number,
		b.appointment_date, b.appointment_time, b.status
from patient a
inner join appointment b using(patient_id)
;

-- Select all prescriptions and their corresponding medications using INNER JOIN between PRESCRIPTION and MEDICATION.
select * 
from prescription a
inner join MEDICATION b using(medication_id)
;

-- Select all nurses and their assigned departments using LEFT JOIN between NURSE and DEPARTMENT.
select * 
from nurse a
inner join appointment b ON a.nurse_id=b.incharge_nurse_id
inner join doctor_department c using(doctor_id)
inner join department d using(department_id)
;

-- Select all treatments and their corresponding doctors using INNER JOIN between TREATMENT and DOCTOR.
select *
from patient_admission
inner join appointment b using(admission_id)
inner join doctor c using(doctor_id)
;

-- 26. BETWEEN Command
-- Select all appointments where the appointment_date is between '2023-01-01' and '2023-12-31'.
select * from appointment
where appointment_date between '2023-01-01' and '2023-12-31';

-- Select all treatments where the treatment_date is between '2022-01-01' and '2022-12-31'.
select * from patient_admission
where treatment_start_date between '2022-01-01' and '2022-12-31';

-- Select all patients where the date_of_birth is between '1960-01-01' and '2000-12-31'.
select * from patient
where date_of_birth between '1960-01-01' and '2000-12-31';

-- Select all rooms where the capacity is between 2 and 10.
					

-- 27. IN and NOT IN Command
-- Select all patients where the patient_id is in (1, 2, 3).
select * from patient
where patient_id in (1, 2, 3);

-- Select all doctors where the specialization is in ('Cardiology', 'Oncology').
select * from doctor 
where specialization in ('Cardiology', 'Oncology');

-- Select all appointments where the status is not in ('Cancelled', 'No Show').
select * from appointment
where status in ('Cancelled', 'No Show');

-- Select all departments where the department_id is in (1, 2, 5).
select * from department
where department_id in (1, 2, 5);

-- 28. UNION Command
-- Select patients from PATIENT and HOSPITAL_PATIENT using UNION.

-- Select doctors from two different departments using UNION.
select * from doctor_department
where department_id = 1

UNION

select * from doctor_department
where department_id = 2;

-- Use UNION to combine appointments from two different years.
select * from appointment
where extract(year from appointment_date) = '2025'

UNION

select * from appointment
where extract(year from appointment_date) = '2026'


-- Use UNION ALL to combine treatments from multiple departments.

-- 29. ARRAY Command
-- Select all specialization and convert it into an array using ARRAY_AGG().
select STRING_AGG(specialization,',')
from doctor;

-- Use UNNEST() to expand arrays from the DEPARTMENT table.


-- Convert patient names into an array using ARRAY_AGG().
select STRING_AGG(first_name||' '||last_name,',') as patient_names_array
from patient;

-- Use ARRAY functions to select and manipulate data from the patient table.


-- GOOD LUCK WITH YOUR ASSIGNMENT!!!
-- Don't forget to contact us if you need any further assistance with your assignments, and most importantly, for a manual review and approval of your work.



