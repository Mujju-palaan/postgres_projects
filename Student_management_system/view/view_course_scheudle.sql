-- View for Course Scheudle Details

-- Write a view that displays all teacher-course assignments, including the teacher’s full name, course name, department name, 
--class scheduled date for the Course Schedule screen. You will have to JOIN with date dim table. 
--Include calendar dates even when no classes are assigned to a specific teacher.

create or replace view view_course_scheudle AS
select 
	b.first_name||' '||b.last_name as teacher_name
	,c.course_name
	,d.department_name
	,e.start_date
	,e.end_date
	,f.calendar_date
from enrollment a
join course c ON a.course_id = c.course_id
join department d using(department_id)
join teacher b ON b.department_id = d.department_id
join class_schedule e ON a.course_id = e.course_id
right join date_dim f ON e.start_date = f.calendar_date
;

-- select * from view_course_scheudle;

-- select * from enrollment
-- select * from department
-- select * from class_schedule
-- select * from teacher
-- select * from course
-- select * from date_dim