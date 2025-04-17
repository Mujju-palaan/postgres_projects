-- Mujju-pg-Student-Management-C07(a)-DQL

-- Chapter 7 - DQL (Data Query Language)
-- DQL ASSIGNMENT2 - Student Management System

-- 1. SELECT Command
-- Select all columns from the STUDENT table.
select * from student;

-- Select the first_name and last_name of all students.
select first_name, last_name from student;

-- Select all students' email and date_of_birth.

-- Select the course_name and credits of all courses.


-- 2. WHERE Command
-- Select all students who were born before '2000-01-01'.
-- Select all courses with more than 3 credits.
-- Select all students whose last_name starts with the letter 'S'.
-- Select all students where email contains 'edu' using LIKE.


-- 3. ORDER BY Command
-- Select all students ordered by last_name in ascending order.
-- Select all courses ordered by credits in descending order.
-- Select all enrollments ordered by enrollment_date in descending order.
-- Select all teachers ordered by hire_date in ascending order.


-- 4. LIMIT Command
-- Select the first 5 students from the STUDENT table.
-- Select the top 3 courses with the highest credits.
-- Select the top 10 students ordered by last_name.
-- Select the top 2 enrollments with the highest grades.


-- 5. DISTINCT Command
-- Select distinct course_name values from the COURSE table.
-- Select distinct last_name values from the STUDENT table.
-- Select distinct grade values from the ENROLLMENT table.
-- Select distinct department_name values from the DEPARTMENT table.


-- 6. BETWEEN Command
-- Select all students whose date_of_birth is between '1995-01-01' and '2000-12-31'.
-- Select all courses where the credits are between 2 and 5.
-- Select all enrollments where the grade is between 'A' and 'C'.
-- Select all teachers hired between '2015-01-01' and '2020-12-31'.


-- 7. IN and NOT IN Command
-- Select all students where the student_id is in (1, 2, 3).
-- Select all courses where the credits are not in (1, 4, 6).
-- Select all students where last_name is in ('Smith', 'Johnson', 'Brown').
-- Select all departments where department_name is not in ('Physics', 'Mathematics').


-- 8. IS NULL and IS NOT NULL Command
-- Select all students where the email is NULL.
-- Select all enrollments where the grade is not NULL.
-- Select all students where phone_number is NULL.
-- Select all teachers where the email is not NULL.


-- 9. GROUP BY Command
-- Select the department_name and count the number of enrolled students in each department grouped by department_name.
-- Select the month and year from date dim to calculate numer of holidays per month.
-- Select the grade from the ENROLLMENT table and group by grade to calculate the number of enrollments per grade.
-- Select the teacher_id and group by teacher_id to calculate the total number of courses assigned to each teacher.


-- 10. HAVING Command
-- Select department_name from the DEPARTMENT table grouped by department_name and having more than 3 students enrolled in each department.
-- Select the course_name from the COURSE table, grouped by course_name, and having average credits greater than 3.
-- Select student_id, group by student_id, and having a count of enrollments greater than 2.
-- Select the course_id from the ENROLLMENT table, grouped by course_id, and having a total number of enrollments more than 5.


-- 11. INNER JOIN Command
-- Select all students and their enrollments using INNER JOIN between the STUDENT and ENROLLMENT tables.
-- Select all students and the courses they are enrolled in using INNER JOIN between the STUDENT, ENROLLMENT, and COURSE tables.
-- Select all students and the exam_date for the exams they are enrolled in using INNER JOIN between STUDENT, ENROLLMENT, and EXAM_SCHEDULE.
-- Select the first_name and last_name of students and the course_name they are enrolled in using INNER JOIN between STUDENT and COURSE.


-- 12. LEFT JOIN Command
-- Select all students and their enrollments using LEFT JOIN, including students without enrollments.
-- Select all courses and the corresponding enrollments using LEFT JOIN, including courses that have no enrollments.
-- Select all teachers and the courses they teach using LEFT JOIN to include teachers who are not teaching any courses.
-- Select all students and their exam details using LEFT JOIN, even if they haven’t taken any exams.


-- 13. COUNT, SUM, AVG Command
-- Count the total number of students in the STUDENT table.
-- Count the number of distinct course_id in the ENROLLMENT table.
-- Calculate the sum of all credits for each student enrolled in courses.
-- Calculate the average grade for all students in the ENROLLMENT table.


-- 14. CASE Command
-- Select all enrollments and create a CASE statement to show 'Pass' if grade is 'A' or 'B', and 'Fail' otherwise.
-- Select all students and use a CASE statement to show 'Minor' if date_of_birth is after '2000-01-01', and 'Adult' otherwise.
-- Create a CASE statement in the ENROLLMENT table to show 'High' if credits are greater than 4, and 'Low' otherwise.
-- Use a CASE statement to categorize teachers by their hire date into 'New' and 'Experienced'.


-- 15. EXISTS and NOT EXISTS Command
-- Select students where enrollments exist in the ENROLLMENT table.
-- Select students where the course exists in the COURSE table using EXISTS.
-- Select students where grade is NULL using NOT EXISTS in the ENROLLMENT table.
-- Select courses where no enrollment exists using NOT EXISTS.


-- 16. SUBQUERY Command
-- Select all students whose student_id is in the result of a subquery selecting student_id from ENROLLMENT where grade = 'A'.
-- Select all courses where the course_id is in the result of a subquery selecting course_id from the EXAM_SCHEDULE table where total_marks > 80.
-- Select all students who have never enrolled in any course using a subquery.
-- Select all teachers who are assigned to more than 3 courses using a subquery on the TEACHER_COURSE table.


-- 17. RANK and DENSE_RANK Command
-- Select all students and show their rank based on date_of_birth using RANK().
-- Select all students and show their rank based on date_of_birth using DENSE_RANK().
-- Rank students based on their total number of enrollments using RANK().
-- Use DENSE_RANK() to rank students by their average grade in the ENROLLMENT table.


-- 18. PIVOT and UNPIVOT
-- Pivot the enrollment data by grade and course_id.
-- Unpivot the exam marks to get a flattened structure of marks and course_id.
-- Pivot student enrollments by student_id and show the total enrollments for each course.
-- Unpivot exam details to show the exam_date and total_marks in a single row per student.


-- 19. UNION and UNION ALL Command
-- Select all courses using UNION ALL to include duplicates from multiple departments.
-- Select enrollments from department 1 and department 2 using UNION.
-- Select all students from two different semesters using UNION ALL.


-- 20. COALESCE, IFNULL, NULLIF Command
-- Select all students and use COALESCE to replace null emails with 'No Email'.
-- Use IFNULL to replace null grade values in the ENROLLMENT table.
-- Use NULLIF to compare total_marks and passing_marks in the EXAM table and return NULL if they are the same.
-- Select all teachers and replace null phone_number with 'Unknown' using COALESCE.


-- 21. STRING Functions
-- Select all students' first_name in uppercase using the UPPER() function.
-- Select all courses' course_name in lowercase using the LOWER() function.
-- Use CONCAT() to combine the first_name and last_name of students.
-- Select all students' last_name and find the length of the name using LENGTH().


-- 22. DATE Functions
-- Select all students and show their date_of_birth formatted as 'YYYY-MM-DD' using DATE_FORMAT().
-- Add 1 year to all hire_date values in the TEACHER table using DATE_ADD().
-- Subtract 1 month from all exam_date values using DATE_SUB().
-- Select all students and extract the year from their date_of_birth using YEAR().


-- 23. NUMERIC Functions
-- Select the total_marks from the EXAM_SCHEDULE table and round them to the nearest integer using ROUND().
-- Select all credits from the COURSE table and use CEIL() to round up.
-- Use FLOOR() to round down the credits in the COURSE table.
-- Select the highest credits from the COURSE table using MAX().


-- 24. CAST and CONVERT Command
-- Select all students and cast the student_id as a string using CAST().
-- Convert total_marks in the EXAM_SCHEDULE table to DECIMAL using CONVERT().
-- Cast credits in the COURSE table to INTEGER.
-- Convert the date_of_birth from STUDENT into CHAR format.


-- 25. CONCAT and CONCAT_WS Functions
-- Use CONCAT() to join first_name and last_name with a space in between.
-- Use CONCAT_WS() to combine the department_name and location with a comma.
-- Use CONCAT() to combine the course_name and credits from the COURSE table.
-- Use CONCAT_WS() to combine first_name, last_name, and email from the STUDENT table.


-- 26. LIKE and NOT LIKE
-- Select students whose email ends with 'example.com' using LIKE.
-- Select courses where course_name contains 'Math' using LIKE.
-- Select students whose last_name does not start with 'S' using NOT LIKE.
-- Select departments where department_name contains 'Engineering' using LIKE.


-- 27. EXISTS and NOT EXISTS
-- Select students where enrollments exist using EXISTS in the ENROLLMENT table.
-- Select students where the grade is NULL using NOT EXISTS in the ENROLLMENT table.
-- Select courses where enrollments exist using EXISTS.
-- Select teachers who have no assigned courses using NOT EXISTS.


-- 28. UNION and INTERSECT
-- Select common students enrolled in two different courses using INTERSECT.
-- Select all courses in two departments using UNION.
-- Select students who are in both PUPIL and STUDENT using INTERSECT.


-- 29. JOIN Commands
-- Select all students and their corresponding enrollments using INNER JOIN between STUDENT and ENROLLMENT.
-- Select all teachers and their courses using LEFT JOIN between TEACHER and TEACHER_COURSE.
-- Select all students and their department names using INNER JOIN between STUDENT and DEPARTMENT.
-- Select all courses and the classrooms they are taught in using INNER JOIN.


-- GOOD LUCK WITH YOUR ASSIGNMENT!!!
-- Don't forget to contact us if you need any further assistance with your assignments, and most importantly, for a manual review and approval of your work.

