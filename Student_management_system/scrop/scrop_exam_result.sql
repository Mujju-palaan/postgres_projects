-- Stored Procedure for Exam Result

-- Create a stored procedure to insert data into the EXAM_RESULT and EXAM_RESULT_MASTER tables. Additionally, 
-- the procedure should update the grade in the ENROLLMENT table..


create or replace procedure scrop_exam_result(
	--- EXAM_RESULT
	IN iparam_exam_schedule_id int
	-- IN iparam_student_id
	-- ,IN iparam_grade_id
	--- EXAM_RESULT_MASTER
	,IN iparam_exam_id int
	,IN iparam_student_id int
	,IN iparam_grade_id int
	,IN iparam_semester_id int
)
AS $$

BEGIN
	--insert into EXAM_RESULT
	insert into EXAM_RESULT(exam_schedule_id, student_id, grade_id)
	values(iparam_exam_schedule_id, iparam_student_id, iparam_grade_id);
	

	--insert into EXAM_RESULT_MASTER
	insert into EXAM_RESULT_MASTER(exam_id, student_id, grade_id, semester_id)
	values(iparam_exam_id, iparam_student_id, iparam_grade_id, iparam_semester_id);

	--update the grade in the ENROLLMENT table
	update ENROLLMENT
	set grade_id = iparam_grade_id
	-- AND semester_id = iparam_semester_id
	where student_id = iparam_student_id;
	
END;
$$ language plpgsql;

-- call scrop_exam_result(3, 4, 2, 5, 6);

-- select * from EXAM_RESULT;
-- select * from EXAM_RESULT_MASTER;
-- select * from ENROLLMENT;