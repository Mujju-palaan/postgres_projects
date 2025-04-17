--Mujju-pg-Student-Management-C06(a)-DML

-- Question 1: Insert Data into all Tables
-- Write SQL queries to populate each table created in the Chapter 5 assignment with at least 10 rows of data.
--DONE

--Question 1: Insert values in the DEPARTMENT table:
insert into DEPARTMENT(DEPARTMENT_name)
values ('Mathematics'),
    ('Physics'),
    ('Chemistry'),
    ('Biology'),
    ('Computer Science'),
    ('Information Technology'),
    ('Mechanical Engineering'),
    ('Electrical Engineering'),
    ('Civil Engineering'),
    ('Business Administration'),
    ('Economics'),
    ('Finance'),
    ('Marketing'),
    ('Psychology'),
    ('Sociology'),
    ('Political Science'),
    ('History'),
    ('English Literature'),
    ('Linguistics'),
    ('Philosophy')
;

-- select * from DEPARTMENT;

--Question 2: Insert values in the GRADE Table
insert into GRADE(grade_letter, grade_description, start_percent, end_percent)
values
	('A', 'Outstanding', 97, 100),
    ('A', 'Excellent', 93, 96),
    ('A', 'Very Good', 90, 92),
    ('A', 'Good', 85, 89),
    ('A', 'Above Average', 80, 84),
    ('A', 'Satisfactory', 75, 79),
    ('A', 'Competent', 70, 74),
    ('A', 'Proficient', 65, 69),
    ('A', 'Meets Expectations', 60, 64),
    ('A', 'Passable', 55, 59),
    ('A', 'Just Above Passing', 50, 54),
    ('F', 'Fail', 0, 49),
    ('F', 'Very Poor', 0, 45),
    ('F', 'Insufficient', 0, 40),
    ('F', 'Weak Performance', 0, 39),
    ('F', 'Did Not Meet Requirements', 0, 35),
    ('F', 'Unsatisfactory', 0, 30),
    ('F', 'Incomplete', 0, 25),
    ('F', 'Not Eligible for Credit', 0, 20),
    ('F', 'No Attempt', 0, 10)
;

-- select * from GRADE;

alter table SEMESTER
alter column enrollment_status type char(5);

--Question 3: Insert values in the SEMESTER Table
insert into SEMESTER(SEMESTER_name, start_date, end_date, enrollment_status)
values
	('Spring 2024', '2024-01-10', '2024-05-20', 'open'),
    ('Summer 2024', '2024-06-05', '2024-08-15', 'open'),
    ('Fall 2024', '2024-09-01', '2024-12-20', 'close'),
    ('Winter 2025', '2025-01-10', '2025-04-30', 'close'),
    ('Spring 2025', '2025-05-05', '2025-08-20', 'open'),
    ('Summer 2025', '2025-06-10', '2025-08-15', 'open'),
    ('Fall 2025', '2025-09-01', '2025-12-20', 'close'),
    ('Winter 2026', '2026-01-10', '2026-04-30', 'close'),
    ('Spring 2026', '2026-05-05', '2026-08-20', 'open'),
    ('Summer 2026', '2026-06-10', '2026-08-15', 'open'),
    ('Fall 2026', '2026-09-01', '2026-12-20', 'close'),
    ('Winter 2027', '2027-01-10', '2027-04-30', 'close'),
    ('Spring 2027', '2027-05-05', '2027-08-20', 'open'),
    ('Summer 2027', '2027-06-10', '2027-08-15', 'open'),
    ('Fall 2027', '2027-09-01', '2027-12-20', 'close'),
    ('Winter 2028', '2028-01-10', '2028-04-30', 'close'),
    ('Spring 2028', '2028-05-05', '2028-08-20', 'open'),
    ('Summer 2028', '2028-06-10', '2028-08-15', 'open'),
    ('Fall 2028', '2028-09-01', '2028-12-20', 'close'),
    ('Winter 2029', '2029-01-10', '2029-04-30', 'close')
;

-- select * from SEMESTER;

--Question 4: Insert values in the STUDENT Table
insert into STUDENT(first_name, last_name, date_of_birth, email)
values
	('John', 'Doe', '2002-05-14', 'john.doe@example.com'),
    ('Jane', 'Smith', '2001-08-22', 'jane.smith@example.com'),
    ('Michael', 'Johnson', '2003-02-10', 'michael.johnson@example.com'),
    ('Emily', 'Davis', '2000-11-30', 'emily.davis@example.com'),
    ('David', 'Martinez', '2004-07-25', 'david.martinez@example.com'),
    ('Sophia', 'Anderson', '2002-09-18', 'sophia.anderson@example.com'),
    ('Daniel', 'Taylor', '2001-12-05', 'daniel.taylor@example.com'),
    ('Olivia', 'Thomas', '2003-06-21', 'olivia.thomas@example.com'),
    ('James', 'Harris', '2002-04-13', 'james.harris@example.com'),
    ('Ava', 'Clark', '2000-10-09', 'ava.clark@example.com'),
    ('William', 'Lewis', '2004-03-15', 'william.lewis@example.com'),
    ('Mia', 'Robinson', '2001-07-27', 'mia.robinson@example.com'),
    ('Ethan', 'Walker', '2003-05-19', 'ethan.walker@example.com'),
    ('Isabella', 'Allen', '2002-08-14', 'isabella.allen@example.com'),
    ('Alexander', 'Young', '2000-12-02', 'alexander.young@example.com'),
    ('Charlotte', 'King', '2004-09-10', 'charlotte.king@example.com'),
    ('Benjamin', 'Wright', '2001-06-05', 'benjamin.wright@example.com'),
    ('Amelia', 'Scott', '2003-01-25', 'amelia.scott@example.com'),
    ('Mason', 'Green', '2002-07-11', 'mason.green@example.com'),
    ('Ella', 'Adams', '2000-05-08', 'ella.adams@example.com')
;

-- select * from STUDENT;

--Question 5: Insert values in the COURSE Table
insert into COURSE(course_name, department_id, credits)
values
	('Introduction to Computer Science', 1, 12),
    ('Advanced Programming', 2, 15),
    ('Database Management Systems', 3, 18),
    ('Software Engineering', 4, 20),
    ('Principles of Accounting', 5, 16),
    ('Financial Management', 6, 14),
    ('Marketing Strategies', 7, 22),
    ('Business Law', 8, 19),
    ('General Chemistry', 9, 21),
    ('Organic Chemistry', 10, 13),
    ('Physics I', 11, 17),
    ('Physics II', 12, 23),
    ('Linear Algebra', 13, 20),
    ('Calculus I', 14, 24),
    ('World History', 15, 12),
    ('Psychology 101', 16, 18),
    ('Introduction to Sociology', 17, 15),
    ('Introduction to Economics', 18, 22),
    ('Political Science', 19, 14),
    ('Environmental Science', 20, 16)
;

-- select * from COURSE;

--Question 6: Insert values in the ENROLLMENT Table
insert into ENROLLMENT(ENROLLMENT_date, student_id, course_id, semester_id, grade_id, amount_paid, amount_due)
values
	('2024-01-10', 1, 1, 1, 1, 500.00, 1500.00),
    ('2024-01-15', 2, 2, 2, 2, 1200.00, 800.00),
    ('2024-02-05', 3, 3, 3, 3, 900.00, 1100.00),
    ('2024-02-20', 4, 4, 4, 4, 1500.00, 500.00),
    ('2024-03-01', 5, 5, 5, 5, 700.00, 1300.00),
    ('2024-03-15', 6, 6, 6, 6, 2000.00, 0.00),
    ('2024-04-10', 7, 7, 7, 7, 800.00, 1200.00),
    ('2024-04-25', 8, 8, 8, 8, 1400.00, 600.00),
    ('2024-05-02', 9, 9, 9, 9, 600.00, 1400.00),
    ('2024-05-18', 10, 10, 10, 10, 1100.00, 900.00),
    ('2024-06-05', 11, 11, 11, 11, 1000.00, 1000.00),
    ('2024-06-22', 12, 12, 12, 12, 1300.00, 700.00),
    ('2024-07-08', 13, 13, 13, 13, 900.00, 1100.00),
    ('2024-07-19', 14, 14, 14, 14, 1500.00, 500.00),
    ('2024-08-01', 15, 15, 15, 15, 1200.00, 800.00),
    ('2024-08-14', 16, 16, 16, 16, 2000.00, 0.00),
    ('2024-09-03', 17, 17, 17, 17, 700.00, 1300.00),
    ('2024-09-20', 18, 18, 18, 18, 600.00, 1400.00),
    ('2024-10-07', 19, 19, 19, 19, 800.00, 1200.00),
    ('2024-10-15', 20, 20, 20, 20, 1100.00, 900.00)
;

-- select * from ENROLLMENT;

--Question 7: Insert values in the TEACHER Table 
insert into TEACHER(first_name, last_name, email, hire_date, department_id, phone_number)
values
	('Alice', 'Johnson', 'alice.johnson@email.com', '2015-06-15', 1, '123-456-7890'),
    ('Bob', 'Smith', 'bob.smith@email.com', '2016-09-20', 2, '234-567-8901'),
    ('Charlie', 'Brown', 'charlie.brown@email.com', '2017-03-12', 3, '345-678-9012'),
    ('David', 'Williams', 'david.williams@email.com', '2018-11-05', 4, '456-789-0123'),
    ('Emily', 'Davis', 'emily.davis@email.com', '2019-07-23', 5, '567-890-1234'),
    ('Frank', 'Miller', 'frank.miller@email.com', '2020-02-18', 6, '678-901-2345'),
    ('Grace', 'Wilson', 'grace.wilson@email.com', '2014-08-30', 7, '789-012-3456'),
    ('Hannah', 'Moore', 'hannah.moore@email.com', '2013-04-14', 8, '890-123-4567'),
    ('Ian', 'Taylor', 'ian.taylor@email.com', '2012-12-07', 9, '901-234-5678'),
    ('Jack', 'Anderson', 'jack.anderson@email.com', '2011-10-22', 10, '012-345-6789'),
    ('Kate', 'Thomas', 'kate.thomas@email.com', '2021-01-15', 11, '111-222-3333'),
    ('Leo', 'Jackson', 'leo.jackson@email.com', '2022-05-06', 12, '222-333-4444'),
    ('Mia', 'White', 'mia.white@email.com', '2023-09-17', 13, '333-444-5555'),
    ('Nathan', 'Harris', 'nathan.harris@email.com', '2010-03-29', 14, '444-555-6666'),
    ('Olivia', 'Martin', 'olivia.martin@email.com', '2009-07-11', 15, '555-666-7777'),
    ('Peter', 'Thompson', 'peter.thompson@email.com', '2008-06-19', 16, '666-777-8888'),
    ('Quinn', 'Garcia', 'quinn.garcia@email.com', '2007-02-25', 17, '777-888-9999'),
    ('Rachel', 'Martinez', 'rachel.martinez@email.com', '2006-12-09', 18, '888-999-0000'),
    ('Samuel', 'Robinson', 'samuel.robinson@email.com', '2005-05-27', 19, '999-000-1111'),
    ('Tina', 'Clark', 'tina.clark@email.com', '2004-08-14', 20, '000-111-2222')
;

-- select * from TEACHER;

--Question 8: Insert values in the TEACHER_COURSE Table
insert into TEACHER_COURSE(teacher_id, course_id)
values
	(1, 1),
    (2, 2),
    (3, 3),
    (4, 4),
    (5, 5),
    (6, 6),
    (7, 7),
    (8, 8),
    (9, 9),
    (10, 10),
    (11, 11),
    (12, 12),
    (13, 13),
    (14, 14),
    (15, 15),
    (16, 16),
    (17, 17),
    (18, 18),
    (19, 19),
    (20, 20)
;

-- select * from TEACHER_COURSE;

--Question 9: Insert values in the CLASSROOM Table
insert into CLASSROOM(room_number, capacity, department_id)
values
    ('A101', 60, 1),
    ('B102', 65, 2),
    ('C103', 70, 3),
    ('D104', 75, 4),
    ('E105', 80, 5),
    ('F106', 85, 6),
    ('G107', 90, 7),
    ('H108', 95, 8),
    ('I109', 100, 9),
    ('J110', 62, 10),
    ('K201', 68, 11),
    ('L202', 73, 12),
    ('M203', 78, 13),
    ('N204', 83, 14),
    ('O205', 88, 15),
    ('P206', 93, 16),
    ('Q207', 98, 17),
    ('R208', 66, 18),
    ('S209', 72, 19),
    ('T210', 79, 20)
;
	
-- select * from CLASSROOM;

-- Question 10: Insert values in the CLASS_SCHEDULE Table with Relationships
insert into CLASS_SCHEDULE(semester_id, course_id, teacher_id, start_date, end_date, start_time, end_time)
values
	(1, 1, 1, '2025-01-15', '2025-05-30', '08:00', '09:30'),
    (2, 2, 2, '2025-02-01', '2025-06-15', '10:00', '11:30'),
    (3, 3, 3, '2025-03-10', '2025-07-20', '13:00', '14:30'),
    (4, 4, 4, '2025-04-05', '2025-08-25', '15:00', '16:30'),
    (5, 5, 5, '2025-05-12', '2025-09-30', '17:00', '18:30'),
    (6, 6, 6, '2025-06-20', '2025-10-15', '08:30', '10:00'),
    (7, 7, 7, '2025-07-01', '2025-11-20', '11:00', '12:30'),
    (8, 8, 8, '2025-08-05', '2025-12-10', '14:00', '15:30'),
    (9, 9, 9, '2025-09-10', '2026-01-20', '16:00', '17:30'),
    (10, 10, 10, '2025-10-15', '2026-02-28', '18:00', '19:30'),
    (11, 11, 11, '2025-11-01', '2026-03-15', '09:00', '10:30'),
    (12, 12, 12, '2025-12-05', '2026-04-10', '11:30', '13:00'),
    (13, 13, 13, '2026-01-10', '2026-05-15', '13:30', '15:00'),
    (14, 14, 14, '2026-02-20', '2026-06-30', '15:30', '17:00'),
    (15, 15, 15, '2026-03-01', '2026-07-20', '08:00', '09:30'),
    (16, 16, 16, '2026-04-10', '2026-08-25', '10:00', '11:30'),
    (17, 17, 17, '2026-05-15', '2026-09-30', '13:00', '14:30'),
    (18, 18, 18, '2026-06-05', '2026-10-15', '16:00', '17:30'),
    (19, 19, 19, '2026-07-20', '2026-11-10', '18:00', '19:30'),
    (20, 20, 20, '2026-08-01', '2026-12-20', '09:30', '11:00')
;

-- select * from CLASS_SCHEDULE;

-- Question 11: Insert values in the EXAM Table
insert into EXAM(exam_name, course_id, total_marks)
values
	('Midterm Exam', 1, 30),
    ('Final Exam', 1, 100),
    ('Quiz 1', 1, 20),
    ('Quiz 2', 1, 20),
    ('Quiz 3', 1, 20),
    ('Quiz 4', 1, 20),
    ('Practical Exam 1', 1, 30),
    ('Practical Exam 2', 1, 30),
    ('Lab Test 1', 1, 20),
    ('Lab Test 2', 1, 20),
    ('Oral Exam 1', 1, 20),
    ('Oral Exam 2', 1, 20),
    ('Mock Test 1', 1, 30),
    ('Mock Test 2', 1, 30),
    ('Surprise Test 1', 1, 30),
    ('Surprise Test 2', 1, 30),
    ('Unit Test 1', 1, 50),
    ('Unit Test 2', 1, 50),
    ('Semester Project Presentation', 1, 70),
    ('Comprehensive Assessment', 1, 30)
;

-- select * from EXAM;

-- Question 12: Insert values in the EXAM_SCHEDULE Table
insert into EXAM_SCHEDULE(exam_date, exam_id, semester_id, course_id, classroom_id, total_marks, start_time, end_time)
values
	('2025-03-10', 1, 1, 1, 1, 100, '09:00', '11:00'),
    ('2025-04-15', 2, 2, 2, 2, 75, '10:00', '12:00'),
    ('2025-05-20', 3, 3, 3, 3, 50, '13:00', '14:30'),
    ('2025-06-25', 4, 4, 4, 4, 100, '15:00', '17:00'),
    ('2025-07-30', 5, 5, 5, 5, 80, '08:00', '10:00'),
    ('2025-08-10', 6, 6, 6, 6, 70, '11:30', '13:30'),
    ('2025-09-15', 7, 7, 7, 7, 100, '14:00', '16:00'),
    ('2025-10-20', 8, 8, 8, 8, 60, '09:00', '10:30'),
    ('2025-11-25', 9, 9, 9, 9, 90, '10:30', '12:30'),
    ('2025-12-30', 10, 10, 10, 10, 75, '13:00', '15:00'),
    ('2026-01-10', 11, 11, 11, 11, 50, '08:30', '10:00'),
    ('2026-02-15', 12, 12, 12, 12, 100, '11:00', '13:00'),
    ('2026-03-20', 13, 13, 13, 13, 80, '14:30', '16:30'),
    ('2026-04-25', 14, 14, 14, 14, 70, '09:00', '10:30'),
    ('2026-05-30', 15, 15, 15, 15, 60, '10:00', '11:30'),
    ('2026-06-10', 16, 16, 16, 16, 90, '12:00', '14:00'),
    ('2026-07-15', 17, 17, 17, 17, 100, '15:00', '17:00'),
    ('2026-08-20', 18, 18, 18, 18, 80, '08:00', '10:00'),
    ('2026-09-25', 19, 19, 19, 19, 75, '10:30', '12:30'),
    ('2026-10-30', 20, 20, 20, 20, 50, '13:00', '14:30')
;

-- select * from EXAM_SCHEDULE;

-- Question 13: Insert values in the EXAM_RESULT Table
insert into EXAM_RESULT(exam_schedule_id, student_id, grade_id)
values
	(1, 1, 1),
    (2, 2, 2),
    (3, 3, 3),
    (4, 4, 4),
    (5, 5, 5),
    (6, 6, 6),
    (7, 7, 7),
    (8, 8, 8),
    (9, 9, 9),
    (10, 10, 10),
    (11, 11, 11),
    (12, 12, 12),
    (13, 13, 13),
    (14, 14, 14),
    (15, 15, 15),
    (16, 16, 16),
    (17, 17, 17),
    (18, 18, 18),
    (19, 19, 19),
    (20, 20, 20)
;

-- select * from EXAM_RESULT;

-- Question 14: Insert values in the EXAM_RESULT_MASTER Table
insert into EXAM_RESULT_MASTER(exam_id, student_id, grade_id, semester_id)
values
	(1, 1, 1, 1),
    (2, 2, 2, 2),
    (3, 3, 3, 3),
    (4, 4, 4, 4),
    (5, 5, 5, 5),
    (6, 6, 6, 6),
    (7, 7, 7, 7),
    (8, 8, 8, 8),
    (9, 9, 9, 9),
    (10, 10, 10, 10),
    (11, 11, 11, 11),
    (12, 12, 12, 12),
    (13, 13, 13, 13),
    (14, 14, 14, 14),
    (15, 15, 15, 15),
    (16, 16, 16, 16),
    (17, 17, 17, 17),
    (18, 18, 18, 18),
    (19, 19, 19, 19),
    (20, 20, 20, 20)
;

-- select * from EXAM_RESULT_MASTER;

-- Question 15: Insert values in the ATTENDANCE Table
insert into ATTENDANCE(ATTENDANCE_date, student_id, course_id, absence_flag)
values
	('2025-01-10', 1, 1, 'false'),
    ('2025-01-11', 2, 2, 'true'),
    ('2025-01-12', 3, 3, 'false'),
    ('2025-01-13', 4, 4, 'true'),
    ('2025-01-14', 5, 5, 'false'),
    ('2025-01-15', 6, 6, 'true'),
    ('2025-01-16', 7, 7, 'false'),
    ('2025-01-17', 8, 8, 'true'),
    ('2025-01-18', 9, 9, 'false'),
    ('2025-01-19', 10, 10, 'true'),
    ('2025-01-20', 11, 11, 'false'),
    ('2025-01-21', 12, 12, 'true'),
    ('2025-01-22', 13, 13, 'false'),
    ('2025-01-23', 14, 14, 'true'),
    ('2025-01-24', 15, 15, 'false'),
    ('2025-01-25', 16, 16, 'true'),
    ('2025-01-26', 17, 17, 'false'),
    ('2025-01-27', 18, 18, 'true'),
    ('2025-01-28', 19, 19, 'false'),
    ('2025-01-29', 20, 20, 'true')
;

-- select * from ATTENDANCE;

-- Question 16: Insert values in the FEE_STRUCTURE Table
insert into FEE_STRUCTURE(course_id, fee_amount)
values
	(1, 10500.00),
    (2, 32000.00),
    (3, 28000.00),
    (4, 41500.00),
    (5, 25000.00),
    (6, 47000.00),
    (7, 19500.00),
    (8, 35000.00),
    (9, 29500.00),
    (10, 44000.00),
    (11, 21500.00),
    (12, 30000.00),
    (13, 38500.00),
    (14, 26500.00),
    (15, 48000.00),
    (16, 23000.00),
    (17, 42500.00),
    (18, 27000.00),
    (19, 33000.00),
    (20, 39500.00)
;

-- select * from FEE_STRUCTURE;

-- Question 17: Insert values in the FEE_PAYMENT 
WITH FeeData AS (
    SELECT course_id, fee_amount 
    FROM FEE_STRUCTURE 
    WHERE course_id BETWEEN 1 AND 20
)
INSERT INTO FEE_PAYMENT (student_id, amount_paid, balance_amount, payment_date)
VALUES 
    (1, 10000.00, (SELECT fee_amount FROM FeeData WHERE course_id = 1) - 10000, '2025-01-05'),
    (2, 25000.00, (SELECT fee_amount FROM FeeData WHERE course_id = 2) - 25000, '2025-01-06'),
    (3, 18000.00, (SELECT fee_amount FROM FeeData WHERE course_id = 3) - 18000, '2025-01-07'),
    (4, 22000.00, (SELECT fee_amount FROM FeeData WHERE course_id = 4) - 22000, '2025-01-08'),
    (5, 15000.00, (SELECT fee_amount FROM FeeData WHERE course_id = 5) - 15000, '2025-01-09'),
    (6, 27000.00, (SELECT fee_amount FROM FeeData WHERE course_id = 6) - 27000, '2025-01-10'),
    (7, 12000.00, (SELECT fee_amount FROM FeeData WHERE course_id = 7) - 12000, '2025-01-11'),
    (8, 29000.00, (SELECT fee_amount FROM FeeData WHERE course_id = 8) - 29000, '2025-01-12'),
    (9, 20000.00, (SELECT fee_amount FROM FeeData WHERE course_id = 9) - 20000, '2025-01-13'),
    (10, 25000.00, (SELECT fee_amount FROM FeeData WHERE course_id = 10) - 25000, '2025-01-14'),
    (11, 17000.00, (SELECT fee_amount FROM FeeData WHERE course_id = 11) - 17000, '2025-01-15'),
    (12, 21000.00, (SELECT fee_amount FROM FeeData WHERE course_id = 12) - 21000, '2025-01-16'),
    (13, 19000.00, (SELECT fee_amount FROM FeeData WHERE course_id = 13) - 19000, '2025-01-17'),
    (14, 26000.00, (SELECT fee_amount FROM FeeData WHERE course_id = 14) - 26000, '2025-01-18'),
    (15, 14000.00, (SELECT fee_amount FROM FeeData WHERE course_id = 15) - 14000, '2025-01-19'),
    (16, 23000.00, (SELECT fee_amount FROM FeeData WHERE course_id = 16) - 23000, '2025-01-20'),
    (17, 28000.00, (SELECT fee_amount FROM FeeData WHERE course_id = 17) - 28000, '2025-01-21'),
    (18, 15000.00, (SELECT fee_amount FROM FeeData WHERE course_id = 18) - 15000, '2025-01-22'),
    (19, 27000.00, (SELECT fee_amount FROM FeeData WHERE course_id = 19) - 27000, '2025-01-23'),
    (20, (SELECT fee_amount FROM FeeData WHERE course_id = 20), 0.00, '2025-01-24'); -- Fully paid

-- select * from FEE_PAYMENT;

CREATE EXTENSION IF NOT EXISTS pgcrypto;

-- You Cannot Decrypt crypt() Hashed Passwords
-- User passwords	
-- Use crypt() (no decryption allowed)

-- Sensitive data (SSN, card numbers, etc.)	
-- Use pgp_sym_encrypt() / pgp_sym_decrypt()

-- INSERT INTO EMPLOYEE_LOGIN (login_id, password, active_flag) 
-- VALUES 
--     ('john.doe@example.com', crypt('Pass@123', gen_salt('bf')), 1),
--     ('jane.smith@example.com', crypt('SecurePass1', gen_salt('bf')), 1)
-- ;

-- Password Validation (No Decryption)
-- SELECT * FROM EMPLOYEE_LOGIN 
-- WHERE login_id = 'john.doe@example.com' 
-- AND password = crypt('Pass@123', password);

-- Question 18: Insert values in the EMPLOYEE_LOGIN Table
insert into EMPLOYEE_LOGIN(login_id, password, active_flag)
values
	('user1', pgp_sym_encrypt('Password1!', 'mySecretKey'), 1),
    ('user2', pgp_sym_encrypt('Secure123$', 'mySecretKey'), 1),
    ('user3', pgp_sym_encrypt('Hello@World', 'mySecretKey'), 1),
    ('user4', pgp_sym_encrypt('StrongPass!9', 'mySecretKey'), 1),
    ('user5', pgp_sym_encrypt('TestUser_98', 'mySecretKey'), 1),
    ('user6', pgp_sym_encrypt('Employee#456', 'mySecretKey'), 1),
    ('user7', pgp_sym_encrypt('Welcome@2025', 'mySecretKey'), 1),
    ('user8', pgp_sym_encrypt('Data123!Entry', 'mySecretKey'), 1),
    ('user9', pgp_sym_encrypt('Postgres@DB', 'mySecretKey'), 1),
    ('user10', pgp_sym_encrypt('LoginPass_77', 'mySecretKey'), 1),
    ('user11', pgp_sym_encrypt('EncryptMe99', 'mySecretKey'), 1),
    ('user12', pgp_sym_encrypt('CyberSafe@01', 'mySecretKey'), 1),
    ('user13', pgp_sym_encrypt('Secure&Strong', 'mySecretKey'), 1),
    ('user14', pgp_sym_encrypt('Developer_321', 'mySecretKey'), 1),
    ('user15', pgp_sym_encrypt('Admin@Secure', 'mySecretKey'), 1),
    ('user16', pgp_sym_encrypt('BackupUser09', 'mySecretKey'), 1),
    ('user17', pgp_sym_encrypt('SuperSecret1', 'mySecretKey'), 1),
    ('user18', pgp_sym_encrypt('AuthPass@33', 'mySecretKey'), 1),
    ('user19', pgp_sym_encrypt('Verified99!', 'mySecretKey'), 1),
    ('user20', pgp_sym_encrypt('SafeAccess@12', 'mySecretKey'), 1)
;

-- select * from EMPLOYEE_LOGIN;

--decrypt

-- SELECT login_id, pgp_sym_decrypt(password::bytea, 'mySecretKey') AS decrypted_password 
-- FROM EMPLOYEE_LOGIN;


-- Question 19: Insert values in the AUDIT_LOG Table
insert into AUDIT_LOG(log_date, action, user_id)
values
	(CURRENT_DATE - INTERVAL '1 day', 'Student registered for course', 1),
    (CURRENT_DATE - INTERVAL '2 days', 'Teacher updated assignment', 2),
    (CURRENT_DATE - INTERVAL '3 days', 'Admin modified student record', 3),
    (CURRENT_DATE - INTERVAL '4 days', 'Student dropped a course', 4),
    (CURRENT_DATE - INTERVAL '5 days', 'Exam schedule updated', 5),
    (CURRENT_DATE - INTERVAL '6 days', 'Grade assigned to student', 6),
    (CURRENT_DATE - INTERVAL '7 days', 'Attendance marked', 7),
    (CURRENT_DATE - INTERVAL '8 days', 'Student profile updated', 8),
    (CURRENT_DATE - INTERVAL '9 days', 'Fee payment processed', 9),
    (CURRENT_DATE - INTERVAL '10 days', 'New course added', 10),
    (CURRENT_DATE - INTERVAL '11 days', 'Semester enrollment opened', 11),
    (CURRENT_DATE - INTERVAL '12 days', 'Student record deleted', 12),
    (CURRENT_DATE - INTERVAL '13 days', 'Teacher assigned to course', 13),
    (CURRENT_DATE - INTERVAL '14 days', 'Classroom allocated for course', 14),
    (CURRENT_DATE - INTERVAL '15 days', 'Fee structure updated', 15),
    (CURRENT_DATE - INTERVAL '16 days', 'Exam results published', 16),
    (CURRENT_DATE - INTERVAL '17 days', 'New department created', 17),
    (CURRENT_DATE - INTERVAL '18 days', 'Teacher record updated', 18),
    (CURRENT_DATE - INTERVAL '19 days', 'System maintenance completed', 19),
    (CURRENT_DATE - INTERVAL '20 days', 'User login activity logged', 20);

-- select * from AUDIT_LOG;

