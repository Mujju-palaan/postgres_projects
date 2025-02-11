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
			
