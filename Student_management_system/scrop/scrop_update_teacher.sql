-- Stored Procedure for Teacher Management

-- Write a stored procedure to update data in TEACHER table
-- select * from TEACHER;

create or replace procedure scrop_update_teacher(
	IN iparam_teacher_id int
	,IN iparam_email varchar
)
AS $$

BEGIN
	----update
	update TEACHER
	set email = iparam_email
	where teacher_id = iparam_teacher_id
	;
	
END;
$$ language plpgsql;

-- call scrop_update_teacher(1, 'alice@teacher.com');