-- Function to Calculate Total Fees per Student

-- Write a function that calculates the total fees a student owes based on the courses they are enrolled for the current semester.

create or replace function fun_total_fee_per_student(iparam_semester_id int)
returns table (
	student_id int
	,student_name varchar
	,semester_id int
	,course_count int
	,total_fees numeric
)

AS $$
DECLARE d_Course_count int;
		d_total_fees numeric;
BEGIN
	----select * from course
	select count(a.course_id)
	into d_Course_count
	from course a
	join enrollment b using(course_id)
	group by b.semester_id, b.student_id
	;
	
	---total fee
	select sum(a.fee_amount) 
	into d_total_fees
	from fee_structure a
	join enrollment b using(course_id) 
	where b.semester_id = iparam_semester_id
	group by b.student_id, b.semester_id, b.course_id
	;
		
	--get
	return query
	select 
		a.student_id
		,(a.first_name||' '||a.last_name)::varchar as student_name
		,aa.semester_id
		,d_Course_count
		,d_total_fees as total_fee
	from enrollment aa
	join student a using(student_id)
	join fee_structure b using(course_id)
	where aa.semester_id = iparam_semester_id
	;
	
END;
$$ language plpgsql;

-- select * from fun_total_fee_per_student(18);

-- select * from enrollment
-- select * from fee_structure