-- Trigger Task:
-- Trigger for Enrollment Grade Changes
-- Create a trigger on the ENROLLMENT table that logs any changes made to the grade field into the AUDIT_LOG table. 
--Each change should include the date, the action performed, old grade, new grade, and the teacher_id who made the change.

-- select * from grade_log;
-- drop table grade_log
create table grade_log(
	log_id int generated always as identity primary key
	,log_date timestamp default current_timestamp
	,grade_id int
	,old_grade char not null
	,new_grade char not null
	,foreign key(grade_id) references grade(grade_id)
);

----fun
create or replace function trg_fun_grade_changes()
returns trigger
as $$

BEGIN
	
	IF OLD.grade_letter is distinct from NEW.grade_letter
	THEN
	insert into grade_log( grade_id, old_grade, new_grade)
	values(OLD.grade_id, OLD.grade_letter, NEW.grade_letter);
	END IF;
	return NEW;
	
END;
$$ language plpgsql;

-----trigger
create or replace trigger trg_grade_changes
after update on grade 
for each row
WHEN(OLD.grade_letter is distinct from NEW.grade_letter)
EXECUTE function  trg_fun_grade_changes();

-----update (select * from grade)
update grade
set grade_letter = 'F'
where grade_id = 11
;


select * from teacher
select * from AUDIT_LOG;