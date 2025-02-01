--mysql
set sql_safe_updates=0;

-- ==================================
-- Question 1: Insert Data into all Tables

-- 1. CITY Table
select * from city;
INSERT INTO CITY (country_name, city_name)
VALUES
('USA', 'Los Angeles'),
('Canada', 'Toronto'),
('Canada', 'Vancouver'),
('UK', 'London'),
('UK', 'Manchester'),
('Germany', 'Berlin'),
('Germany', 'Munich'),
('France', 'Paris'),
('France', 'Marseille');
INSERT INTO CITY (country_name, city_name)
VALUES
('USA', 'New York');

-- 2. BRANCH Table
select * from BRANCH;
INSERT INTO BRANCH (branch_name, branch_location, city_id)
VALUES
('Main Branch', 'Downtown', 1),
('Westside Branch', 'West End', 2),
('North Branch', 'North Avenue', 3),
('East Branch', 'East Park', 4),
('Central Branch', 'City Center', 5),
('South Branch', 'South Mall', 6),
('Airport Branch', 'Airport Terminal', 7),
('Suburban Branch', 'Suburb Street', 8	),
('Business District Branch', 'Business Park', 9),
('Corporate Branch', 'Corporate Plaza', 10);

update branch set branch_id = 2 where branch_id = 22
update branch		set branch_id = 3 where branch_id = 23
update branch		set branch_id = 4 where branch_id = 24
update branch		set branch_id = 5 where branch_id = 25
update branch		set branch_id = 6 where branch_id = 26
update branch		set branch_id = 7 where branch_id = 27
update branch		set branch_id = 8 where branch_id = 28
update branch		set branch_id = 9 where branch_id = 29
update branch		set branch_id = 10 where branch_id = 30
update branch set city_id = 10 where branch_id = 10;

-- 3. EMPLOYEE Table
select * from EMPLOYEE;
INSERT INTO EMPLOYEE (first_name, last_name, hire_date, salary, branch_id, city_id, phone_number)
VALUES
('John', 'Doe', '2020-01-15', 50000.00, 1, 1, '123-456-7890'),
('Jane', 'Smith', '2021-03-10', 60000.00, 2, 2, '234-567-8901'),
('Sam', 'Brown', '2022-04-20', 45000.00, 3, 3, '345-678-9012'),
('Alice', 'Davis', '2019-05-05', 55000.00, 4, 4, '456-789-0123'),
('Bob', 'Miller', '2020-06-11', 47000.00, 5, 5, '567-890-1234'),
('Charlie', 'Wilson', '2021-07-01', 70000.00, 6, 6, '678-901-2345'),
('Emma', 'Taylor', '2022-08-15', 48000.00, 7, 7, '789-012-3456'),
('David', 'Anderson', '2018-09-25', 62000.00, 8, 8, '890-123-4567'),
('Olivia', 'Thomas', '2020-10-05', 53000.00, 9, 9, '901-234-5678'),
('Lucas', 'Jackson', '2021-11-12', 51000.00, 10, 10, '012-345-6789');

-- 4. CUSTOMER Table
select * from CUSTOMER order by customer_id;
INSERT INTO CUSTOMER (first_name, last_name, gender, ID_type, ID_number, email, phone_number, address, city_id, branch_id)
VALUES
('Michael', 'Johnson', 'M', 'Passport', '123456789', 'michael.johnson@email.com', '123-456-7890', '123 Elm St', 1, 1),
('Emily', 'Williams', 'F', 'Driver License', '987654321', 'emily.williams@email.com', '234-567-8901', '456 Oak St', 2, 2),
('James', 'Jones', 'M', 'National ID', '1122334455', 'james.jones@email.com', '345-678-9012', '789 Pine St', 3, 3),
('Sarah', 'Brown', 'F', 'Passport', '2233445566', 'sarah.brown@email.com', '456-789-0123', '321 Maple St', 4, 4),
('David', 'Miller', 'M', 'Driver License', '3344556677', 'david.miller@email.com', '567-890-1234', '654 Cedar St', 5, 5),
('Laura', 'Davis', 'F', 'National ID', '4455667788', 'laura.davis@email.com', '678-901-2345', '987 Birch St', 6, 6),
('Sophia', 'Garcia', 'F', 'Passport', '5566778899', 'sophia.garcia@email.com', '789-012-3456', '321 Willow St', 7, 7),
('Daniel', 'Rodriguez', 'M', 'Driver License', '6677889900', 'daniel.rodriguez@email.com', '890-123-4567', '654 Redwood St', 8, 8),
('Madison', 'Martinez', 'F', 'National ID', '7788990011', 'madison.martinez@email.com', '901-234-5678', '987 Pineapple St', 9, 9),
('Christopher', 'Hernandez', 'M', 'Passport', '8899001122', 'christopher.hernandez@email.com', '012-345-6789', '321 Maplewood St', 10, 10);


-- 5. ACCOUNT Table
INSERT INTO ACCOUNT (account_type, balance, customer_id)
VALUES
('checking', 1000.00, 11),
('savings', 5000.00, 12),
('checking', 1500.00, 13),
('loan', 10000.00, 14),
('savings', 3000.00, 15),
('checking', 2000.00, 16),
('current', 800.00, 17),
('loan', 12000.00, 18),
('savings', 15000.00, 19),
('checking', 2500.00, 20);
select * from account;

-- 6. CARD Table
select * from CARD;

INSERT INTO CARD (card_number, card_type, expiration_date, max_credit_limit, available_credit_limit, account_id)
VALUES
('1234567890123456', 'debit', '2026-12-31', 5000.00, 2000.00, 1),
('2345678901234567', 'credit', '2027-05-15', 10000.00, 8000.00, 2),
('3456789012345678', 'debit', '2025-10-01', 3000.00, 1500.00, 3),
('4567890123456789', 'credit', '2027-11-20', 15000.00, 10000.00, 4),
('5678901234567890', 'debit', '2026-07-10', 4000.00, 2500.00, 5),
('6789012345678901', 'credit', '2028-03-30', 20000.00, 18000.00, 6),
('7890123456789012', 'debit', '2024-08-25', 5000.00, 3000.00, 7),
('8901234567890123', 'credit', '2027-02-05', 8000.00, 5000.00, 8),
('9012345678901234', 'debit', '2025-04-22', 6000.00, 3500.00, 9),
('0123456789012345', 'credit', '2026-09-14', 12000.00, 7000.00, 10);

-- 7. TRANSACTION Table
select * from TRANSACTION;

INSERT INTO TRANSACTION (transaction_date, amount, transaction_type, payment_mode, account_id, transaction_status, description)
VALUES
('2024-01-01', 100.00, 'debit', 'ATM', 1, 'completed', 'ATM withdrawal'),
('2024-01-02', 500.00, 'credit', 'fund transfer', 2, 'completed', 'Transfer from account'),
('2024-01-03', 150.00, 'debit', 'debit card', 3, 'completed', 'Purchase at store'),
('2024-01-04', 1000.00, 'credit', 'loan payment', 4, 'completed', 'Loan repayment'),
('2024-01-05', 300.00, 'debit', 'ATM', 5, 'completed', 'ATM withdrawal'),
('2024-01-06', 700.00, 'credit', 'cash deposit', 6, 'completed', 'Cash deposit'),
('2024-01-07', 200.00, 'debit', 'fund transfer', 7, 'completed', 'Payment to vendor'),
('2024-01-08', 1500.00, 'credit', 'fees', 8, 'completed', 'Service fees'),
('2024-01-09', 400.00, 'debit', 'debit card', 9, 'completed', 'Online purchase'),
('2024-01-10', 250.00, 'credit', 'loan payment', 10, 'completed', 'Loan repayment');

-- 8. ACCOUNT_HISTORY Table
select * from ACCOUNT_HISTORY;

INSERT INTO ACCOUNT_HISTORY (account_id, balance_before, balance_after, transaction_id)
VALUES
(1, 1000.00, 900.00, 1),
(2, 5000.00, 4500.00, 2),
(3, 1500.00, 1350.00, 3),
(4, 10000.00, 9000.00, 4),
(5, 3000.00, 2700.00, 5),
(6, 2000.00, 1700.00, 6),
(7, 800.00, 600.00, 7),
(8, 12000.00, 10500.00, 8),
(9, 15000.00, 14600.00, 9),
(10, 2500.00, 2250.00, 10);

-- 9. LOAN Table
select * from LOAN;
select * from employee;
INSERT INTO LOAN (loan_amount, number_of_monthly_instalments, interest_rate, loan_start_date, account_id, created_employee_id)
VALUES
(10000.00, 12, 5.00, '2024-01-01', 4, 11),
(12000.00, 18, 4.00, '2024-02-01', 8, 2),
(15000.00, 24, 6.00, '2024-03-01', 9, 3),
(20000.00, 30, 7.00, '2024-04-01', 10, 4),
(18000.00, 36, 5.50, '2024-05-01', 6, 5),
(22000.00, 12, 5.75, '2024-06-01', 7, 6),
(25000.00, 24, 6.25, '2024-07-01', 5, 7),
(30000.00, 48, 7.50, '2024-08-01', 2, 8),
(35000.00, 36, 8.00, '2024-09-01', 3, 9),
(40000.00, 24, 7.25, '2024-10-01', 1, 10);

-- 10. LOAN_INSTALMENTS Table
select * from LOAN_INSTALMENTS;
INSERT INTO LOAN_INSTALMENTS (loan_id, instalment_amount, due_date)
VALUES
(11, 850.00, '2024-02-01'),
(12, 800.00, '2024-03-01'),
(13, 625.00, '2024-04-01'),
(14, 700.00, '2024-05-01'),
(15, 500.00, '2024-06-01'),
(16, 900.00, '2024-07-01'),
(17, 700.00, '2024-08-01'),
(18, 750.00, '2024-09-01'),
(19, 875.00, '2024-10-01'),
(20, 950.00, '2024-11-01');

-- ==================================
-- Question 2: Insert a New City
select * from city;
INSERT INTO CITY 
    (country_name,
    city_name)
VALUES (
    'India'
    , 'Mumbai');

-- ==================================
-- Question 3: Insert a New Customer
INSERT INTO CUSTOMER 
    (first_name, 
    last_name, 
    gender, 
    ID_type, 
    ID_number, 
    email, 
    phone_number, 
    address, 
    city_id, 
    branch_id)
VALUES 
    ('Ravi', 
    'Kumar', 
    'M', 
    'Passport', 
    'A123456789', 
    'ravi.kumar@email.com', 
    '987-654-3210', 
    '123 Sea Breeze St', 
    1, 
    1);


-- ==================================
-- Question 4: Insert Multiple Accounts for a Customer using single sql statement
select * from customer
select * from ACCOUNT
INSERT INTO ACCOUNT 
(account_type, 
balance, 
customer_id)
VALUES 
('checking', 1000.00, 11),
('savings', 5000.00, 11),
('loan', 15000.00, 11),
('current', 2000.00, 11),
('checking', 2000.00, 12),
('savings', 6000.00, 12);
-- ==================================
/*Question 5: Insert Data Using Subquery
Write an SQL INSERT statement using a subquery to add a new customer into the CUSTOMER table. 
The customer should be added to a city that already exists in the CITY table without directly using the city_id.*/
INSERT INTO CUSTOMER 
    (first_name, 
    last_name, 
    gender, 
    ID_type, 
    ID_number, 
    email, 
    phone_number, 
    address, 
    city_id, 
    branch_id)
VALUES 
    ('Michael', 
    'Brown', 
    'M', 
    'Driver License', 
    'B987654321', 
    'michael.brown@email.com', 
    '555-123-4567', 
    '789 Sunset Blvd', 
    (SELECT city_id FROM CITY WHERE city_name = 'London' AND country_name = 'UK' LIMIT 1),
    1)
    ;
-- ==================================
/*
Question 6: Insert Data Using Subquery
Assume the CITY, ACCOUNT, and CUSTOMER tables are already set up and populated. 
Write an SQL INSERT statement using a subquery that adds a new entry to the ACCOUNT table for an existing customer. 
The customer is identified by their last name and email, and the account should be created only 
if the customer lives in a specific city ('Los Angeles').
*/
select * from account;
select * from customer;
select * from city;

INSERT INTO ACCOUNT 
(account_type, 
balance, 
customer_id)
SELECT 
    'checking', 
    2000.00, 
    (SELECT customer_id 
     FROM CUSTOMER c
     JOIN CITY ci ON c.city_id = ci.city_id
     WHERE c.last_name = 'Brown' 
     AND c.email = 'michael.brown@email.com'
     AND ci.city_name = 'London' 
     LIMIT 1);
-- ==================================
/*
Question 7: Select Into
Write a SQL statement to create a backup of all rows in the TRANSACTION table into a new table TRANSACTION_BACKUP.
*/

CREATE TABLE TRANSACTION_BACKUP AS
SELECT * FROM TRANSACTION;

-- ==================================
/*
Question 8: Insert a Record into the AUDIT_LOG Table with Default Values
Insert a record into the AUDIT_LOG table using default values for all fields except action,
which should be set to 'Data Cleanup'.
*/
select * from AUDIT_LOG;
select * from employee;

INSERT INTO AUDIT_LOG (action, employee_id)
VALUES ('Data Cleanup',2);
-- ==================================
/*
Question 9: Simple UPDATE
Write an SQL statement to update the country_name in the CITY table to "USA" where the city_name is "New York".
*/
UPDATE `CITY`
SET `country_name` = 'USA'
WHERE `city_name` = 'New York';

select * from city;
update city set country_name = 'USA' where city_name = 'New York'

insert into city(country_name, city_name) values ('US','New York');
-- ==================================
/*Question 10: Upsert (INSERT ON CONFLICT)
Write a SQL statement to insert a new CUSTOMER record or update the email if the customer_id already exists.*/
INSERT INTO `CUSTOMER` (customer_id, `first_name`, `last_name`, `gender`, `ID_type`, `ID_number`, `email`, `phone_number`, `address`, `city_id`, `branch_id`)
VALUES (13,'Sarah', 'Smith', 'F', 'Passport', 'A1234555589', 'sarah.me@email.com', '555-123-4567', '123 Maple St', 1, 1)
ON DUPLICATE KEY UPDATE `email` = 'sarah.me@newemail.com';
-- ==================================
/*Question 11: Update with Subquery
Write a SQL statement to update the balance of an account based on the total of all transactions for that account.*/
UPDATE `ACCOUNT` a
SET `balance` = (
				SELECT SUM(t.`amount`)
				FROM `TRANSACTION` t
				WHERE t.`account_id` = 1
				)
WHERE a.`account_id` = 1;
-- ==================================
/*
Question 12: Update with Join
Write an SQL statement to update the balance in the ACCOUNTS table using the balance_after value from the ACCOUNT_HISTORY table. Ensure that the balance_after is taken from the most recent records where latest_record is true. Only perform the update when there is a discrepancy between the current balance in the ACCOUNTS table and the balance_after value from the ACCOUNT_HISTORY table.
*/
UPDATE `ACCOUNT` a
JOIN `ACCOUNT_HISTORY` ah
    ON a.`account_id` = ah.`account_id`
    AND ah.`latest_record` = 1
SET a.`balance` = ah.`balance_after`
WHERE a.`balance` != ah.`balance_after`;
-- ==================================
-- Question 13: Delete Records
-- Write a SQL statement to delete all transactions where the amount is less than 50.
DELETE FROM `TRANSACTION`
WHERE `amount` < 50;
-- ==================================
/*Question 14: Delete with Join
Write a SQL statement to delete all accounts of customers who have no transactions, using a join between ACCOUNT and TRANSACTION.*/
DELETE a
FROM `ACCOUNT` a
LEFT JOIN `TRANSACTION` t
    ON a.`account_id` = t.`account_id`
WHERE t.`account_id` IS NULL;
-- ==================================
-- Question 15: Add a JSON Column to the CUSTOMER Table
-- Write a SQL statement to add a customer_info column of type JSON to the CUSTOMER table.
ALTER TABLE `CUSTOMER`
ADD COLUMN `customer_info` JSON;
-- ==================================
/*Question 16: Insert Data into JSON Column
Insert a new record into the CUSTOMER table and add JSON data into the customer_info column. Add designation, education and spouse_name as JSON elements.
*/
INSERT INTO `CUSTOMER` 
	(`first_name`, 
	`last_name`, 
	`gender`, 
	`ID_type`, 
	`ID_number`, 
	`email`, 
	`phone_number`, 
	`address`, 
	`city_id`, 
	`branch_id`, 
	`customer_info`)
VALUES 
	('Hillary', 
	'Clinton', 
	'M', 
	'Passport', 
	'A134234', 
	'h.clinton@email.com', 
	'555-123-4567', 
	'123 Maple St', 
	1, 
	1, 
	'{"designation": "Software Engineer", "education": "Masters in Computer Science"}'
	);

-- ==================================
/*
Question 17: Update JSON Column
Write a SQL statement to update the spouse_name field in the customer_info JSON column of the CUSTOMER table to "Riley M" where the customer_id is 1.
*/
UPDATE `CUSTOMER`
SET `customer_info` = JSON_SET(`customer_info`, '$.education', 'PHD')
WHERE `customer_id` = 15;
-- ==================================
/*
Question 18: Update JSON Column with Nested Data
Write a SQL statement to update the meta_data field in the ACCOUNT table, adding a new key-value pair ("verified": true) into the existing JSON data.*/
UPDATE CUSTOMER
SET customer_info = JSON_SET(customer_info, '$.verified', true)
WHERE customer_id =15;

-- ==================================
/*Question 19: Truncate the AUDIT_LOG Table
Write a SQL statement to truncate the AUDIT_LOG table, removing all rows without generating individual delete triggers.*/
TRUNCATE TABLE AUDIT_LOG;

-- ==================================
/*
Question 20: Complex UPDATE.
Write an SQL statement to update the loan_end_date in the LOAN table based on the loan_amount, number_of_monthly_installments, and loan_start_date.
*/
UPDATE LOAN
SET loan_end_date = DATE_ADD(loan_start_date, INTERVAL number_of_monthly_instalments MONTH);


-- ==================================
/*
Question 21: SUPER Complex INSERT.
Write a single INSERT SQL statement to insert multiple loan installment records into the LOAN_INSTALMENTS table based on each loan record from the LOAN table.

Create a DATE_DIM table with columns: date_id, year, month, month_start_date and month_end_date.
The date_id should be populated in the YYYYMM format (e.g., 202401).
Populate the DATE_DIM table with data for a 30-year period, starting from 2020 through 2050.
Join the LOAN table with the DATE_DIM table to insert data into the LOAN_INSTALMENTS table, ensuring that each loan record is matched with the corresponding installment dates.
Monthly instalment_amount must be calculated based of interest_rate from LOAN table.
You can use online loan calculators, such as this one, to verify your final loan installment data.(https://cred.club/calculators/simple-loan-calculator)
*/
CREATE TABLE DATE_DIM (
  date_id INT NOT NULL,
  calendar_date DATE NOT NULL,
  year INT NOT NULL,
  month INT NOT NULL,
  day_of_the_month INT NOT NULL,
  week_day_number INT NOT NULL,
  week_day_name VARCHAR(10) NOT NULL,
  yearly_week_number INT NOT NULL,
  month_start_date_flag BOOLEAN NOT NULL default false,
  month_end_date_flag BOOLEAN NOT NULL default false,
  year_start_date_flag BOOLEAN NOT NULL default false,
  year_end_date_flag BOOLEAN NOT NULL default false,
  holiday_flag BOOLEAN DEFAULT FALSE default false,
  PRIMARY KEY (date_id)
);

INSERT INTO DATE_DIM (date_id, calendar_date, year, month, day_of_the_month, week_day_number,week_day_name, yearly_week_number) 
WITH RECURSIVE DateSeries AS (
    SELECT DATE('2025-01-01') AS dt
    UNION ALL
    SELECT DATE_ADD(dt, INTERVAL 1 DAY)
    FROM DateSeries
    WHERE dt < '2026-12-31'
)
SELECT DATE_FORMAT(dt, '%Y%m%d') AS  date_id,
    dt AS calendar_date,
     YEAR( dt) AS year,
     month( dt) AS month,
     day( dt) AS day_of_the_month,
     weekday(dt) as week_day_number,
     DAYNAME(dt) as week_day_name,
     WEEKOFYEAR(dt) as yearly_week_number
FROM DateSeries;

-- month_start_date_flag 
update DATE_DIM
set month_start_date_flag = true 
where day_of_the_month = 1;

-- month_end_date_flag 
UPDATE `DATE_DIM` a
JOIN (select year, month, max(day_of_the_month) as max_day_of_the_month
		from DATE_DIM
		group by year, month) b
    ON a.`year` = b.`year`
    AND a.`month` = b.month
    and a.day_of_the_month = b.max_day_of_the_month
SET a.`month_end_date_flag` = true;

-- year_start_date_flag
update DATE_DIM
set year_start_date_flag = true 
where day_of_the_month = 1
and month= 1;

-- year_end_date_flag 
update DATE_DIM
set year_end_date_flag = true 
where day_of_the_month = 31
and month= 12;

-- holiday_flag B
update DATE_DIM
set holiday_flag = true 
where week_day_name in ('Saturday', 'Sunday');

-- ==================================


-- ==================================
