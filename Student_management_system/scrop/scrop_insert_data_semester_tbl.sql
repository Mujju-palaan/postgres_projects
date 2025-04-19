-- Stored Procedure for Semester Management

-- Write a stored procedure to insert data into SEMESTER table.
-- select * from SEMESTER;

create or replace procedure scrop_insert_data_semester_tbl(
	IN iparam_semester_name varchar
	,IN iparam_start_date date
	,IN iparam_end_date date
	,IN iparam_enrollment_status varchar
)
AS $$

BEGIN
	--insert data
	insert into SEMESTER(semester_name, start_date, end_date, enrollment_status)
	values (iparam_semester_name, iparam_start_date, iparam_end_date, iparam_enrollment_status);
	
END;
$$ language plpgsql;

---------
-- CALL public.scrop_insert_data_semester_tbl(
-- 	'Final exams',	--<IN iparam_semester_name character varying>,
-- 	'2025-04-11',	--<IN iparam_start_date  date>,
-- 	'2025-04-30',	--<IN iparam_end_date  date>,
-- 	'open'	--<IN iparam_enrollment_status  character>
-- );