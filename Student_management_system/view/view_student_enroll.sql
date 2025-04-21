-- View for Student Enrollment

-- Create a view to display enrollment information for courses, including the student name, course name and grades achieved.

create or replace view view_student_enroll AS
select 
	first_name||' '||last_name as student_name
	,course_name
	,grade_letter
from enrollment
join student using(student_id)
join course using(course_id)
join grade using(grade_id)
;


-- select * from view_student_enroll;

-- select * from enrollment;
-- select * from grade