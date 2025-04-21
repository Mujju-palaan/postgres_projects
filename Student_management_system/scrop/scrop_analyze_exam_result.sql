-- Stored Procedure for Analyse exam Results

-- Create a stored procedure to analyze exam results. The procedure should include data points such as
-- exam name, course name, exam date, maximum marks, average marks across all students, 
-- the number of students who appeared, the count of students who passed, and the count of students who failed. 
-- The data should be retrieved for a specific semester ID provided as an input parameter.

create or replace procedure scrop_analyze_exam_result(
	IN iparam_semester_id int
)
AS $$
DECLARE d_avg_marks numeric;
		d_student_count int;
		d_passed_count int;
		d_failed_count int;
		
BEGIN
	--temp 
	create temp table if not exists temp_analyze_exam_result(
		Exam_name varchar
		,course_name varchar
		,exam_date date
		,maximum_marks numeric(10,2)
		,avg_marks numeric(10,2)
		,no_of_students int
		,passed_count int
		,failed_count int
	);

	--------------------------------------
	select total_marks
	into d_avg_marks
	from exam_schedule
	where semester_id = iparam_semester_id
	;

	select count(student_id)
	into d_student_count
	from enrollment
	where semester_id = iparam_semester_id;

	select count(*) 
	into d_passed_count
	from grade
	join enrollment using(grade_id)
	where grade_letter < 'D'
	AND semester_id = iparam_semester_id
	;

	select count(*) 
	into d_failed_count
	from grade
	join enrollment using(grade_id)
	where grade_letter > 'D'
	AND semester_id = iparam_semester_id
	;
	
	---insert
	insert into temp_analyze_exam_result(Exam_name, course_name, exam_date, maximum_marks, avg_marks, no_of_students, passed_count, failed_count)
	select 
		b.exam_name, c.course_name, a.exam_date, a.total_marks, (d_avg_marks * 35/100), d_student_count ,d_passed_count, d_failed_count
	from exam_schedule a
	join exam b using(exam_id)
	join course c ON a.course_id = c.course_id
	-- join enrollment d ON c.course_id = d.course_id
	where a.semester_id = iparam_semester_id
	;
		
END;
$$ language plpgsql;

-- call scrop_analyze_exam_result(2);

-- select * from temp_analyze_exam_result;

-- select * from exam_schedule;
-- select * from enrollment;