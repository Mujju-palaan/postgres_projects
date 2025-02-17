-- Banking_Application_System
--Mujju-pg-Bank-C07(a)-DQL
-- Chapter 7 - DQL (Data Query Language)
-- DQL ASSIGNMENT1 - Banking Application System

-- 1. SELECT Command
-- Select all columns from the CUSTOMER table.
select * from customer;

-- Select the first_name, last_name, and email of all customers.
select first_name, last_name, email from customer;

-- Select all account_type and balance from the ACCOUNT table.
select  account_type, balance from ACCOUNT;

-- Select the transaction_date and amount from the TRANSACTION table.
Select transaction_date, amount from TRANSACTION;

-------------------------------------------------------------
-- 2. WHERE Command
-- Select all customers where balance is greater than 5000 in the ACCOUNT table.
select * from customer
inner join account using(customer_id) 
where balance >=5000;

-- Select all transactions where the amount is less than 100.
select * from transaction where amount <100;

-- Select all customers whose last_name starts with 'S'.
select * from customer where last_name like 'J%';

-- Select all transactions where transaction_type is 'credit'.
select * from transaction where transaction_type = 'credit';

-------------------------------------------------------------
-- 3. ORDER BY Command
-- Select all customers and order them by last_name in ascending order.
select * from customer
order by last_name asc;

-- Select all transactions and order them by transaction_date in descending order.
select * from transaction 
order by transaction_date desc;

-- Select all accounts and order them by balance in ascending order.
select * from account
order by balance asc;

-- Choose accounts ranked 5th through 10th based on account balance.
select * from account
order by balance asc
limit 10
offset 4;

-------------------------------------------------------------
-- 4. LIMIT Command
-- Select the first 10 customers from the CUSTOMER table.
select * from customer 
limit 10;

-- Select the top 5 transactions from the TRANSACTION table.
select * from transaction
order by amount desc
limit 5;

-- Select the top 3 employees with the highest salary.
select * from employee
order by salary desc
limit 3;

-- Select the first 5 accounts ordered by balance in descending order.
select * from account
order by balance desc
limit 5;

-------------------------------------------------------------

-- 5. DISTINCT Command
-- Select distinct account_type from the ACCOUNT table.
Select distinct account_type from ACCOUNT;

-- Select distinct branch_name from the BRANCH table.
select distinct branch_name from branch;

-- Select distinct transaction_type from the TRANSACTION table.
select distinct transaction_type from TRANSACTION;

-- Select distinct last_name from the CUSTOMER table.
select distinct last_name from customer;

-------------------------------------------------------------
-- 6. GROUP BY Command
-- Select the account_type and count the number of accounts per type, grouping by account_type.
select account_type, count(account_type)
from account
group by account_type;

-- Group the data by customer_name and compute the total balance for all of a customer's accounts in the ACCOUNT table.
select a.first_name||' '||a.last_name as customer_name,
		sum(b.balance) as tolat_amount
from customer a
inner join account b using(customer_id)
group by a.first_name||' '||a.last_name;

-- Provide the total number of transactions for each transaction_type in the TRANSACTION table for every month of the current year.
-- select * from transaction;
select transaction_type, sum(amount), extract(month from transaction_date) as month
from transaction
group by transaction_type,extract(month from transaction_date);

-- Select customer_id from the LOAN table and group by customer_id to count the total number of loans for each customer.
select b.customer_id,
		count(loan_id)
from loan a
inner join account b using(account_id)
group by b.customer_id
order by b.customer_id
;

-------------------------------------------------------------
-- 7. HAVING Command
-- Select account_type and calculate the average balance, having an average balance greater than 1000.
select account_type, avg(balance) as average
from account
group by account_type
having avg(balance) >1000
;

-- Group by branch_id and branch_name, having more than 5 employees per branch.
select a.branch_id, a.branch_name, count(b.employee_id)
from branch a
inner join employee b using(branch_id)
group by branch_id, branch_name
having count(b.employee_id) > 5
;

-- Group by customer_id and calculate the sum of loan_amount, having a sum greater than 50000.
select b.customer_id, sum(a.loan_amount)
from loan a
inner join account b using(account_id)
group by b.customer_id
having sum(a.loan_amount) > 50000
order by 1
;

-- Group by account_type and filter accounts having a count greater than 10.
select account_type, count(account_type)
from account
group by account_type
having count(account_type) > 10
;

-------------------------------------------------------------
-- 8. INNER JOIN Command
-- Select all customers and their corresponding accounts using INNER JOIN between CUSTOMER and ACCOUNT.
select *
from customer
inner join account using(customer_id)
;

-- Select all transactions along with their account types using INNER JOIN between TRANSACTION and ACCOUNT.
select * 
from TRANSACTION
inner join ACCOUNT using(account_id)
;

-- Select all loans and their corresponding customers using INNER JOIN between LOAN and CUSTOMER.
select c.first_name||' '||c.last_name as customer_name,
		a.loan_amount
from loan a
inner join account b using(account_id)
inner join customer c using(customer_id)
;

-- List all scheduled loan payments for a specific loan, along with the consumer details, 
--indicating whether each payment has been made and if it was paid on time, using an INNER JOIN between the LOAN_PAYMENT, 
--LOAN_INSTALMENTS and LOAN tables.
select a.loan_amount, a.number_of_monthly_instalments, 
		b.instalment_amount, b.paid_status, b.due_date
		,d.transaction_date, d.amount, d.transaction_type, d.payment_mode, d.transaction_status
		,f.customer_id
from loan a
inner join loan_instalments b using(loan_id)
inner join loan_payment c using(instalment_id)
inner join transaction d using(transaction_id)
inner join account e ON d.account_id=e.account_id
inner join customer f using(customer_id)
;


-------------------------------------------------------------
-- 9. LEFT JOIN Command
-- Select all customers and their accounts using LEFT JOIN, including customers without accounts.
select a.first_name||' '||a.last_name as customer_name,
		b.balance
from customer a
left join account b using(customer_id)
;

-- Select all accounts and their transactions using LEFT JOIN, including accounts without any transactions.
select *
from account
left join transaction using(account_id)
;

-- Select all employees and their branches using LEFT JOIN, including employees without branch assignments.
select *
from employee
left join branch using(branch_id)
;

-- Select all branches and their accounts using LEFT JOIN, including branches without any accounts.
select a.balance,
		c.branch_name, c.branch_location
from account a
left join customer b using(customer_id)
left join branch c using(branch_id)
;

-------------------------------------------------------------
-- 10. COUNT, SUM, AVG Command
-- Count the total number of customers in the CUSTOMER table.
select count(*) from customer;

-- Count the number of distinct account_type in the ACCOUNT table.
select distinct account_type from ACCOUNT;

-- Calculate the sum of balance for all accounts grouped by branch_id.
select c.branch_name
		,count(a.balance)
from account a
inner join customer b using(customer_id)
inner join branch c using(branch_id)
group by  c.branch_name
;

-- Calculate the average loan_amount for all loans in the LOAN table.
select avg(loan_amount) from loan;

-------------------------------------------------------------
-- 11. CASE Command
-- Select all transactions and use a CASE statement to label them as 'High' if the amount is greater than 500 and 'Low' otherwise.
select amount,
		case 
			when amount > 500 then 'High'
			else 'Low'
		end as desc
from transaction
;	

-- Select all customers and use a CASE statement to categorize them as 'Premium' if their balance is greater than 5000, 'Standard' otherwise.
select a.customer_id
		,b.balance 
		,case
			when b.balance > 5000 then 'Premium'
			else 'Standard'
		end as categorize
from customer a
inner join account b using(customer_id);

-- Select all loans and use a CASE statement to categorize them as 'Long-term' if the loan_end_date is more than 5 years from loan_start_date.
select loan_amount
		,case 
			when (extract(year from loan_end_date) - extract(year from loan_start_date)) = 5 then 'Long-term'
			else 'Short-term'
		end as term
from loan
;

-- Use a CASE statement in the PAYMENT table to show 'On Time' if payment_date is before the due date and 'Late' otherwise.


-------------------------------------------------------------
-- 12. EXISTS and NOT EXISTS Command
-- Select all customers where an account exists in the ACCOUNT table using EXISTS.
select * from customer
where exists (select * from account)
;

-- Select all customers who have a card assigned to them using the EXISTS operator.
select * 
from customer a
join account b using(customer_id)
where exists (select * from card)
;

-- Select all customers where no loans exist in the LOAN table using NOT EXISTS.
select * from customer
join account b using(customer_id)
where not exists (select * from loan)
;

-- Select all branches where no employees exist using NOT EXISTS.
select * from branch
where not exists (select * from employee)
;
	
-------------------------------------------------------------
-- 13. SUBQUERY Command
-- Select all customers whose customer_id is in the result of a subquery selecting customer_id from ACCOUNT where balance > 5000.
select * from customer
where customer_id in (select customer_id from account
					where balance > 5000)
;
					
-- Select all accounts where the account_id is in the result of a subquery selecting account_id from the TRANSACTION table where amount > 1000.
select * from account 
where account_id in (select account_id from TRANSACTION
						where amount > 1000)
;

-- Select all customers with no transactions using a subquery.
select * from customer
join account using(customer_id)
join transaction using(account_id)
where transaction_id not in (select transaction_id from transaction)
;

-- Select all branches where the number of employees is more than 5 using a subquery on the EMPLOYEE table.
select branch_name from branch
join employee using(branch_id)
where (select count(employee_id) from employee) > 5
;

-------------------------------------------------------------
-- 14. RANK and DENSE_RANK Command
-- Rank customers based on their balance using RANK().
select a.customer_id, 
		RANK() over(partition by b.balance)  rank
from customer a
join account b using(customer_id)
-- order by customer_id
;

-- Use DENSE_RANK() to rank accounts by their balance.

-- Rank transactions by the amount using RANK().

-- Use DENSE_RANK() to rank employees by their salary.

-------------------------------------------------------------
-- 15. PIVOT and UNPIVOT
-- Pivot the TRANSACTION data by transaction_type and account_id.

-- Unpivot the ACCOUNT balance data to show changes in balance over time.

-- Pivot account balances grouped by branch_id and account_type.

-- Unpivot loan data by loan_amount and loan_end_date.

-------------------------------------------------------------
-- 16. UNION and UNION ALL Command
-- Select the transfer date, amount, and label the row as "Fund Transfer" from FUND_TRANSFER table. UNION these records with transaction data, using the transaction date, amount, and labeling them as "Transaction."

-- Select all accounts from different branches using UNION ALL.

-- Use UNION to combine customers from two different branches.

-- Use UNION ALL to select all transactions from two different years.

-------------------------------------------------------------
-- 17. COALESCE, IFNULL, NULLIF Command
-- Select all accounts and use COALESCE to replace null balances with 0.

-- Use IFNULL to replace null phone_number values in the CUSTOMER table.

-- Use NULLIF to list overdue loan payments from the LOAN_INSTALMENTS table by comparing the current system date, the loan due date, and the loan paid date.

-- Select all customers and use COALESCE to replace null email with 'Not Provided'.

-------------------------------------------------------------
-- 18. STRING Functions
-- Select all customers' first_name in uppercase using the UPPER() function.

-- Select all accounts' account_type in lowercase using the LOWER() function.

-- Use CONCAT() to combine the first_name and last_name of customers.

-- Select all customers' last_name and find the length of the name using LENGTH().

-------------------------------------------------------------
-- 19. DATE Functions
-- Select all customers and show their loan_start_date formatted as 'Nov 2024' using TO_CHAR().

-- Add 1 year to all loan_start_date values in the LOAN table using AGE().

-- Subtract 1 month from all transaction_date values using INTERVAL.

-- Select all accounts and extract the year from their transaction_date using EXTRACT().

-------------------------------------------------------------
-- 20. NUMERIC Functions
-- Select the balance from the ACCOUNT table and round them to the nearest integer using ROUND().

-- Select all loan_amount from the LOAN table and use CEIL() to round up.

-- Use FLOOR() to round down the balance in the ACCOUNT table.

-- Select the highest balance from the ACCOUNT table using MAX().

-------------------------------------------------------------
-- 21. CAST and CONVERT Command
-- Select all customers and cast the customer_id as a string using CAST().

-- Convert balance in the ACCOUNT table to DECIMAL using CONVERT().

-- Cast transaction_id in the TRANSACTION table to INTEGER.

-- Convert the transaction_date from the TRANSACTION table into TEXT.

-------------------------------------------------------------
-- 22. JSON Select
-- Select all JSON data from a column in the CUSTOMER table if it stores any JSON details.

-- Select specific keys from a JSON column in the CUSTOMER table.

-- Parse a JSON column from the CUSTOMER table to extract spouse name.

-- Use JSON_EXTRACT to select a specific key from a JSON column in the CUSTOMER table.

-------------------------------------------------------------
-- 23. CONCAT and CONCAT_WS Functions
-- Use CONCAT() to join first_name and last_name with a space in between in the CUSTOMER table.

-- Use CONCAT_WS() to combine the branch_name and branch_location with a comma in the BRANCH table.

-- Use CONCAT() to combine the account_type and balance from the ACCOUNT table.

-- Use CONCAT_WS() to combine first_name, last_name, and email from the CUSTOMER table.

-------------------------------------------------------------
-- 24. LIKE and NOT LIKE
-- Select customers whose email ends with 'bank.com' using LIKE.

-- Select accounts where account_type contains 'credit' using LIKE.

-- Select customers whose last_name does not start with 'J' using NOT LIKE.

-- Select branches where branch_location contains 'Main' using LIKE.

-------------------------------------------------------------
-- 25. EXISTS and NOT EXISTS
-- Select customers where accounts exist in the ACCOUNT table using EXISTS.

-- Select loans where customers exist using EXISTS.

-- Select branches where no employees exist using NOT EXISTS.

-- Select transactions where no matching account exists using NOT EXISTS.

-------------------------------------------------------------
-- 26. JOIN Commands
-- Select all customers and their corresponding accounts using INNER JOIN between CUSTOMER and ACCOUNT.

-- Select all accounts and their transactions using INNER JOIN between ACCOUNT and TRANSACTION.

-- Select all employees and their branches using LEFT JOIN between EMPLOYEE and BRANCH.

-- Select all branches and the accounts they are linked to using LEFT JOIN.

-------------------------------------------------------------
-- 27. BETWEEN Command
-- Select all accounts where the balance is between 1000 and 5000.

-- Select all customers where the loan_amount is between 10,000 and 50,000.

-- Select all transactions where the transaction_date is between '2022-01-01' and '2022-12-31'.

-- Select all employees where the salary is between 30,000 and 100,000.

-------------------------------------------------------------
-- 28. IN and NOT IN Command
-- Select all customers where the account_type is in ('Savings', 'Checking').

-- Select all transactions where the transaction_type is in ('credit', 'debit').

-- Select all branches where the branch_location is not in ('New York', 'Los Angeles').

-- Select all accounts where the balance is in (1000, 2000, 5000).

-------------------------------------------------------------
-- 29. ARRAY Command
-- Select all account_type and convert it into an array using ARRAY_AGG().

-- Use UNNEST() to expand arrays from the ACCOUNT table.

-- Convert customer names into an array using ARRAY_AGG().

-- Use ARRAY functions to select and manipulate data from the CARD table.

-------------------------------------------------------------
-- GOOD LUCK WITH YOUR ASSIGNMENT!!!
-- Don't forget to contact us if you need any further assistance with your assignments, and most importantly, for a manual review and approval of your work.

