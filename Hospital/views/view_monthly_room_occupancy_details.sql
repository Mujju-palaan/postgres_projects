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
