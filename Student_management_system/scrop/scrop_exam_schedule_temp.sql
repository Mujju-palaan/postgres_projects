-- Stored Procedure for Exam Schedule

-- Create a stored procedure that accepts an exam ID, exam date, maximum marks, room ID, and course ID as input parameters.
--The procedure should insert the provided details into the exam schedule table, ensuring that no two exams are scheduled at the same date and time. 
--Additionally, it must enforce a rule that no two exams for different courses can occur on the same day.
-- select * from exam_schedule;

create or replace procedure scrop_exam_schedule(
	IN iparam_exam_date date
	,IN iparam_exam_id int
	,IN iparam_semester_id int
	,IN iparam_course_id int
	,IN iparam_classroom_id int
	,IN iparam_total_marks int
	,IN iparam_start_time time
	,IN iparam_end_time time
)

AS $$

DECLARE d_exam_date date;
		d_start_time time;
		d_end_time time;
		d_course_id int;
BEGIN
	--ensuring that no two exams are scheduled at the same date and time. 
	 FOR d_exam_date, d_start_time, d_end_time
	 IN
        SELECT exam_date, start_time, end_time 
		FROM exam_schedule
	LOOP
	END LOOP;
	
	IF iparam_exam_date = d_exam_date
	AND iparam_start_time < d_end_time
   	AND iparam_end_time > d_start_time
	Then 
		RAISE EXCEPTION 'We have a onging Exam at this date';
	END IF;

	--- no two exams for different courses can occur on the same day.
	select course_id 
	into d_course_id
	FROM exam_schedule
	where exam_date = iparam_exam_date;

	IF d_course_id <> iparam_course_id
	THEN 
		RAISE EXCEPTION 'no two exams for different courses can occur on the same day';
	END IF;
	
	--insert
	insert into exam_schedule(exam_date, exam_id, semester_id, course_id, classroom_id, total_marks, start_time, end_time)
	values(iparam_exam_date, iparam_exam_id, iparam_semester_id, iparam_course_id, iparam_classroom_id, 
	iparam_total_marks, iparam_start_time, iparam_end_time)
	;
	
END;
$$ language plpgsql;

-- call scrop_exam_schedule('2026-10-30', 20, 20, 19, 19, 100, '19:00:00','21:00:00');

-- select * from exam_schedule;