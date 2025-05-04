-- 1. SELECT Command
-- Select all columns from the BOOK table.
select * from book;

-- Select the title, author, and isbn of all books.
select title, isbn from book;

-- Select the first_name and email from the MEMBER table.
select first_name, last_name, email from members;

-- Select the loan_date and due_date from the LOAN table.
select loan_date, due_date from loan;


-- 2. WHERE Command
-- Select all members where membership_date is after '2020-01-01'.
select * from members
where membership_expiry_date >  '2020-01-01'
;

-- Select all books where publication_year is before 2000.
select * from book
where publication_year < 2000
;

-- Select all loans where due_date is before '2023-01-01'.
select * from loan
where due_date < '2023-01-01'
;

-- Select all books where isbn starts with '978'.
select * from book
where isbn like '978%'


-- 3. ORDER BY Command
-- Select all books and order them by title in ascending order.
select * from book
order by title asc
;

-- Select all members and order them by last_name in descending order.
select * from members
order by last_name desc
;

-- Select all loans and order them by loan_date in ascending order.
select * from loan
order by loan_date asc
;

-- Select all employees and order them by hire_date in descending order.
select * from employee
order by hire_date desc
;

-- 4. LIMIT and ROWNUM Command
-- Select the first 10 books from the BOOK table using ROWNUM.
select * from book
LIMIT 10
;

-- Select the first 5 loans from the LOAN table.
select * from loan
limit 5
;

-- Select the top 3 members who joined the most recently.
select * from members
where created_at = current_date
limit 3
;

-- Select the first 5 overdue loans, ordered by due_date.
select due_date from loan
limit 5
;

-- 5. DISTINCT Command
-- Select distinct author from the BOOK table.
select publication_year distinct 
from book
;

-- Select distinct category_name from the CATEGORY table.
select category_name distinct
from BOOK_CATEGORY
;

-- Select distinct last_name from the MEMBER table.
select last_name distinct
from members
;

-- Select distinct branch_name from the LIBRARY_BRANCH table.
select branch_name distinct
from LIBRARY_BRANCH
;


-- 6. GROUP BY Command
-- Group by author from the BOOK table and count the number of books per author.
select 
	b.first_name ||' '||b.last_name as author_name
	,count(a.book_id) as book_count
from book a
inner join book_author aa using(book_id)
inner join author b using(author_id)
group by b.first_name ||' '||b.last_name
;

-- Group by category_name from the CATEGORY table and count the number 
--of books per category.
select 
	category_name
	,count(book_id)
from book_category
inner join book using(book_category_id)
Group by category_name
;

-- Group by branch_name from the LIBRARY_BRANCH table and 
--calculate the total number of books per branch.
select 
	branch_name
	,count(book_id)
from LIBRARY_BRANCH
inner join book_inventory using(branch_id)
inner join book using(book_id)
Group by branch_name
;

-- Group by loan_date from the LOAN table and count the number of loans per day.
select 
	loan_date
	,count(loan_date)
from loan
Group by loan_date
;


-- 7. HAVING Command
-- Select category_name from the CATEGORY table and group by it, 
--having more than 3 books per category.
select 
	category_name
	,count(book_id)
from book_category
inner join book using(book_category_id)
Group by category_name
having count(book_id) > 3
;

-- Group by branch_name and calculate the total number of employees per branch, 
--having more than 5 employees.
select 
	branch_name
	,count(employee_id)
from employee
inner join library_branch using(branch_id)
Group by branch_name
having count(employee_id) > 5
;


-- Group by loan_date from the LOAN table, having more than 3 loans on a particular day.
select
	loan_date
	,count(loan_date)
from loan
Group by loan_date
having count(loan_date) > 3
;


-- Group by author and filter the groups having more than 5 books written by that author.
select 
	b.first_name||' '||b.last_name
	,count(a.book_id)
from book a
inner join book_author aa using(book_id)
inner join author b using(author_id)
group by b.first_name||' '||b.last_name
having count(a.book_id) > 5
;


-- 8. INNER JOIN Command
-- Select all loans along with the corresponding member details using 
--INNER JOIN between the LOAN and MEMBER tables.
select 
	* 
from loan
inner join members using(member_id)
;

-- Select all books and their corresponding category using INNER JOIN between the BOOK and CATEGORY tables.
select * from book
inner join book_category using(book_category_id)
;

-- Select all loans and the corresponding book titles using INNER JOIN between the LOAN and BOOK tables.
select 
	* 
from book
inner join loan using(book_id)
;


-- Select all employees and the branches they are assigned to using INNER JOIN between EMPLOYEE and LIBRARY_BRANCH.
select
	first_name||' '||last_name
	,branch_name
from employee
inner join library_branch using(branch_id)
;

-- 9. LEFT JOIN Command
-- Select all members and their loans using LEFT JOIN, including members without any loans.

-- Select all books and their categories using LEFT JOIN, including books without categories.

-- Select all loans and their books using LEFT JOIN, including loans that don’t reference a specific book.

-- Select all branches and their employees using LEFT JOIN, including branches without any employees.


-- 10. COUNT, SUM, AVG Command
-- Count the total number of books in the BOOK table.
select count(*) from book;

-- Count the number of distinct category_name in the CATEGORY table.
select count(distinct category_name) from book_category;

-- Calculate the sum of fine_amount for all fines in the FINE table.
select sum(fine_amount) from fine;

-- Calculate the average salary for all employees in the EMPLOYEE table.
select avg(salary) from employee;

-- 11. CASE Command
-- Select all loans and use a CASE statement to show 'Overdue' 
--if due_date is past the current date, and 'On Time' otherwise.
select
	loan_date
	,case
		when loan_date < current_date 
		then 'Overdue'
		ELSE 'On Time'
		
	END as reminder
from loan
;


-- Select all members and categorize them as 'New Member' 
--if their membership_date is after '2022-01-01', otherwise 'Old Member'.
select 
	first_name||' '||last_name
	,case
		WHEN membership_expiry_date > '2022-01-01' THEN 'New Member'
		ELSE  'Old Member'
	END as type
from members
;

-- Use a CASE statement to label loans as 'Completed' if the return_date is not null, otherwise 'Pending'.
select 
	loan_id
	,return_date
	,case
		when return_date is not null 
		THEN 'Completed'
		ELSE 'Pending'
	END as status
from loan
;


-- Use a CASE statement in the FINE table to categorize fines as 'Low', 'Medium', or 'High' based on the fine_amount.
select 
	fine_amount
	,case
		WHEN fine_amount < 5 THEN 'Low'
		WHEN fine_amount BETWEEN 5 and 15 THEN 'Medium'
		ELSE 'High'
	END as status
from fine
;


-- 12. EXISTS and NOT EXISTS Command
-- Select all books where a loan exists in the LOAN table using EXISTS.
select * from loan
where EXISTS  (select * from book)
;

-- Select all members where no loans exist in the LOAN table using NOT EXISTS.
select * from loan
where NOT EXISTS (select * from members)
;

-- Select all categories where books exist in the BOOK table using EXISTS.
select * from book_category
where EXISTS (select * from book)
;

-- Select all employees where no loans were issued using NOT EXISTS.
select * from EMPLOYEE
where NOT EXISTS (select * from loan)
;

-- 13. SUBQUERY Command
-- Select all books whose book_id is in the result of a subquery selecting book_id from the LOAN table where due_date is past.
select * from book
where book_id in (select book_id from loan where due_date < current_date)
order by book_id
;

-- Select all employees who issued loans, using a subquery to get employee_id from the LOAN table.
select * from employee
where employee_id in (select employee_id from loan)
order by employee_id
;

-- Select all books that have not been loaned using a subquery.
select * from book
where book_id not in (select book_id from loan)
order by book_id
;

-- Select all members who have not been fined using a subquery in the FINE table.
select * from members
where member_id not in (select member_id from loan
							inner join fine using(loan_id))
;


-- 14. RANK and DENSE_RANK Command
-- Rank members based on the number of loans using RANK().
select 
	member_id
	,count(member_id)
	,RANK() OVER (ORDER BY count(member_id) desc ) as rank
from loan
group by member_id
-- order by member_id
;

-- Use DENSE_RANK() to rank books by the number of times they were borrowed.
select 
	quantity
	,DENSE_RANK() OVER (ORDER BY quantity desc) as dense_rank
from book_inventory
;


-- Rank loans by loan_date using RANK().
select 
	loan_date
	,RANK() OVER(ORDER BY loan_date ) as rank
from loan
;


-- Use DENSE_RANK() to rank employees based on their hire_date.
select 
	hire_date
	,RANK() OVER(ORDER BY hire_date) as rank
from employee
;


-- 15. PIVOT and UNPIVOT
-- Pivot the LOAN data by loan_date and book_id.
-- Unpivot the fine data to show fine_amount and fine_date in one row for each member.
-- Pivot the book inventory by branch_name and quantity.
-- Unpivot employee salaries by salary and branch_id.


-- 16. UNION and UNION ALL Command
-- Select all books from the BOOK and BOOK_INVENTORY tables using UNION.
select book_id from book
UNION
select book_id from book_inventory
;

-- Select all members from different branches using UNION ALL.
select * from members
where gender = 'M'
	
union all

select * from members
where gender = 'F'
;


-- Use UNION to combine completed and pending loans.



-- Use UNION ALL to select all categories from two different departments.


-- 17. COALESCE, NVL, NULLIF Command
-- Select all books and use COALESCE to replace null publication_year with 'Unknown'.
select COALESCE(return_date, NULL, 'Unknown') from loan;

-- Use NVL to replace null phone_number values in the MEMBER table.

-- Use NULLIF to compare due_date and return_date in the LOAN table and return NULL if they are the same.

-- Select all employees and use COALESCE to replace null email values with 'Not Provided'.


-- 18. STRING Functions
-- Select all books' title in uppercase using the UPPER() function.
select upper(title) from book;

-- Select all members' first_name in lowercase using the LOWER() function.
select lower(first_name) from members;

-- Use CONCAT() to combine the first_name and last_name of members.
select concat(first_name,' ', last_name) from members;

-- Select all books' isbn and find the length of the string using LENGTH().
select length(isbn) from book;


-- 19. DATE Functions
-- Select all members and show their membership_date formatted as 'YYYY-MM-DD' using TO_CHAR().
select to_char(membership_expiry_date, 'YYYY-MM-DD') from members;


-- Add 1 year to all due_date values in the LOAN table using ADD_MONTHS().
select 
	due_date
	,due_date +interval '1year'
from loan
;

-- Subtract 1 month from all hire_date values using MONTHS_BETWEEN().
select 
	hire_date
	,(hire_date - interval '1 month')::DATE
from employee
;

-- Select all employees and extract the year from their hire_date using EXTRACT().
select 
	extract(year from hire_date)
from employee
;


-- 20. NUMERIC Functions
-- Select the fine_amount from the FINE table and round it to the nearest integer using ROUND().
select round(fine_amount) from fine;

-- Select all employees' salary and use CEIL() to round up.
select ceil(salary) from employee;

-- Use FLOOR() to round down the fine_amount in the FINE table.
select FLOOR(fine_amount) from fine;


-- Select the highest fine_amount from the FINE table using MAX().
select MAX(fine_amount) from fine;


-- 21. CAST and CONVERT Command
-- Select all members and cast the member_id as a string using CAST().
select cast(member_id as varchar) from members;

select member_id::varchar from members;


-- Convert fine_amount in the FINE table to DECIMAL using CONVERT().
-- select convert(numeric, fine_amount) from fine;

select fine_amount::decimal from fine;

-- Cast loan_id in the LOAN table to NUMBER.

select loan_id::int from loan;

-- Convert the loan_date from the LOAN table into VARCHAR.
select loan_date::varchar from loan;

-- 22. CONCAT and CONCAT_WS Functions
-- Use CONCAT() to join first_name and last_name with a space in between in the MEMBER table.
select first_name||' '||last_name from members;

-- Use CONCAT_WS() to combine the branch_name and location with a comma in the LIBRARY_BRANCH table.
select concat_ws(', ',branch_name, location) from LIBRARY_BRANCH;

-- Use CONCAT() to combine the title and author from the BOOK table.
select title||' '||isbn from book;

-- Use CONCAT_WS() to combine first_name, last_name, and email from the EMPLOYEE table.
select concat_ws(', ',first_name, last_name, email) from employee;


-- 23. LIKE and NOT LIKE
-- Select books whose title contains 'History' using LIKE.
select title from book
where title like  'History'
;

-- Select members whose email ends with 'library.com' using LIKE.
select email from members
where email like '%library.com'
;

-- Select books where isbn does not start with '978' using NOT LIKE.
select * from book
where isbn not like '978%'
;

-- Select branches where location contains 'Downtown' using LIKE.
select * from library_branch
where location like 'Downtown'
;

-- 24. EXISTS and NOT EXISTS
-- Select books where loans exist in the LOAN table using EXISTS.
 select * from book
where EXISTS (select * from loan)
;

-- Select employees where no loans exist using NOT EXISTS.
select * from employee
where NOT EXISTS (select * from loan)
;

-- Select branches where books exist in the BOOK_INVENTORY table using EXISTS.
select * from  library_branch
where EXISTS (select * from BOOK_INVENTORY)
;

-- Select categories where no books exist using NOT EXISTS.
select * from book_category
where NOT EXISTS (select * from book)
;

-- 25. JOIN Commands
-- Select all members and their corresponding loans using INNER JOIN between MEMBER and LOAN.
select * from members
inner join loan using(member_id)
;

-- Select all books and their corresponding categories using INNER JOIN between BOOK and CATEGORY.
-- select * from book
-- inner join book_category using()

-- Select all employees and the branches they work at using LEFT JOIN between EMPLOYEE and LIBRARY_BRANCH.


-- Select all loans and the corresponding books using INNER JOIN between LOAN and BOOK.


-- 26. BETWEEN Command
-- Select all books where publication_year is between 1990 and 2020.
select * from book
where publication_year between 1990 and 2020
;

-- Select all loans where the loan_date is between '2022-01-01' and '2022-12-31'.
select * from loan
 where loan_date between '2022-01-01' and '2022-12-31'
;

-- Select all employees where the hire_date is between '2010-01-01' and '2020-01-01'.
select * from employee
 where hire_date between '2010-01-01' and '2020-01-01'
;

-- Select all fines where fine_amount is between 10 and 100.
select * from fine
where fine_amount between 10 and 100
;

-- 27. IN and NOT IN Command
-- Select all books where book_id is in (1, 2, 3, 5).
select * from book
where book_id in (1, 2, 3, 5)
;

-- Select all members where the member_id is in (101, 202, 303).
select * from members
 where member_id in (101, 202, 303)
;

-- Select all loans where the status is not in ('Overdue', 'Completed').
-- select * from loan
--  where status not in ('Overdue', 'Completed')
-- ;

-- Select all employees where the branch_id is in (1, 2, 5).
select * from employee
where branch_id in (1, 2, 5)
;

-- 28. UNION Command
-- Select all books from the BOOK and BOOK_INVENTORY using UNION.

-- Select members from different branches using UNION ALL.

-- Use UNION to combine loans from two different years.

-- Use UNION ALL to combine book categories across two different departments.


-- 29. ARRAY Command
-- Select all category_name and convert it into an array using COLLECT().

-- Use UNNEST() to expand arrays from the CATEGORY table.

-- Convert author names into an array using COLLECT() in the BOOK_AUTHOR table.

-- Use ARRAY functions to select and manipulate data from the FINE table.
