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
