---hospital_db
--Question 1: Create the DEPARTMENT Table with a Foreign Key
create table department (
	department_id int GENERATED ALWAYS AS IDENTITY primary key,
	department_name varchar(255) unique not null,
	location varchar(255) not null
);

--Question 2: Create the DOCTOR Table with Constraints
create table doctor(
	doctor_id int GENERATED ALWAYS AS IDENTITY primary key,
	first_name varchar(255) not null,
	last_name varchar(255) not null,
	specialization varchar(255) unique not null,
	email varchar(50) unique not null,
	phone_number bigint unique not null,
	per_visit_cost numeric(10,2) not null,
	active boolean not null,
	login_id varchar(50) unique not null,
	created_date date default current_date
);

--Question 3: Define the DOCTOR_DEPARTMENT Table
create table DOCTOR_DEPARTMENT(
	doctor_id int,
	department_id int,
	foreign key(doctor_id) references doctor(doctor_id),
	foreign key(department_id) references department(department_id)
);

--Question 4: Create the NURSE Table
create table nurse(
	nurse_id int GENERATED ALWAYS AS IDENTITY primary key,
	first_name varchar(255) not null,
	last_name varchar(255) not null,
	date_of_birth date check (date_of_birth < current_date) not null,
	email varchar(50) unique not null,
	phone_number varchar(20) unique not null,
	hire_date date default current_date not null,
	active boolean,
	login_id varchar(50) not null, ---email,login_id,username
	created_at date default current_date
);
--Question 5: Define the ROOM Table with Relationships
create table ROOM(
	room_id int GENERATED ALWAYS AS IDENTITY primary key,
	room_number int unique not null,
	room_type varchar(20) check (room_type in ('General', 'ICU', 'Private'))  not null,
	daily_rate numeric(10,2) not null,
	department_id int,
	foreign key (department_id) references department(department_id)
);

--Question 6: Create the PATIENT Table
create table patient(
	patient_id int GENERATED ALWAYS AS IDENTITY primary key,
	first_name varchar(255) not null,
	last_name varchar(255) not null,
	date_of_birth date check (date_of_birth < current_date) not null,
	email varchar(50) not null,
	phone_number bigint unique not null,
	created_date date default current_date
);
--Question 7: Create the PATIENT_ADMISSION Table
create table PATIENT_ADMISSION(
	admission_id int generated always as identity primary key,
	admit_type varchar(50) check(admit_type in ('In Patient','Out Patient')) not null,
	treatment_description varchar(255) not null,
	treatment_start_date date default current_date,
	treatment_end_date date,
	patient_id int,
	created_date date default current_date,
	foreign key (patient_id) references patient(patient_id)
);

--Question 8: Create the APPOINTMENT Table
create table appointment(
	appointment_id int GENERATED ALWAYS AS IDENTITY primary key,
	appointment_date date default current_date,
	appointment_time time not null,
	status varchar(20) check (status in ('Scheduled','Completed','Cancelled')) not null,
	patient_id int,
	doctor_id int,
	room_id int,
	incharge_nurse_id int,
	admission_id int,
	created_date date default current_date,
	foreign key (patient_id) references patient(patient_id),
	foreign key (doctor_id) references doctor(doctor_id),
	foreign key (room_id) references room(room_id),
	foreign key (incharge_nurse_id) references nurse(nurse_id),
	foreign key (admission_id) references PATIENT_ADMISSION(admission_id)
);

--Question 9: Create the ROOM_ADMIT Table
create table ROOM_ADMIT(
	admit_id int generated always as identity PRIMARY KEY,
	start_date date default current_date not null,
	end_date date default current_date not null,
	room_id int,
	incharge_nurse_id int,
	admission_id int,
	created_date date default current_date,
	foreign key(room_id) references room(room_id),
	foreign key(incharge_nurse_id) references nurse(nurse_id),
	foreign key(admission_id) references PATIENT_ADMISSION(admission_id)
);
--Question 10: Create the MEDICATION Table
create table MEDICATION(
	medication_id int GENERATED ALWAYS AS IDENTITY primary key,
	medication_name varchar(255) unique not null,
	medication_type varchar(100) not null,
	dosage varchar(255) not null,
	created_date date default current_date not null
);
--Question 11: Create the PRESCRIPTION Table
create table PRESCRIPTION(
	prescription_id int GENERATED ALWAYS AS IDENTITY primary key,
	prescription_date date default current_date not null,
	medication_id int,
	patient_id int,
	doctor_id int,
	start_date date default current_date not null,
	end_date date default current_date not null,
	morning_flag boolean not null,
	noon_flag boolean not null,
	evening_flag boolean not null,
	admission_id int,
	created_date date default current_date not null,
	foreign key (medication_id) references medication(medication_id),
	foreign key (patient_id) references patient(patient_id),
	foreign key (doctor_id) references doctor(doctor_id),
	foreign key (admission_id) references PATIENT_ADMISSION(admission_id)
);

--Question 12: Create the BILLING Table with Constraints
create table billing(
	billing_id int GENERATED ALWAYS AS IDENTITY primary key,
	bill_date date default current_date not null,
	bill_type varchar(20) check(bill_type in ('Doctor Appointment','Medicine','Room Charge','Diagnostic','Food','Miscellaneous')) not null,
	description text not null,
	total_amount numeric(10,2) check(total_amount > 0) not null,
	balance_amount numeric(10,2) not null,
	admission_id int,
	created_date date default current_date not null,
	foreign key (admission_id) references PATIENT_ADMISSION(admission_id)
);
--Question 13: Create the PAYMENT Table with Constraints
create table payment(
	payment_id int generated always as identity PRIMARY KEY,
	bill_id int,
	patient_id int,
	amount_paid numeric(10,2) check(amount_paid > 0) not null,
	payment_date date default current_date not null,
	foreign key(bill_id) references BILLING(billing_id),
	foreign key(patient_id) references patient(patient_id)
); 

--Question 14: Create the USER_LOGIN Table
create table USER_LOGIN(
	user_id int generated always as identity PRIMARY KEY,
	login_id varchar(255) unique not null,
	password text not null,
	active_flag boolean not null,
	last_login_datetime timestamp default current_timestamp,
	active boolean not null,
	created_date date default current_date not null
);

--Question 15: Create the AUDIT_LOG Table
CREATE TABLE audit_log(
	log_id int GENERATED ALWAYS AS IDENTITY primary key,
	log_date date default current_date,
	action text not null,
	user_id int,
	foreign key (user_id) references doctor(doctor_id)
);


--Question 16: Add a Column to the DOCTOR Table
--Write a SQL statement to add a phone_number column of type VARCHAR(15) to the DOCTOR table.
--select * from doctor;
alter table doctor add column phone_numberr varchar(15) unique;

alter table doctor drop column phone_numberr;

--Question 17: Alter a Column in the PATIENT Table
--Write a SQL statement to alter the email column in the PATIENT table, increasing its length to 300 characters.
--select * from PATIENT;
alter table PATIENT alter column email type varchar(300);

--Question 18: Drop a Column from the USER_LOGIN Table
--Write a SQL statement to drop the active column from the USER_LOGIN table.
alter table USER_LOGIN drop column active;

--Question 19: Rename the USER_LOGIN Table
--Write a SQL statement to rename the USER_LOGIN table to USER.
alter table USER_LOGIN rename to USERS;

alter table USERS rename to USER_LOGIN;

--Question 20: Drop the USER Table
--Write a SQL statement to drop the USER table.
--drop table USERS;

--Question 21: Add a Primary Key
--Set up a composite primary key using doctor_id and department_id on DOCTOR_DEPARTMENT table.
--select * from DOCTOR_DEPARTMENT
alter table DOCTOR_DEPARTMENT
add constraint pk_ddh primary key(doctor_id,department_id);

--Question 22: Add a Foreign Key to the PRESCRIPTION Table
--Add a foreign key in the PRESCRIPTION table to reference the DOCTOR table.
alter table PRESCRIPTION 
add constraint fk_doc foreign key (doctor_id) references doctor(doctor_id);

--Question 23: Add a CHECK Constraint on the TREATMENT Table
--Write a SQL statement to add a CHECK constraint to the TREATMENT table ensuring that the treatment_date is not in the future.

--Question 24: Add a UNIQUE Constraint on the DEPARTMENT Table
--Write a SQL statement to add a UNIQUE constraint to the DEPARTMENT table ensuring that the department_name is not repeated.
alter table DEPARTMENT
add constraint unique_dep_name unique(department_name);

--Question 25: Add a DEFAULT Constraint on the AUDIT_LOG Table
--Write a SQL statement to add a DEFAULT constraint to the AUDIT_LOG table to set the default value of log_date to system date.
alter table AUDIT_LOG alter column log_date
set default current_date;

--Question 26: Add Indexes to the PATIENT and DOCTOR Tables
--Write SQL statements to:
--Add an index on the last_name column in the PATIENT table.
--Add an index on the specialization column in the DOCTOR table.
create index idx_patient_last_name on patient(last_name);

create index idx_doc_specialization on DOCTOR(specialization);

--Question 27: Drop an Index from the DOCTOR Table
--Write a SQL statement to drop the index on the specialization column in the DOCTOR table.
drop index idx_doc_specialization;

--Question 28: Enforce UNIQUE constraints on all applicable tables.
--Apply UNIQUE constraints to columns across the entire database wherever duplicate data is not permitted.
--done

--GOOD LUCK WITH YOUR ASSIGNMENT!!!
--Don't forget to contact us if you need any further assistance with your assignments, and most importantly, for a manual review and approval of your work.




