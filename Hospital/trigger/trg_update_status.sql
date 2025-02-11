--Trigger Task:
--Trigger on Appointment Status Change
---Create a trigger on the APPOINTMENT table that logs changes to the status field into the AUDIT_LOG table. 
--Capture the appointment_id, old_status, new_status, log_date, and user_id.
select * from appointment_log;

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