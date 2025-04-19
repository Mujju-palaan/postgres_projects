-- Stored Procedure for Exam Schedule

-- Create a stored procedure that accepts an exam ID, exam date, maximum marks, room ID, and course ID as input parameters.
--The procedure should insert the provided details into the exam schedule table, ensuring that no two exams are scheduled at the same date and time. 
--Additionally, it must enforce a rule that no two exams for different courses can occur on the same day.
select * from exam_schedule;

create or replace procedure scrop_exam_schedule(
	IN iparam_
	,IN iparam_
	,IN iparam_
	,IN iparam_
	,IN iparam_
)