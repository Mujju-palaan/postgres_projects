-- Function to Calculate Exam Pass Rate

-- Write a function that calculates the percentage of students who passed a specific exam (grade of 'C' or higher). 
--You need to consider all students from current semester.
drop function fun_calculate_exam_pass_rate;

create or replace function fun_calculate_exam_pass_rate(iparam_semester_id int)
returns table(
	student_id int
	,student_name varchar
	,semester_name varchar
	,garde char(1)
	,percentage numeric(10,2)
)

AS $$
BEGIN
	return query
	----select
	select 
		a.student_id
		,(a.first_name||' '||a.last_name)::varchar as student_name 
		,c.semester_name
		,b.grade_letter
		,end_percent as percentage
	from enrollment aa
	join student a using(student_id)
	join grade b using(grade_id)
	join semester c using(semester_id)
	where b.grade_letter < 'D'
	AND semester_id = iparam_semester_id
	;

END;
$$ language plpgsql;


-- select * from fun_calculate_exam_pass_rate(1);

-- select * from enrollment;
-- select * from grade;