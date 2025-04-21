-- -- Mujju-pg-Student-Management-C10-Project

-- Assignment Tasks:
-- Stored Procedure Tasks:
-- -----------------------------------------------------------------------------------------------------
-- Stored Procedure for Semester Management

-- Write a stored procedure to insert data into SEMESTER table.

--DONE
-- -----------------------------------------------------------------------------------------------------
-- Stored Procedure for Teacher Management

-- Write a stored procedure to update data in TEACHER table
--DONE
-- -----------------------------------------------------------------------------------------------------
-- Stored Procedure for Course Management

-- Write a stored procedure to select data from COURSE table.
--DONE

-- -----------------------------------------------------------------------------------------------------
-- Stored Procedure for Class Schedule Grid

-- Develop a stored procedure that takes a class ID, teacher ID, room ID, start date, end date, start time, and end time as input parameters. The procedure should insert the provided details into the class schedule table while ensuring that no two classes are scheduled at overlapping times. Furthermore, it must enforce a rule that a room assigned to a specific department can only host classes for courses belonging to the same department..

--DONE
-- -----------------------------------------------------------------------------------------------------
-- Stored Procedure for Exam Schedule

-- Create a stored procedure that accepts an exam ID, exam date, maximum marks, room ID, and course ID as input parameters. The procedure should insert the provided details into the exam schedule table, ensuring that no two exams are scheduled at the same date and time. Additionally, it must enforce a rule that no two exams for different courses can occur on the same day.
--DONE
-- -----------------------------------------------------------------------------------------------------
-- Stored Procedure for Exam Result

-- Create a stored procedure to insert data into the EXAM_RESULT and EXAM_RESULT_MASTER tables. Additionally, the procedure should update the grade in the ENROLLMENT table..
--DONE
-- -----------------------------------------------------------------------------------------------------
-- Stored Procedure for Fee Payment

-- Develop a stored procedure to insert data into the FEE_PAYMENT table. The procedure should update the paid_amount and due_amount fields in the ENROLLMENT table, distributing the total paid amount across the enrolled courses. Partial payments for individual courses are allowed. Ensure that overpayment is not allowed. You will have to use stored procedure's temporary table technique.

--DONE

-- -----------------------------------------------------------------------------------------------------
-- Stored Procedure for Attendance Management

-- Write a stored procedure to insert data into attendance table, make sure not to enter absence records for holidays defined in date dim table.






-- -----------------------------------------------------------------------------------------------------
-- Stored Procedure for Analyse exam Results

-- Create a stored procedure to analyze exam results. The procedure should include data points such as exam name, course name, exam date, maximum marks, average marks across all students, the number of students who appeared, the count of students who passed, and the count of students who failed. The data should be retrieved for a specific semester ID provided as an input parameter.


--DONE




-- -----------------------------------------------------------------------------------------------------

-- View Tasks:
-- View for Payment Transaction Screen

-- Create a view that shows payment transaction details from FEE_PAYMENT table.
---DONE
-- -----------------------------------------------------------------------------------------------------
-- View for Student Management Screen

-- Create a view that shows student details, including student names, age, semester name, courses enrolled, total fees and due amount.
---DONE
-- -----------------------------------------------------------------------------------------------------
-- View for Course Scheudle Details

-- Write a view that displays all teacher-course assignments, including the teacher’s full name, course name, department name, class scheduled date for the Course Schedule screen. You will have to JOIN with date dim table. Include calendar dates even when no classes are assigned to a specific teacher.

--done
-- -----------------------------------------------------------------------------------------------------
-- View for Student Enrollment

-- Create a view to display enrollment information for courses, including the student name, course name and grades achieved.

--done
-- -----------------------------------------------------------------------------------------------------
-- View for Fee Management Screen

-- Create a view that shows student details, including student names, semester name, total fees, paid amount and due amount.
--done
-- -----------------------------------------------------------------------------------------------------

-- Function Tasks:
-- Function to Calculate Total Fees per Student

-- Write a function that calculates the total fees a student owes based on the courses they are enrolled for the current semester.
---done
-- -----------------------------------------------------------------------------------------------------
-- Function to Calculate Exam Pass Rate

-- Write a function that calculates the percentage of students who passed a specific exam (grade of 'C' or higher). You need to consider all students from current semester.
---done
-- -----------------------------------------------------------------------------------------------------

-- Trigger Task:
-- Trigger for Enrollment Grade Changes
-- Create a trigger on the ENROLLMENT table that logs any changes made to the grade field into the AUDIT_LOG table. 
--Each change should include the date, the action performed, old grade, new grade, and the teacher_id who made the change.

---done