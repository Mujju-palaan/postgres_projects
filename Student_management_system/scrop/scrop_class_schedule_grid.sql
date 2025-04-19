-- Stored Procedure for Class Schedule Grid

-- Develop a stored procedure that takes a class ID, teacher ID, room ID, start date, end date, start time, and end time as input parameters. 
--The procedure should insert the provided details into the class schedule table while ensuring that no two classes are scheduled at overlapping times. 
--Furthermore, it must enforce a rule that a room assigned to a specific department can only host classes for courses belonging to the same department..
-- select * from class_schedule;

create or replace procedure scrop_class_schedule_grid(
 	IN iparam_class_id int
	,IN iparam_teacher_id int
	,IN iparam_room_id int
	,IN iparam_start_date date
	,IN iparam_end_date date
	,IN iparam_start_time time
	,IN iparam_end_time time
)
AS $$

DECLARE d_start_time time;
		d_end_time time;
BEGIN
	---temp table (drop table class_scheduled;)
	create temp table IF NOT EXISTS class_scheduled(
		class_id int
		,teacher_id int
		,room_id int
		,start_date date
		,end_date date
		,start_time time
		,end_time time
	);
	
	---select
	select start_time, end_time
	from class_scheduled
	into d_start_time, d_end_time
	where class_id = iparam_class_id
	;

	IF iparam_start_time < d_end_time
	   AND iparam_end_time > d_start_time
	THEN
	    RAISE EXCEPTION 'Class is already booked for this time';
	END IF;

	-- IF iparam_start_time between d_start_time and d_end_time OR iparam_start_time =  d_start_time 
	-- 	AND iparam_end_time between d_start_time and d_end_time 
	-- THEN
 --        RAISE EXCEPTION 'Class is already booked for this time';
 --    END IF;
	
	-- IF iparam_start_time > d_end_time AND iparam_end_time < d_start_time
	-- THEN
 --        RAISE EXCEPTION 'Class is already booked for this time';
 --    END IF;

	-- IF d_start_time + (d_end_time - d_start_time) - '00:10' = iparam_start_time THEN
 --        RAISE EXCEPTION 'Class is already booked for this time';
 --    END IF;
	
	---insert
	insert into class_scheduled(class_id, teacher_id, room_id, start_date, end_date, start_time, end_time)
	values(iparam_class_id, iparam_teacher_id, iparam_room_id, iparam_start_date, iparam_end_date, iparam_start_time, iparam_end_time)
	;
	
END;
$$ language plpgsql;

call scrop_class_schedule_grid(1, 1, 1, '2022-2-22', '2022-3-22','06:00:00','07:00:00');

select * from class_scheduled;