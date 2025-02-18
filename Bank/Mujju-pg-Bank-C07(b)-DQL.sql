-- -- Banking_Application_System
-- --Mujju-pg-Bank-C07(b)-DQL
-- DQL ASSIGNMENT3 - SQL Logic for Dashboard Reporting in a Banking Application
-- SQL Assignment:

-- 1. Customer Overview
-- Task: Write SQL queries to generate the following metrics:
-- 1)Number of Customers: Write a query to count the total number of customers in the system.
select count(*) from customer;

-------------------------------------------------------------
-- 2)Customer Email List: Write a query to retrieve the list of unique customer emails for marketing purposes.
select distinct email from customer;

-------------------------------------------------------------
-- 3)Customer Account Balances: Write a query that lists customers along with their total account balances, grouped by customer.
select a.customer_id
		,a.first_name||' '||a.last_name as customer_name
		,sum(b.balance)
from customer a
inner join account b using(customer_id)
group by a.customer_id, a.first_name||' '||a.last_name
order by customer_id
;

-------------------------------------------------------------
-- 4)Recent Customers: Write a query that lists customers who joined in the last 30 days.
select * from customer
where created_at = created_at - interval '30 days'
;

-------------------------------------------------------------

-- 2. Account Overview
-- Task: Write SQL queries to pull account-related insights:
-- 1)Number of Accounts by Type: Write a query to count how many accounts exist for each account type (e.g., savings, checking).
select account_type
		,count(account_type)
from account
group by account_type
;

-------------------------------------------------------------
-- 2)Total Account Balance: Write a query to calculate the total balance of all accounts (for a gauge or bar chart).
select sum(balance) from account;

select account_id
		,sum(balance) 
from account
group by account_id
order by account_id
;
-------------------------------------------------------------
-- 3)Active vs Dormant Accounts: Write a query to identify active and dormant accounts based on recent transactions.
select a.account_id
		,b.transaction_id 
		,transaction_status
		,case
			when transaction_status = 'completed' then 'active'
			else 'inactve'
		end as status
from account a
inner join transaction b using(account_id)
;

-------------------------------------------------------------
-- 4)Accounts with Overdrafts: Write a query to list accounts where the balance has gone below 0.
select * from account
where balance < 0
;

-------------------------------------------------------------

-- 3. Transaction Overview
-- Task: Use SQL to pull transaction-related insights:
-- 1)Total Transactions by Account: Write a query that retrieves the total number of transactions per account.
select account_id
		,count(b.transaction_id)
from account a
inner join transaction b using(account_id)
group by account_id
order by account_id
;

-------------------------------------------------------------
-- 2)Transaction Type Breakdown: Write a query to retrieve a breakdown of the number of debit vs credit transactions.
select transaction_type
		,count(transaction_type)
from transaction
group by transaction_type
;

-------------------------------------------------------------
-- 3)High-Value Transactions: Write a query that lists all transactions above a certain threshold (e.g., greater than 10,000 USD).
select * from transaction
where amount > 10000
;

-------------------------------------------------------------
-- 4)Transactions by Month: Write a query that shows the number of transactions for each month (for a line graph).
select extract(month from transaction_date) as month
		,to_char(transaction_date, 'Month') as month
		,count(transaction_type)
from transaction
group by extract(month from transaction_date), to_char(transaction_date, 'Month')
;

-------------------------------------------------------------

-- 4. Loan Overview
-- Task: Create SQL queries to monitor loans:
-- 1)Total Loan Amounts by Customer: Write a query that retrieves the total loan amounts for each customer.
select a.customer_id
		,a.first_name||' '||a.last_name as customer_name
		,sum(c.loan_amount)
from customer a
join account b using(customer_id)
join loan c using(account_id)
group by a.customer_id
		,a.first_name||' '||a.last_name
order by 1
;

-------------------------------------------------------------
-- 2)Active vs Closed Loans: Write a query to count active loans (where loan_end_date is null) versus closed loans.
select loan_id
		,loan_amount
		,loan_end_date,
		case
			when loan_end_date > current_date then 'active'
			else 'inactive'
		end as status
from loan
;

-------------------------------------------------------------
-- 3)Overdue Loans: Write a query that lists loans that are overdue based on the current date and loan_end_date.
select loan_id
		,loan_amount
		,loan_end_date,
		case
			when loan_end_date > current_date then 'overdue'
			else 'paid'
		end as status
from loan
;

-------------------------------------------------------------

-- 5. Employee Overview
-- Task: Use SQL to manage employee-related data:
-- 1)Number of Employees per Branch: Write a query to retrieve the number of employees working at each branch.
select branch_name
		,count(employee_id)
from employee
join branch using(branch_id)
group by branch_name
;

-------------------------------------------------------------
-- 2)Employee Salary Report: Write a query to retrieve the salary details for all employees.
select first_name||' '||last_name as employee_name
		,sum(salary)
from employee
group by first_name||' '||last_name
;

-------------------------------------------------------------
-- 3)Employee Loan Issuance Activity: Write a query that retrieves the number of loans issued by each employee.
select a.first_name||' '||a.last_name as employee_name
		,count(b.loan_id) as number_of_loans
from employee a
join loan b ON employee_id=created_employee_id
group by a.first_name||' '||a.last_name
;

-------------------------------------------------------------

-- 6. Branch Overview
-- Task: Write SQL queries to generate insights about bank branches:
-- 1)List of Branches: Write a query that lists all branches along with their locations.
select branch_name, branch_location 
from branch;

-------------------------------------------------------------
-- 2)Branch Account Balances: Write a query that retrieves the total balance of accounts managed by each branch.
select a.branch_name
		,sum(c.balance) as total_balance
from branch a
join customer b using(branch_id)
join account c using(customer_id)
group by a.branch_name
;

-------------------------------------------------------------
-- 3)Branch Loan Issuance: Write a query that shows the total loan amounts issued by each branch.
select a.branch_name
		,sum(c.loan_amount)
from branch a
join employee b using(branch_id)
join loan c ON employee_id=created_employee_id
group by a.branch_name
;

-- --------------------------------------
-- Key Visuals and Corresponding SQL Queries:
-- Note: All dashboard queries must work against current month or current year filters

-- 1)Bar Chart - Accounts by Type
-- Query: Write an SQL query to retrieve the number of accounts for each account type from the `ACCOUNT` table.
-- X-Axis: Account types.
-- Y-Axis: Number of accounts.
select account_type 
		,count(account_type)
from account
group by account_type
;

-------------------------------------------------------------
-- 2)Pie Chart - Transactions by Type
-- Query: Write a query to retrieve the number of debit and credit transactions from the `TRANSACTION` table.
-- Sections: Debit and Credit transactions.
select transaction_type
		,count(transaction_type)
from transaction
group by transaction_type
;

-------------------------------------------------------------
-- 3)Line Graph - Transactions by Month
-- Query: Write a query that retrieves the total number of transactions for each month from the `TRANSACTION` table.
-- X-Axis: Month (grouped by transaction_date).
-- Y-Axis: Number of transactions.
select extract(month from transaction_date)
		,to_char(transaction_date, 'Month')
		,count(transaction_date)
from transaction
group by extract(month from transaction_date) ,to_char(transaction_date, 'Month')
;

-------------------------------------------------------------
-- 4)Gauge - Total Account Balance
-- Query: Write an SQL query to calculate the total account balance from the `ACCOUNT` table.
-- Display: Total balance across all accounts.
select account_id
		,sum(balance) as total_account_balance
from account
group by account_id
order by 2 desc
;

-------------------------------------------------------------
-- 5)Table - Employee Loan Issuance Activity
-- Query: Write an SQL query to retrieve the number of loans issued by each employee from the `LOAN` and `EMPLOYEE` tables.
-- Columns: Employee Name, Number of Loans Issued.
select first_name||' '||last_name as employee_name 
		,count(loan_id) as number_of_loans
from employee a
join loan b ON employee_id=created_employee_id
group by first_name||' '||last_name
;

-------------------------------------------------------------
-- Data Sources (Tables Mapped):
-- Customer Data: `CUSTOMER` table .
-- Account Data: `ACCOUNT` table, `ACCOUNT_HISTORY` table.
-- Transaction Data: `TRANSACTION` table.
-- Loan Data: `LOAN` table, `LOAN_PAYMENT` table.
-- Employee Data: `EMPLOYEE` table.
-- Branch Data: `BRANCH` table.
-- Audit Log Data: `AUDIT_LOG` table.
