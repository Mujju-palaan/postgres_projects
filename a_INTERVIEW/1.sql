-- 💼 Employee-related Queries

-- 2nd highest salary
select max(salary) from employee
where salary < (select max(salary) from employee)
;

select salary from employee
order by 1 desc
limit 1 offset 1
;

-- Employees with same branch
select 
	branch_id
	,count(*)
from employee
group by branch_id
order by branch_id
;


-- First and last record per employee (by hire_date)
select * from employee
where hire_date in (select max(hire_date) from employee
					 union
					select min(hire_date) from employee
					)
;


-- Most recent transcation by member
select * from membership_payment
where payment_date in (select max(payment_date) from membership_payment)
;

select member_id from membership_payment
where payment_id in (select max(payment_id) from membership_payment)
;


-- Most recent transcation for each member
select * from membership_payment
where payment_date in (select max(payment_date) 
						from membership_payment
						group by member_id
						)
order by member_id
;


-- Total salary per branch > 50,000
select 
	branch_id
	,sum(salary)
from employee
inner join library_branch using(branch_id)
group by branch_id
having sum(salary) > 50000
order by 1
;

---	Total no. of loans for each member
select
	member_id
	,count(*) as total_loans
from loan
group by member_id
order by member_id
;


-- Employees earning more than avg salary of their department
select * from employee
where salary > (select avg(salary)::numeric(10,2)
				from employee )
;


select * from employee a
where salary > (select avg(salary) from employee
				where branch_id = a.branch_id)
;

-- Employees hired per month and year
select 
	extract(month from hire_date) AS month
	,extract(year from hire_date) AS year
	,count(*) AS hires
from employee
group by extract(month from hire_date), extract(year from hire_date)
order by 1,2 asc
;

--	second lowest salary from emp tbl without using(LIMIT & OFFSET)
select min(salary) from employee
where salary > (select min(salary) from employee)
;

---	List all products never ordered(books never loaned)
select * from book
where book_id not in (select distinct book_id from loan)
;

-- Employees who are also managers
select * from employee
where employee_id in (select distinct manager_id from manager_tbl)
;

-- Employees joined in same month/year
SELECT *
FROM employee e1
WHERE EXISTS (
  SELECT 1 FROM employee e2
  WHERE e1.employee_id != e2.employee_id
    AND EXTRACT(MONTH FROM e1.hire_date) = EXTRACT(MONTH FROM e2.hire_date)
    AND EXTRACT(YEAR FROM e1.hire_date) = EXTRACT(YEAR FROM e2.hire_date)
)
order by hire_date asc
;

-- Employees older than avg age in their department
select * from employee a
where age > (select avg(age) from employee b
			  where a.department_id = b.department_id)
;

-- Employee(s) with longest tenure
select * from employee
where hire_date = (select min(hire_date) from employee)
;

-- ---------------------------------
-- 🧾 Order/Transaction-related Queries

-- All pairs of products ordered together at least once
SELECT o1.product_id AS product1, o2.product_id AS product2
FROM orders o1
JOIN orders o2 ON o1.order_id = o2.order_id AND o1.product_id < o2.product_id;


-- Average order value by customer for each month
select 
	member_id,
	extract(month from payment_date) AS month
	,avg(amount_paid)::float as avg_monthly_expendature
from membership_payment
group by member_id, extract(month from payment_date)
order by 1,2
;

-- Customers with monthly purchases in the past year
select 
	member_id
	,count(*)
	,sum(amount_paid) AS SUM
from membership_payment
group by member_id, payment_date
having extract(year from payment_date) = extract(year from current_date) - 1
;

-- Total revenue by region and quarter
select 
	branch_name,
	extract(quarter from payment_date) AS Quarter
	,sum(amount_paid)
from membership_payment
inner join loan using(member_id)
inner join library_branch ON issue_branch_id = branch_id
group by branch_name,
	extract(quarter from payment_date)
;

-- First purchase date per customer
select 
	member_id
	,min(payment_date) AS First_purchase_date
from membership_payment
group by member_id
order by 1
;

-- Year-on-year revenue growth
SELECT 
	extract(year from payment_date) AS YEAR
	,sum(amount_paid)
from membership_payment
group by extract(year from payment_date)
;

-- -----------------------------
-- 🔧 Trickier Query Requirements
-- Second-lowest salary without LIMIT or OFFSET


-- Delete rows where a column is NULL
delete from table
where column is null;


-- Nth highest salary (e.g. 5th)
select distinct salary from employee
order by salary
limit 1
offset 4
;


