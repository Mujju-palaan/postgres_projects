--Mujju-pg-Bank-C06(b)-DML
---Chapter6 Ass1 DML Bank data
--Question 1: Insert Data into all Tables
--	Done

--Question 2: Insert a New City
--Write multiple SQL statements to insert few records into the CITY table.
-- select * from city;
insert into city(country_name,city_name) 
			values ('India','Hyderabad');

--Question 3: Insert a New Customer
--Write a DML SQL statement to insert a new record into the CUSTOMER table with the following details:
-- select * from customer;
insert into customer(first_name, last_name, gender, id_type, id_number, email, phone_number, address, city_id,branch_id)
values('John','Doe','M','Passport','12345678','john.doe@example.com' ,'1234567890','bulding no 1-1/4',1,1);

--Question 4: Insert Multiple Accounts for a Customer
--Insert two accounts for the customer with customer_id = 1 into the ACCOUNT table with the following details:
--First account: account_type: 'savings', balance: 1000.00, Second account: account_type: 'checking', balance: 500.00
-- select * from account;
insert into account (account_type,balance,customer_id) 
values ('checking','1000.00',1),
		('savings','500.00',1);


--Question 5: Insert Data Using Subquery
--Write an SQL INSERT statement using a subquery to add a new customer into the CUSTOMER table. 
--The customer should be added to a city that already exists in the CITY table without directly using the city_id.
-- select * from customer;
insert into customer(first_name, last_name, gender, id_type, id_number, email, phone_number, address, city_id,branch_id)
values('Mujju','Palaan','M','Passport','7867837866','mujju@tansycloud.com' ,'7867837866','Flot 206',
	(select city_id from city where city_name = 'Hyderabad'),
	1);

--Question 6: Insert Data Using Subquery
--Assume the CITY, ACCOUNT, and CUSTOMER tables are already set up and populated. 
--Write an SQL INSERT statement using a subquery that adds a new entry to the ACCOUNT table for an existing customer. 
--The customer is identified by their last name and email, and the account should be created only if 
--the customer lives in a specific city ('Los Angeles').
-- select * from account;
-- select * from customer;
-- select * from city;

insert into account(account_type, balance, customer_id)
values ('savings', 999999.50, 
		(select customer_id 
		from customer c 
		join city ci on c.city_id=ci.city_id 
		where c.last_name='Palaan' 
		and c.email='mujju@tansycloud.com'
		and ci.city_name='Hyderabad'
		));

--Question 7: Select Into
--Write a SQL statement to create a backup of all rows in the TRANSACTION table into a new table TRANSACTION_BACKUP.
create table TRANSACTION_BACKUP as
select * from  TRANSACTION;

--Question 8: Simple UPDATE
--Write an SQL statement to update the country_name in the CITY table to "USA" where the city_name is "New York".
-- select * from city;
update city set country_name = 'USA'
where city_name = 'New York';

--Question 9: Add a JSON Column to the CUSTOMER Table
--Write a SQL statement to add a customer_info column of type JSON to the CUSTOMER table.
-- select * from customer;

alter table customer add column customer_info jsonb;

--Question 10: Insert Data into JSON Column
--Insert a new record into the CUSTOMER table and add JSON data into the customer_info column. 
--Add designation, education and spouse_name as JSON elements.
insert into CUSTOMER(first_name, last_name, gender, id_type, id_number, email, phone_number, 
address, city_id, branch_id, customer_info)
values
('John','Wick','M','Passport','W065483','jhon.wick@tansy.com','1234756431','Las Vegas',8,8,
'{"designation":"Secret Agent","education":"B.A","spouse_name":"lailaa"}'
);

--Question 11: Update JSON Column
--Write a SQL statement to update the spouse_name field in the customer_info JSON column of the 
--CUSTOMER table to "Riley M" where the customer_id is 1.
update customer set customer_info = '{"designation":"Secret Agent","education":"B.A","spouse_name":"Riley M"}'
where customer_id = 26;

--Question 12: Upsert (INSERT ON CONFLICT)
--Write a SQL statement to insert a new CUSTOMER record or update the email if the customer_id already exists.
insert into CUSTOMER(first_name, last_name, gender, id_type, id_number, email, phone_number, 
address, city_id, branch_id, customer_info)
values
('MD','Muzamil','M','Passport','W0333483','md.muzamil@tansy.com','024756431','Las Vegas',8,8,
'{"designation":"software Engg","education":"B.Tech","spouse_name":"muzzu"}'
)
on conflict (city_id)
DO UPDATE SET branch_id = EXCLUDED.branch_id;

--Question 13: Update with Join
--Write an SQL statement to update the balance in the ACCOUNTS table using the balance_after value from the ACCOUNT_HISTORY table. 
--Ensure that the balance_after is taken from the most recent records where latest_record is true. 
--Only perform the update when there is a discrepancy between the current balance in the ACCOUNTS table and 
--the balance_after value from the ACCOUNT_HISTORY table.

--Question 14: Update with Subquery
--Write a SQL statement to update the balance of an account based on the total of all transactions for that account.

--Question 15: Delete Records
--Write a SQL statement to delete all transactions where the amount is less than 50.

--Question 16: Delete with Join
--Write a SQL statement to delete all accounts of customers who have no transactions, using a join between ACCOUNT and TRANSACTION.

--Question 17: Update JSON Column with Nested Data
--Write a SQL statement to update the meta_data field in the ACCOUNT table, adding a new key-value pair ("verified": true) into the existing JSON data.

--Question 18: Truncate the TRANSACTION Table
--Write a SQL statement to truncate the TRANSACTION table, removing all rows without generating individual delete triggers.

--Question 19: Complex UPDATE.
--Write an SQL statement to update the loan_end_date in the LOAN table based on the loan_amount, number_of_monthly_installments, and loan_start_date.

--Question 20: SUPER Complex INSERT.
--Write a single INSERT SQL statement to insert multiple loan installment records into the LOAN_INSTALMENTS table based on each loan record from the LOAN table.

-- Create a DATE_DIM table with columns: date_id, year, month, month_start_date and month_end_date.
-- The date_id should be populated in the YYYYMM format (e.g., 202401).
-- Populate the DATE_DIM table with data for a 30-year period, starting from 2020 through 2050.
-- Join the LOAN table with the DATE_DIM table to insert data into the LOAN_INSTALMENTS table, ensuring that each loan record is matched with the corresponding installment dates.
-- Monthly instalment_amount must be calculated based of interest_rate from LOAN table.
-- You can use online loan calculators, such as this one, to verify your final loan installment data.(https://cred.club/calculators/simple-loan-calculator)
-- Question 20: Project Data.
-- At the end of this assignment, ensure that each table you created in the Chapter 5 DDL assignment contains at least 5 records.

--GOOD LUCK WITH YOUR ASSIGNMENT!!!
--Don't forget to contact us if you need any further assistance with your assignments, and most importantly, for a manual review and approval of your work.


