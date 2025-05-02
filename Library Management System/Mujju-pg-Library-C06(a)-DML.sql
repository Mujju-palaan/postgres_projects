-- Question 1: Insert Data into all Tables
-- Write SQL queries to populate each table created in the Chapter 5 assignment with at least 10 rows of data.

insert into LIBRARY_BRANCH(branch_name, location)
values
('Central Library', 'Downtown'),
('Northside Branch', 'North Avenue'),
('Eastwood Branch', 'Eastwood Boulevard'),
('Westfield Library', 'Westfield Drive'),
('Southgate Branch', 'Southgate Plaza'),
('Riverside Library', 'River Street'),
('Hilltop Branch', 'Hilltop Road'),
('Maplewood Library', 'Maplewood Avenue'),
('Lakeside Branch', 'Lakeside Park'),
('Greenfield Library', 'Greenfield Lane'),
('Oakridge Branch', 'Oakridge Heights'),
('Brookside Library', 'Brookside Crescent'),
('Cedarview Branch', 'Cedarview Road'),
('Pinehill Library', 'Pinehill Terrace'),
('Stonebridge Branch', 'Stonebridge Way'),
('Silverlake Library', 'Silverlake Drive'),
('Willowdale Branch', 'Willowdale Court'),
('Elmwood Library', 'Elmwood Avenue'),
('Heritage Branch', 'Heritage Square'),
('Sunset Library', 'Sunset Boulevard'),
('Hawthorne Branch', 'Hawthorne Circle'),
('Brighton Library', 'Brighton Street'),
('Kingsway Branch', 'Kingsway Road'),
('Harborview Library', 'Harborview Lane'),
('Parkside Branch', 'Parkside Avenue')
;

-- select * from LIBRARY_BRANCH;
-- ------------------------------------------------------------------------

insert into employee(first_name, last_name, email, hire_date, salary, branch_id, phone_number)
values
('Alice', 'Johnson', 'alice.johnson@example.com', '2022-03-15', 45000, 1, '555-1010'),
('Bob', 'Smith', 'bob.smith@example.com', '2021-06-10', 47000, 2, '555-1020'),
('Carol', 'Davis', 'carol.davis@example.com', '2023-01-05', 46000, 3, '555-1030'),
('David', 'Martin', 'david.martin@example.com', '2022-11-20', 48000, 4, '555-1040'),
('Eva', 'Brown', 'eva.brown@example.com', '2020-09-12', 50000, 5, '555-1050'),
('Frank', 'Wilson', 'frank.wilson@example.com', '2021-04-03', 44000, 6, '555-1060'),
('Grace', 'Lee', 'grace.lee@example.com', '2022-07-18', 47000, 7, '555-1070'),
('Henry', 'Clark', 'henry.clark@example.com', '2023-02-28', 49000, 8, '555-1080'),
('Isla', 'Hall', 'isla.hall@example.com', '2021-12-01', 45000, 9, '555-1090'),
('Jake', 'Allen', 'jake.allen@example.com', '2020-08-14', 51000, 10, '555-1100'),
('Karen', 'Young', 'karen.young@example.com', '2023-03-11', 43000, 11, '555-1111'),
('Leo', 'King', 'leo.king@example.com', '2022-06-09', 45500, 12, '555-1122'),
('Mia', 'Wright', 'mia.wright@example.com', '2021-10-27', 47000, 13, '555-1133'),
('Noah', 'Scott', 'noah.scott@example.com', '2022-01-30', 46000, 14, '555-1144'),
('Olivia', 'Green', 'olivia.green@example.com', '2020-04-19', 48000, 15, '555-1155'),
('Paul', 'Adams', 'paul.adams@example.com', '2021-09-23', 49500, 16, '555-1166'),
('Quinn', 'Baker', 'quinn.baker@example.com', '2022-12-08', 44000, 17, '555-1177'),
('Rachel', 'Nelson', 'rachel.nelson@example.com', '2023-04-01', 47000, 18, '555-1188'),
('Sam', 'Carter', 'sam.carter@example.com', '2021-05-15', 49000, 19, '555-1199'),
('Tina', 'Perez', 'tina.perez@example.com', '2022-02-07', 45000, 20, '555-1200'),
('Uma', 'Mitchell', 'uma.mitchell@example.com', '2021-11-12', 46000, 21, '555-1211'),
('Victor', 'Roberts', 'victor.roberts@example.com', '2022-10-06', 48000, 22, '555-1222'),
('Wendy', 'Turner', 'wendy.turner@example.com', '2020-06-25', 50000, 23, '555-1233'),
('Xander', 'Parker', 'xander.parker@example.com', '2023-05-01', 44500, 24, '555-1244'),
('Yara', 'Campbell', 'yara.campbell@example.com', '2022-09-16', 46500, 25, '555-1255'),
('Ava', 'Thorpe', 'ava.thorpe@library.org', '2022-01-15', 43000, 1, '555-2001'),
('Ben', 'Carlisle', 'ben.carlisle@library.org', '2021-02-18', 43500, 2, '555-2002'),
('Clara', 'Manning', 'clara.manning@library.org', '2023-03-21', 44000, 3, '555-2003'),
('Derek', 'Voss', 'derek.voss@library.org', '2020-04-25', 44500, 4, '555-2004'),
('Ella', 'Foster', 'ella.foster@library.org', '2021-05-29', 45000, 5, '555-2005'),
('Finn', 'Reid', 'finn.reid@library.org', '2022-06-12', 45500, 6, '555-2006'),
('Gwen', 'Hayes', 'gwen.hayes@library.org', '2023-07-09', 46000, 7, '555-2007'),
('Hugo', 'Nolan', 'hugo.nolan@library.org', '2021-08-17', 46500, 8, '555-2008'),
('Ivy', 'Griffin', 'ivy.griffin@library.org', '2022-09-23', 47000, 9, '555-2009'),
('Jack', 'Pope', 'jack.pope@library.org', '2023-10-01', 47500, 10, '555-2010'),
('Kira', 'Lang', 'kira.lang@library.org', '2020-11-03', 48000, 11, '555-2011'),
('Liam', 'Fischer', 'liam.fischer@library.org', '2021-12-05', 48500, 12, '555-2012'),
('Mila', 'Bates', 'mila.bates@library.org', '2022-01-10', 49000, 13, '555-2013'),
('Noel', 'Jennings', 'noel.jennings@library.org', '2023-02-11', 49500, 14, '555-2014'),
('Olga', 'Slater', 'olga.slater@library.org', '2021-03-15', 50000, 15, '555-2015'),
('Pablo', 'Crane', 'pablo.crane@library.org', '2022-04-18', 50500, 16, '555-2016'),
('Quincy', 'Wyatt', 'quincy.wyatt@library.org', '2023-05-20', 51000, 17, '555-2017'),
('Rina', 'Morrison', 'rina.morrison@library.org', '2021-06-23', 51500, 18, '555-2018'),
('Sean', 'Delaney', 'sean.delaney@library.org', '2022-07-27', 52000, 19, '555-2019'),
('Tess', 'Orton', 'tess.orton@library.org', '2023-08-30', 52500, 20, '555-2020'),
('Umar', 'Calhoun', 'umar.calhoun@library.org', '2020-09-11', 53000, 21, '555-2021'),
('Vera', 'McBride', 'vera.mcbride@library.org', '2021-10-14', 53500, 22, '555-2022'),
('Will', 'Jeffers', 'will.jeffers@library.org', '2022-11-18', 54000, 23, '555-2023'),
('Xena', 'Byrd', 'xena.byrd@library.org', '2023-12-21', 54500, 24, '555-2024'),
('Yusuf', 'Nieves', 'yusuf.nieves@library.org', '2020-01-25', 55000, 25, '555-2025')
;

-- select * from EMPLOYEE;
-- ------------------------------------------------------------------------

insert into author(first_name, last_name, email, phone_number)
values
('Alice', 'Monroe', 'alice.monroe@books.org', '555-1001'),
('Brian', 'Dalton', 'brian.dalton@books.org', '555-1002'),
('Carla', 'Morris', 'carla.morris@books.org', '555-1003'),
('Daniel', 'Frost', 'daniel.frost@books.org', '555-1004'),
('Eva', 'Brooks', 'eva.brooks@books.org', '555-1005'),
('Frank', 'Hart', 'frank.hart@books.org', '555-1006'),
('Grace', 'Langston', 'grace.langston@books.org', '555-1007'),
('Henry', 'Quinn', 'henry.quinn@books.org', '555-1008'),
('Isla', 'Everett', 'isla.everett@books.org', '555-1009'),
('Jack', 'Vernon', 'jack.vernon@books.org', '555-1010'),
('Kylie', 'Sanders', 'kylie.sanders@books.org', '555-1011'),
('Liam', 'Patton', 'liam.patton@books.org', '555-1012'),
('Maya', 'Norris', 'maya.norris@books.org', '555-1013'),
('Noah', 'Greene', 'noah.greene@books.org', '555-1014'),
('Olive', 'Carter', 'olive.carter@books.org', '555-1015'),
('Paul', 'Ellis', 'paul.ellis@books.org', '555-1016'),
('Quinn', 'Fleming', 'quinn.fleming@books.org', '555-1017'),
('Ruby', 'Caldwell', 'ruby.caldwell@books.org', '555-1018'),
('Sam', 'Jennings', 'sam.jennings@books.org', '555-1019'),
('Tina', 'Baldwin', 'tina.baldwin@books.org', '555-1020'),
('Umar', 'Lawson', 'umar.lawson@books.org', '555-1021'),
('Violet', 'Page', 'violet.page@books.org', '555-1022'),
('Will', 'Newton', 'will.newton@books.org', '555-1023'),
('Xena', 'Dawson', 'xena.dawson@books.org', '555-1024'),
('Yusuf', 'Murray', 'yusuf.murray@books.org', '555-1025')
;

-- select * from AUTHOR;

-- ------------------------------------------------------------------------

insert into BOOK_CATEGORY(category_name)
values
('Science Fiction'),
('Fantasy'),
('Mystery'),
('Thriller'),
('Romance'),
('Historical Fiction'),
('Young Adult'),
('Literature'),
('Biography'),
('Autobiography'),
('Self-help'),
('Health & Wellness'),
('Travel'),
('Science'),
('Technology'),
('Philosophy'),
('Religion'),
('Poetry'),
('Drama'),
('Horror'),
('Comics & Graphic Novels'),
('Cooking'),
('Art & Photography'),
('Education'),
('Business & Economics')
;

-- select * from BOOK_CATEGORY;

-- ------------------------------------------------------------------------

insert into publisher(publisher_name)
values
('Penguin Random House'),
('HarperCollins'),
('Macmillan Publishers'),
('Simon & Schuster'),
('Hachette Book Group'),
('Scholastic Inc.'),
('Pearson Education'),
('Oxford University Press'),
('Cambridge University Press'),
('Wiley'),
('Springer Nature'),
('Cengage Learning'),
('McGraw-Hill Education'),
('SAGE Publications'),
('Elsevier'),
('Bloomsbury Publishing'),
('Thames & Hudson'),
('Chronicle Books'),
('Abrams Books'),
('Workman Publishing'),
('Sourcebooks'),
('Zondervan'),
('Candlewick Press'),
('Andrews McMeel Publishing'),
('Hay House')
;

-- select * from PUBLISHER;

-- ------------------------------------------------------------------------

insert into book(title, publication_year, publisher_id, isbn, book_category_id)
values
('The Lost Horizon', 2020, 11, '9780000000001', 1),
('Whispers in the Wind', 2021, 2, '9780000000002', 2),
('Echoes of the Past', 2019, 3, '9780000000003', 3),
('Shadows of the Night', 2022, 4, '9780000000004', 4),
('The Hidden Key', 2018, 5, '9780000000005', 5),
('Rise of the Phoenix', 2023, 6, '9780000000006', 1),
('Tales from the East', 2021, 7, '9780000000007', 2),
('The Iron Will', 2020, 8, '9780000000008', 3),
('Footprints in Snow', 2017, 9, '9780000000009', 4),
('Song of the River', 2023, 10, '9780000000010', 5),
('The Final Chapter', 2019, 11, '9780000000011', 1),
('Memoirs of a Stranger', 2022, 12, '9780000000012', 2),
('The Silent City', 2018, 13, '9780000000013', 3),
('Beyond the Veil', 2020, 14, '9780000000014', 4),
('The Third Empire', 2021, 15, '9780000000015', 5),
('Into the Light', 2023, 16, '9780000000016', 1),
('Fires of Dawn', 2017, 17, '9780000000017', 2),
('Labyrinth of Lies', 2019, 18, '9780000000018', 3),
('Crimson Skies', 2022, 19, '9780000000019', 4),
('Beneath the Ice', 2020, 20, '9780000000020', 5),
('Letters to the Future', 2023, 21, '9780000000021', 1),
('The Forgotten Path', 2018, 22, '9780000000022', 2),
('Waves of Tomorrow', 2019, 23, '9780000000023', 3),
('Glass Kingdom', 2022, 24, '9780000000024', 4),
('Chronicles of Time', 2021, 25, '9780000000025', 5),
('Winds of the North', 2019, 11, '9781111000001', 1),
('Dawnlight Chronicles', 2020, 2, '9781111000002', 2),
('Harbor of Secrets', 2021, 3, '9781111000003', 3),
('The Clockmaker''s Dilemma', 2018, 4, '9781111000004', 4),
('Empire of Dust', 2022, 5, '9781111000005', 5),
('The Ice Garden', 2017, 6, '9781111000006', 1),
('Fragments of Echoes', 2016, 7, '9781111000007', 2),
('Beneath Iron Stars', 2023, 8, '9781111000008', 3),
('The Lantern Shore', 2021, 9, '9781111000009', 4),
('Stormbound', 2020, 10, '9781111000010', 5),
('Frostfire Accord', 2019, 11, '9781111000011', 1),
('Petals on the Void', 2022, 12, '9781111000012', 2),
('The Ember Room', 2018, 13, '9781111000013', 3),
('Whispers in Ink', 2023, 14, '9781111000014', 4),
('Kingdom of Ashes', 2021, 15, '9781111000015', 5),
('Shattered Grove', 2020, 16, '9781111000016', 1),
('The Celestial Tides', 2017, 17, '9781111000017', 2),
('Voices in Amber', 2016, 18, '9781111000018', 3),
('A Winter Pact', 2022, 19, '9781111000019', 4),
('Chronicles of Glass', 2023, 20, '9781111000020', 5),
('Spire of Midnight', 2018, 21, '9781111000021', 1),
('Gardens of Mist', 2021, 22, '9781111000022', 2),
('The Hollow Eye', 2019, 23, '9781111000023', 3),
('Shadows of Reign', 2020, 24, '9781111000024', 4),
('Maze of the Forgotten', 2023, 25, '9781111000025', 5)
;

-- select * from BOOK;

-- ------------------------------------------------------------------------

insert into BOOK_AUTHOR(book_id, author_id)
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
(20, 20),
(21, 21),
(22, 22),
(23, 23),
(24, 24),
(25, 25)
;

-- select * from BOOK_AUTHOR;

-- ------------------------------------------------------------------------

insert into book_inventory(book_id, branch_id, quantity)
values
(1, 12, 33),
(2, 2, 8),
(3, 3, 15),
(4, 4, 10),
(5, 5, 7),
(6, 6, 14),
(7, 7, 9),
(8, 8, 13),
(9, 9, 11),
(10, 10, 6),
(11, 11, 18),
(12, 12, 5),
(13, 13, 20),
(14, 14, 16),
(15, 15, 4),
(16, 16, 17),
(17, 17, 19),
(18, 18, 3),
(19, 19, 21),
(20, 20, 2),
(21, 21, 22),
(22, 22, 1),
(23, 23, 23),
(24, 24, 25),
(25, 25, 24)
;

-- select * from BOOK_INVENTORY;

-- ------------------------------------------------------------------------

insert into OVERDUE_POLICY(max_days_allowed, fine_per_day)
values
(5, 0.25),
(6, 0.30),
(7, 0.35),
(8, 0.40),
(9, 0.45),
(10, 0.50),
(11, 0.55),
(12, 0.60),
(13, 0.65),
(14, 0.70),
(15, 0.75),
(16, 0.80),
(17, 0.85),
(18, 0.90),
(19, 0.95),
(20, 1.00),
(21, 1.05),
(22, 1.10),
(23, 1.15),
(24, 1.20),
(25, 1.25),
(26, 1.30),
(27, 1.35),
(28, 1.40),
(30, 1.50)
;

-- select * from OVERDUE_POLICY;

-- ------------------------------------------------------------------------

insert into members(first_name, last_name, email, phone_number, gender, membership_expiry_date)
values
('Alice', 'Walker', 'alice.walker@example.com', '9123456780', 'F', '2025-12-31'),
('Brian', 'Adams', 'brian.adams@example.com', '9123456781', 'M', '2026-01-15'),
('Carla', 'Jenkins', 'carla.jenkins@example.com', '9123456782', 'F', '2025-11-20'),
('Daniel', 'Lee', 'daniel.lee@example.com', '9123456783', 'M', '2026-02-10'),
('Eva', 'Martins', 'eva.martins@example.com', '9123456784', 'F', '2025-10-05'),
('Frank', 'Nguyen', 'frank.nguyen@example.com', '9123456785', 'M', '2026-03-18'),
('Grace', 'Kim', 'grace.kim@example.com', '9123456786', 'F', '2025-09-14'),
('Henry', 'Lopez', 'henry.lopez@example.com', '9123456787', 'M', '2026-04-01'),
('Ivy', 'Thomas', 'ivy.thomas@example.com', '9123456788', 'F', '2025-08-30'),
('Jack', 'White', 'jack.white@example.com', '9123456789', 'M', '2026-05-12'),
('Karen', 'Black', 'karen.black@example.com', '9123456790', 'F', '2025-07-07'),
('Liam', 'Green', 'liam.green@example.com', '9123456791', 'M', '2026-06-25'),
('Mona', 'Brown', 'mona.brown@example.com', '9123456792', 'F', '2025-06-01'),
('Nathan', 'Scott', 'nathan.scott@example.com', '9123456793', 'M', '2026-07-15'),
('Olivia', 'Davis', 'olivia.davis@example.com', '9123456794', 'F', '2025-05-20'),
('Paul', 'Turner', 'paul.turner@example.com', '9123456795', 'M', '2026-08-30'),
('Quinn', 'Hughes', 'quinn.hughes@example.com', '9123456796', 'F', '2025-04-10'),
('Ryan', 'Ward', 'ryan.ward@example.com', '9123456797', 'M', '2026-09-17'),
('Sophie', 'Wells', 'sophie.wells@example.com', '9123456798', 'F', '2025-03-12'),
('Tom', 'Bishop', 'tom.bishop@example.com', '9123456799', 'M', '2026-10-05'),
('Uma', 'Foster', 'uma.foster@example.com', '9123456700', 'F', '2025-02-08'),
('Victor', 'Gray', 'victor.gray@example.com', '9123456701', 'M', '2026-11-22'),
('Wendy', 'Reed', 'wendy.reed@example.com', '9123456702', 'F', '2025-01-01'),
('Xavier', 'Knight', 'xavier.knight@example.com', '9123456703', 'M', '2026-12-31'),
('Yara', 'Stone', 'yara.stone@example.com', '9123456704', 'F', '2025-11-11')
;

-- select * from MEMBERS;

-- ------------------------------------------------------------------------

insert into MEMBERSHIP_TYPE(MEMBERSHIP_TYPE, validity_days)
values
('Free', 30),
('Standard', 365),
('Standard', 365),
('Free', 30),
('Standard', 365),
('Standard', 365),
('Free', 30),
('Standard', 365),
('Standard', 365),
('Free', 30),
('Standard', 365),
('Standard', 365),
('Free', 30),
('Standard', 365),
('Standard', 365),
('Free', 30),
('Standard', 365),
('Free', 365),
('Free', 30),
('Standard', 365),
('Free', 365),
('Free', 30),
('Standard', 365),
('Free', 365),
('Free', 30)
;

-- select * from MEMBERSHIP_TYPE;

-- ------------------------------------------------------------------------

insert into MEMBERSHIP_PAYMENT(MEMBERSHIP_TYPE_id, amount_paid, payment_date, member_id)
values
(1, 50.00, '2025-01-15', 1),
(2, 75.00, '2025-01-20', 2),
(3, 100.00, '2025-02-10', 3),
(1, 50.00, '2025-02-15', 4),
(2, 75.00, '2025-03-05', 5),
(3, 100.00, '2025-03-20', 6),
(1, 50.00, '2025-04-01', 7),
(2, 75.00, '2025-04-10', 8),
(3, 100.00, '2025-04-22', 9),
(1, 50.00, '2025-05-03', 10),
(2, 75.00, '2025-05-15', 11),
(3, 100.00, '2025-05-28', 12),
(1, 50.00, '2025-06-05', 13),
(2, 75.00, '2025-06-17', 14),
(3, 100.00, '2025-06-30', 15),
(1, 50.00, '2025-07-08', 16),
(2, 75.00, '2025-07-20', 17),
(3, 100.00, '2025-08-01', 18),
(1, 50.00, '2025-08-12', 19),
(2, 75.00, '2025-08-25', 20),
(3, 100.00, '2025-09-05', 21),
(1, 50.00, '2025-09-18', 22),
(2, 75.00, '2025-10-01', 23),
(3, 100.00, '2025-10-14', 24),
(1, 50.00, '2025-10-27', 25)
;

-- select * from MEMBERSHIP_PAYMENT;

-- ------------------------------------------------------------------------
-- select * from employee;

insert into loan(loan_date, due_date, return_date, book_id, member_id, issue_branch_id, employee_id)
values
('2025-01-01', '2025-01-15', '2025-01-10', 1, 1, 1, 1),
('2025-01-03', '2025-01-17', NULL, 2, 2, 2, 2),
('2025-01-05', '2025-01-20', '2025-01-19', 3, 3, 3, 3),
('2025-01-07', '2025-01-21', NULL, 4, 4, 4, 4),
('2025-01-09', '2025-01-23', '2025-01-20', 5, 5, 5, 5),
('2025-01-11', '2025-01-25', NULL, 6, 6, 1, 6),
('2025-01-13', '2025-01-27', '2025-01-26', 7, 7, 2, 7),
('2025-01-15', '2025-01-29', NULL, 8, 8, 3, 8),
('2025-01-17', '2025-01-31', '2025-01-30', 9, 9, 4, 9),
('2025-01-19', '2025-02-02', NULL, 10, 10, 5, 10),
('2025-02-01', '2025-02-15', NULL, 1, 11, 1, 1),
('2025-02-03', '2025-02-17', '2025-02-15', 2, 12, 2, 2),
('2025-02-05', '2025-02-19', NULL, 3, 13, 3, 3),
('2025-02-07', '2025-02-21', NULL, 4, 14, 4, 4),
('2025-02-09', '2025-02-23', '2025-02-20', 5, 15, 5, 5),
('2025-02-11', '2025-02-25', NULL, 6, 16, 1, 6),
('2025-02-13', '2025-02-27', '2025-02-26', 7, 17, 2, 7),
('2025-02-15', '2025-03-01', NULL, 8, 18, 3, 8),
('2025-02-17', '2025-03-03', '2025-03-02', 9, 19, 4, 9),
('2025-02-19', '2025-03-05', NULL, 10, 20, 5, 10),
('2025-03-01', '2025-03-15', NULL, 1, 21, 1, 1),
('2025-03-03', '2025-03-17', NULL, 2, 22, 2, 2),
('2025-03-05', '2025-03-19', '2025-03-18', 3, 23, 3, 3),
('2025-03-07', '2025-03-21', NULL, 4, 24, 4, 4),
('2025-03-09', '2025-03-23', '2025-03-22', 5, 25, 5, 5)
;

-- select * from  LOAN;

-- ------------------------------------------------------------------------

insert into fine(fine_amount, fine_date, overdue_days, return_time, loan_id, collected_by_employee_id, collected_branch_id)
values
(5.00, '2025-01-16', 1, '10:30:00', 1, 1, 1),
(10.00, '2025-01-18', 2, '11:15:00', 2, 2, 2),
(3.00, '2025-01-21', 1, '12:00:00', 3, 3, 3),
(7.50, '2025-01-23', 3, '09:45:00', 4, 4, 4),
(6.00, '2025-01-25', 2, '14:20:00', 5, 5, 5),
(4.00, '2025-01-28', 1, '13:30:00', 6, 6, 1),
(8.00, '2025-02-01', 4, '15:00:00', 7, 7, 2),
(9.50, '2025-02-03', 3, '16:10:00', 8, 8, 3),
(2.00, '2025-02-05', 1, '08:00:00', 9, 9, 4),
(12.00, '2025-02-07', 5, '17:30:00', 10, 10, 5),
(5.50, '2025-02-09', 2, '10:00:00', 11, 1, 1),
(6.75, '2025-02-11', 2, '11:30:00', 12, 2, 2),
(3.25, '2025-02-13', 1, '12:45:00', 13, 3, 3),
(4.80, '2025-02-15', 2, '13:50:00', 14, 4, 4),
(7.00, '2025-02-17', 3, '14:10:00', 15, 5, 5),
(6.20, '2025-02-19', 2, '15:25:00', 16, 6, 1),
(5.00, '2025-02-21', 1, '16:40:00', 17, 7, 2),
(8.30, '2025-02-23', 4, '09:15:00', 18, 8, 3),
(2.50, '2025-02-25', 1, '10:10:00', 19, 9, 4),
(9.00, '2025-02-27', 3, '11:45:00', 20, 10, 5),
(4.10, '2025-03-01', 1, '12:20:00', 21, 1, 1),
(6.60, '2025-03-03', 2, '13:10:00', 22, 2, 2),
(7.90, '2025-03-05', 3, '14:40:00', 23, 3, 3),
(5.75, '2025-03-07', 2, '15:55:00', 24, 4, 4),
(3.60, '2025-03-09', 1, '16:50:00', 25, 5, 5)
;

-- select * from FINE;

-- ------------------------------------------------------------------------

-- select * from AUDIT_LOG;


-- ------------------------------------------------------------------------

-- select * from EMPLOYEE_LOGIN;


-- ------------------------------------------------------------------------

