-- Mujju-pg-Student-Management-C07(b)-DQL

-- 1. Student Overview
-- Metrics:
-- Total number of students.
-- List of students with date of birth and email.
-- Number of students enrolled in each course.

-- SQL Queries:
-- Count total students.
select count(*) from student;

-- Retrieve student names, date of birth, and email.
select 
	first_name ||' '|| last_name as students_name
	,date_of_birth
from student
;

-- Retrieve student count per course (join STUDENT and ENROLLMENT). (select * from STUDENT) (select * from ENROLLMENT)
select 
	student_id
	,course_id
from student a
inner join ENROLLMENT b using(student_id)
;

-- -----------------------------------------------------------------------------------------------------
-- 2. Course Overview
-- Metrics:
-- Total number of courses.
-- Average credits per course by department.
-- Courses with high and low enrollments.

-- SQL Queries:
-- Count total courses.
select count(*) from course;

-- Retrieve average credits per department.  (select * from course)
select 
	department_id
	,avg(credits)
from course
group by department_id
order by department_id
;

-- List courses with high and low student enrollments (join COURSE, ENROLLMENT, and DEPARTMENT).
-- select * from enrollment;
-- select * from COURSE;
-- select * from DEPARTMENT;

select
	b.DEPARTMENT_name
	,a.course_name
	,count(aa.student_id) as students_enrolled
from enrollment aa
inner join COURSE a using(course_id)
inner join DEPARTMENT b using (DEPARTMENT_id)
group by a.course_name, b.DEPARTMENT_name
order by desc a.course_name
;
-- -----------------------------------------------------------------------------------------------------
-- 3. Enrollment Overview
-- Metrics:
-- Number of students enrolled per course.
-- Recent enrollments (within the last 6 months).
-- Students who failed to pass a course (grade < 'D').

-- SQL Queries:
-- Retrieve enrollments per course.
select 
	course_name
	,count(student_id)
from enrollment a
inner join course using(course_id)
group by course_name
order by course_name
;

-- List recent enrollments by checking the enrollment_date.
select 
	enrollment_date
from enrollment
where enrollment_date = current_date
;

-- List students who received failing grades based on the grade in the ENROLLMENT table.
-- select * from ENROLLMENT;
-- select * from grade;

select 
	a.student_id
	,a.first_name||' '||a.last_name as student_name
	,b.grade_letter
from ENROLLMENT aa
inner join student a using(student_id)
inner join grade b using(grade_id)
where b.grade_letter  > 'D'
;
-- -----------------------------------------------------------------------------------------------------
-- 4. Teacher Overview
-- Metrics:
-- Total number of teachers.
-- Teacher-course assignments (how many courses per teacher).
-- Teacher hire dates.

-- SQL Queries:
-- Count total teachers.
select count(teacher_id) from teacher;

-- Retrieve teacher names and the number of courses they teach (join TEACHER and TEACHER_COURSE).
-- select * from TEACHER;
-- select * from TEACHER_COURSE;

select 
	a.first_name||' '||a.last_name as teacher_name
	,count(b.course_id)
from TEACHER a
inner join TEACHER_COURSE b using(TEACHER_id)
group by a.first_name||' '||a.last_name
order by a.first_name||' '||a.last_name
;

-- List teachers hired over time (grouped by month using the hire_date).
select 
	extract( month from hire_date) as months
	,count(teacher_id) as techer_count
from teacher
group by extract( month from hire_date)
order by 1, 2
;

-- -----------------------------------------------------------------------------------------------------
-- 5. Exam Overview
-- Metrics:
-- Number of exams per course.
-- Exams with total marks greater than 100.
-- Exams conducted in the last year.
ALTER TABLE exam
ADD COLUMN course_id INT REFERENCES course(course_id);

-- SQL Queries:
-- Count the number of exams per course (join EXAM and COURSE). (select * from exam) (select * from COURSE)
select
	course_name
	,count(exam_id) as number_of_exams
from course
inner join examm using(course_id)
group by course_name
;

-- Retrieve exams where total marks are greater than 100.
select
	course_name
	,total_marks
from course
inner join examm using(course_id)
where total_marks >= 100
;

-- List all exams conducted in the last year.
select exam_date 
from exam_schedule
where extract(year from exam_date) = (extract(year from current_date) - 1)
;

-- -----------------------------------------------------------------------------------------------------
-- 6. Attendance Overview
-- Metrics:
-- Attendance per course (how many students were present or absent).
-- Students who have more than 5 absences in a course.
-- Overall attendance rate.

-- SQL Queries:
-- Retrieve the number of students marked 'Present' and 'Absent' per course (use the ATTENDANCE table). (select * from ATTENDANCE)
select 
	b.course_name
	,case
		when a.absence_flag = 'true' then count(a.absence_flag)
		end as Present
	,case
		when a.absence_flag = 'false' then count(a.absence_flag)
		end as Absent
from ATTENDANCE a
inner join course b using(course_id)
group by b.course_name,  a.absence_flag
;

-- List students with more than 5 absences in any course.
select 
	first_name||' '||last_name as student_name
	,count(absence_flag) as student_count
from ATTENDANCE a
inner join student b using(student_id)
group by first_name||' '||last_name
having count(absence_flag) > 5
;

-- Calculate the overall attendance rate by dividing total presents by the total attendance records.


-- -----------------------------------------------------------------------------------------------------
-- 7. Audit Log Overview
-- Metrics:
-- List of recent system changes.
-- Changes made by teachers.
-- Number of changes logged per day.

-- SQL Queries:
-- Retrieve recent actions from the AUDIT_LOG table.
select * from AUDIT_LOG
where log_date = current_date
;

-- Retrieve actions performed by teachers by joining AUDIT_LOG with TEACHER.


-- Count the number of audit logs per day.
select
	log_date
	,count(*)
from AUDIT_LOG
group by log_date
order by log_date
;
-- -----------------------------------------------------------------------------------------------------

-- Key Visuals and Corresponding SQL Queries:
-- Note: All dashboard queries must work against current month or current year filters


-- Bar Chart - Enrollment by Course
-- SQL Query: Retrieve the number of students enrolled in each course.
-- X-Axis: Course names.
-- Y-Axis: Number of students.

select 
	course_id
	,count(student_id)
from Enrollment
group by course_id
order by course_id
;

-- -----------------------------------------------------------------------------------------------------
-- Pie Chart - Department Students
-- SQL Query: Retrieve the number of students enrolled for each department.

select 
	a.Department_name
	,count(b.student_id) as number_of_students
from department a
inner join course aa using(department_id)
inner join enrollment bb using(course_id)
inner join student b using(student_id)
group by a.Department_name
order by a.Department_name
;


-- -----------------------------------------------------------------------------------------------------
-- Line Graph - Monthly Collectionsh
-- SQL Query: Retrieve total fees collected per month.
-- X-Axis: Collection date (grouped by month).
-- Y-Axis: Collection Amount.

select 
	extract (month from payment_date)
	,sum(amount_paid)
from fee_payment
group by extract (month from payment_date)
;

-- -----------------------------------------------------------------------------------------------------
-- Table - Exam Result by Courses
-- SQL Query: Retrieve course name, exam name, enrolled count, passed count and failed count.
-- Columns: Course, Exam Name, Student Count, Passed Count, Failed Count.
-- select * from grade

select 
	a.Course_name
	,b.Exam_name
	,count(d.student_id) as Student_count
	,case 
		when c.grade_letter <= 'D' then count(c.grade_letter)
	end as Pass_count
	,case 
		when c.grade_letter > 'D' then count(c.grade_letter)
	end as Fail_count
from course a
inner join exam b using(course_id)
inner join exam_result aaa On b.exam_id = aaa.exam_schedule_id
inner join grade c using(grade_id)
inner join enrollment aa ON a.course_id = aa.course_id
inner join student d ON aa.student_id = d.student_id
group by a.Course_name ,b.Exam_name, c.grade_letter
;

-- -----------------------------------------------------------------------------------------------------
-- Gauge - Fees Status
-- SQL Query: Retrieve total fees, paid amount and due amount for current semester.
-- Display: Total paid fees and due amount.

select 
	aa.first_name||' '||aa.last_name as student_name
	,b.fee_amount
	,a.amount_paid
	,a.balance_amount
from fee_payment a
inner join student aa using(student_id)
inner join enrollment bb using(student_id)
inner join course cc using(course_id)
inner join fee_structure b using(course_id)
;



-- -----------------------------------------------------------------------------------------------------
-- Submission Details:
-- Write down all SQL queries in a single SQL file.
-- Ensure each query is numbered sequentially within the file for clarity.
-- Name your file using the format: dashboard_reporting_student_management_project.sql.
-- Submit the file as part of the assignment, and ensure it is organized and easy to follow.


-- -----------------------------------------------------------------------------------------------------
-- This assignment allows students to practice SQL queries to generate reports and dashboard insights from the Student Management System. The task involves using real-world data to create meaningful reports and visualizations based on the database structure.