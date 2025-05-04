-- 1. Book Overview
-- Task: Write SQL queries to generate the following metrics:
-- Total Books in Library: Write a query to count the total number of books across all branches.
select
	b.branch_name
	,count(a.book_id)
from book a
inner join book_inventory aa using(book_id)
inner join library_branch b using(branch_id)
group by b.branch_name
;
	
-- Books by Category: Write a query to count how many books exist in each category (for a bar or pie chart).
select 
	category_name
	,count(book_id)
from book
inner join book_category using(book_category_id)
group by category_name
;
	
-- Available Books per Branch: Write a query that retrieves the quantity of books available at each branch.
select 
	branch_name
	,sum(quantity)
from book_inventory
inner join library_branch using(branch_id)
group by branch_name
;
	
-- Recently Added Books: Write a query that lists books added in the past 30 days.
select * from book
where created_at = created_at - interval '1month'
;

	
-- -----------------------------------------------------------------------------------------------------------------

-- 2. Member Overview
-- Task: Write SQL queries to pull member-related insights:
-- Number of Members: Write a query to count the total number of members in the system.
select count(*) from members;

-- Active Members: Write a query that retrieves members who have borrowed books in the last 6 months.


-- Member Loan History: Write a query that retrieves all loans made by each member, showing book titles, loan dates, and return dates (for a table).
select 
	member_id
	,title
	,loan_date
	,return_date
from loan
inner join book using(book_id)
group by member_id, title ,loan_date ,return_date
order by member_id
;

-- Member Fine History: Write a query to list members who have outstanding fines, including fine amounts.
select 
	member_id
	,overdue_days
	,fine_amount
from fine
inner join loan using(loan_id)
group by member_id,overdue_days
	,fine_amount
order by member_id
;

-- -----------------------------------------------------------------------------------------------------------------

-- 3. Loan Overview
-- Task: Use SQL to pull loan-related insights:
-- Total Loans by Book: Write a query that retrieves the total number of loans for each book (for a bar chart).
select
	book_id
	,count(loan)
from loan
group by book_id
order by book_id
;

-- Active vs Returned Loans: Write a query to count active loans (loans where return_date is null) 
--versus returned loans.(select * from loan)
select 
	return_date,
	count(return_date)
from loan
where return_date is null
group by return_date
;

-- Overdue Loans: Write a query that lists all overdue loans where the current date is 
--past the due date and return_date is still null.
select * from loan
where due_date < current_date AND return_date is null
;

-- -----------------------------------------------------------------------------------------------------------------

-- 4. Employee Overview
-- Task: Use SQL to manage employee-related data:
-- Number of Employees per Branch: Write a query to retrieve the number of employees working at each branch.
select 
	branch_id
	,count(employee_id)
from employee
group by branch_id
order by branch_id
;


-- Employee Loan Activity: Write a query that retrieves the total number of loans issued by each employee.
select 
	employee_id
	,count(loan_id)
from loan
group by employee_id
order by employee_id
;


-- Employee Salary Report: Write a query to retrieve the salary details for all employees.
select 
	employee_id
	,salary
from employee
;


-- -----------------------------------------------------------------------------------------------------------------

-- 5. Branch Overview
-- Task: Write SQL queries to generate insights about library branches:
-- List of Branches: Write a query that lists all branches along with their locations.
select 
	branch_id
	,location
from library_branch
;


-- Branch Inventory: Write a query that retrieves the total number of books available at each branch.
select 
	branch_id
	,count(book_id)
from book_inventory
group by branch_id
;


-- Branch Loan Activity: Write a query to retrieve total loans per branch, grouped by branch.
select 
	issue_branch_id
	,count(loan_id)
from loan
group by issue_branch_id
;




-- -----------------------------------------------------------------------------------------------------------------

-- **Key Visuals and Corresponding SQL Queries: **
-- Note: All dashboard queries must work against current month or current year filters

-- Bar Chart - Collections by Month
-- SQL Query: Retrieve the collection amount for each month.
-- X-Axis: Month names.
-- Y-Axis: Collection Amount.
select 
	extract(month from payment_date) as month
	,sum(amount_paid) as Collection_Amount
from membership_payment
group by extract(month from payment_date)	
;
-- -----------------------------------------------------------------------------------------------------------------

-- Pie Chart - Books by Category
-- SQL Query: Retrieve the count of books per category.
-- Pie Sections: Book Category and their counts.
select 
	book_category_id
	,count(book_id)
from book
group by book_category_id
;

-- -----------------------------------------------------------------------------------------------------------------

-- Line Graph - User Signups by Month
-- SQL Query: Retrieve the number of members registered per month.
-- X-Axis: Registration date grouped by month.
-- Y-Axis: Number of members.
select 
	extract(month from created_at)
	,count(member_id)
from members
group by extract(month from created_at)
;

-- -----------------------------------------------------------------------------------------------------------------

-- **Table - Loans Status **
-- SQL Query: Retrieve Title, Member Name, Pickup Date, Due Date and Fine Amount.
-- Columns: Title, Member Name, Pickup Date, Due Date, Fine Amount.
select
	d.title
	,c.first_name||' '||c.last_name as member_name
	,e.payment_date as pickup_date
	,b.due_date
	,a.fine_amount
from fine a
inner join loan b using(loan_id)
inner join members c using(member_id)
inner join book d using(book_id)
inner join membership_payment e using(member_id)
;

-- -----------------------------------------------------------------------------------------------------------------

-- Gauge - On-time Return VS Overdue
-- SQL Query: Count the total number of ontime returns.
-- Display: Total returns.
select 
	return_date 
from loan a
inner join membership_payment b using(member_id)
where return_date = b.payment_date
;

