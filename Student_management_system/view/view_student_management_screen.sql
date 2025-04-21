-- View for Student Management Screen

-- Create a view that shows student details, including student names, age, semester name, courses enrolled, total fees and due amount.

create or replace view view_student_management_screen AS
select b.student_id
		,b.first_name||' '||b.last_name as student_name
		,EXTRACT(YEAR FROM age(current_date, b.date_of_birth))::INT as age
		,c.semester_name
		,count(a.course_id)
		,d.fee_amount
		,e.balance_amount
from enrollment a
join student b using(student_id)
join semester c ON a.semester_id = c.semester_id
join fee_structure d ON a.course_id = d.course_id
join fee_payment e ON a.student_id = e.student_id
group by b.student_id, c.semester_name, d.fee_amount, e.balance_amount
;

select * from view_student_management_screen;


select * from enrollment
select * from semester
select * from student
select * from fee_structure
select * from fee_payment
SELECT EXTRACT(YEAR FROM age(current_date, date_of_birth))::INT AS age_years
from student;


