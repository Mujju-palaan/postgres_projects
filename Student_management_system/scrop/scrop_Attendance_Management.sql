-- Stored Procedure for Attendance Management

-- Write a stored procedure to insert data into attendance table, make sure not to enter absence records for holidays defined in date dim table.

select * from attendance;

create or replace procedure scrop_Attendance_Management(
	IN iparam_
)
AS $$
DECLARE 
BEGIN 
	--temp
	create temp table if not exists temp_Attendance_Management(
		Attendane_id int
		,attendance_date date
		,student_id int
		,course_id int
		,absence_flage boolean
	);

	----insert
	insert into temp_Attendance_Management(Attendane_id, student_id, course_id, attendance_date, absence_flage)
	select a.Attendane_id, a.student_id, a.course_id, b.calander_date, a.absence_flage
	from attendance a
	inner join date_dim b ON a.attendance_date = b.calender_date
	;

END;
$$ language plpgsql;

select * from date_dim;




















