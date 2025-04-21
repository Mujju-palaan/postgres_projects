-- View for Fee Management Screen

-- Create a view that shows student details, including student names, semester name, total fees, paid amount and due amount.

create or replace view view_Fee_management_screen AS
select 
	b.student_id
	,b.first_name||' '||b.last_name as student_name
	,c.semester_name
	,d.fee_amount
	,e.amount_paid as paid_amount
	,e.balance_amount as due_amount
from enrollment a
join student b using(student_id)
join semester c using(semester_id)
join fee_structure d using(course_id)
join fee_payment e ON b.student_id = e.student_id
;

-- select * from view_Fee_management_screen

-- select * from enrollment
-- select * from fee_structure
-- select * from fee_payment















