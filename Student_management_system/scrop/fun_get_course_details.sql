-- Stored Procedure for Course Management

-- Write a stored procedure to select data from COURSE table.
select * from course;

create or replace function fun_get_course_details
(iparam_course_id int)
returns table(
	iparam_cid int
	,iparam_course_name varchar
	,department_id int
	,credits int
	,created_date date
)

AS $$
BEGIN
	----get
	return query
	select * from course where course_id = iparam_course_id;
	
END;
$$ language plpgsql;

-- select * from fun_get_course_details(1);

