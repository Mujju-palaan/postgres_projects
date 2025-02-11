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
