-- Chapter 7 - DQL (Data Query Language)
-- DQL ASSIGNMENT3 - SQL Logic for Dashboard Reporting in a Company Management System

-- 1. Department Overview
-- Task: Write SQL queries to generate the following metrics:
-- Number of Departments: Write a query to count the total number of departments in the company.
select count(*) from department;

-- Department Names and Locations: Write a query to list all departments along with their respective locations.
select 
	department_name, location
from department;

-- Employees per Department: Write a query to retrieve the number of employees in each department.
select 
	department_name
	,count(employee_id)
from department
inner join employee using(department_id)
group by department_name
;

-- 2. Employee Overview
-- Task: Write SQL queries to pull employee-related insights:
-- Number of Employees: Write a query to count the total number of employees in the system.
select count(*) from employee;

-- Employee Salaries: Write a query to retrieve the average, minimum, and maximum salary for employees, grouped by department (for a stacked bar chart).
select
	department_name
	,avg(salary)::numeric(10,2)
	,min(salary)::numeric(10,2)
	,max(salary)::numeric(10,2)
from employee
inner join department using(department_id)
group by department_name
;

-- Employee Hire Dates: Write a query to retrieve the number of employees hired over time, grouped by month.
select 
	hire_date
	,count(employee_id)
from employee
group by hire_date, extract(month from hire_date)
order by 1,2
;

-- 3. Project Overview
-- Task: Use SQL to pull project-related insights:
-- Total Number of Projects: Write a query to count how many projects are currently active in the system.
select count(*) from project;

-- Projects by Employee: Write a query that retrieves the list of employees and the number of projects they are assigned to.
select 
	employee_id
	,count(project_id)
from employee_project
inner join project using(project_id)
group by employee_id
order by 1,2
;

-- Projects with End Date Violations: Write a query to identify projects where the end_date is before the start_date (CHECK constraint violation).
select 
	*
from project
where end_date < start_date
;

-- 4. Client Overview
-- Task: Write SQL queries to manage client-related data:
-- List of Clients: Write a query to list all clients along with their emails and ensure no duplicate clients exist 
--(use the unique constraint on client_name).
select
	client_name distinct
	,email distinct
from client;

-- Client Contracts: Write a query to retrieve the total amount of contracts for each client.
select
	client_id
	,sum(amount)
from contract
group by client_id
order by 1
;

-- Recently Registered Clients: Write a query that lists all clients who have registered in the last 6 months.
select * from client
where created_at >= current_date - interval '6 months'
;

-- 5. Contract and Invoice Overview
-- Task: Use SQL queries to manage contract and invoice data:
-- Total Contract Value: Write a query that retrieves the total value of all contracts.
select 
	sum(amount)
from contract
;

-- Outstanding Invoices: Write a query that lists all invoices where the amount_due is greater than 0.
select
	*
from invoice
where amount_due > 0
;

-- Invoices by Project: Write a query that retrieves the total value of invoices for each project.
select 
	project_id
	,sum(amount)
from project
inner join contract using(project_id)
inner join invoice using(project_id)
group by project_id
order by 1
;


-- Key Visuals and Corresponding SQL Queries:
-- Note: All dashboard queries must work against current month or current year filters


-- Stacked Bar Chart - Employee Salaries by Department (Max, Min, Avg)
-- Query: Write an SQL query to retrieve the maximum, minimum, and average salaries for employees, grouped by department, 
--from the `EMPLOYEE` and `DEPARTMENT` tables.
-- X-Axis: Department names.
-- Y-Axis: Salary values.
select 
	 department_name
	 ,max(salary)
	 ,min(salary)
	 ,avg(salary)::numeric(10,2)
from employee
inner join department using(department_id)
group by department_name
;

-- Bars: Three stacked bars for each department representing maximum, minimum, and average salary values.
-- Pie Chart - Employee Birthdates by Month
-- Query: Write a query to count the number of employees born in each month (using the birthdate field in the `EMPLOYEE` table), grouped by month.
-- Sections: Months with the count of employees born in each month as values.
select 
	extract (month from hire_date)
	,count(*)
from employee
group by extract (month from hire_date)
order by 1
;


-- Line Graph - Projects Count by Month
-- Query: Write a query to retrieve the number of projects started per month from the `PROJECTS` table.
-- X-Axis: Project Start date (grouped by month).
-- Y-Axis: Number of projects.
select 
	extract (month from start_date)
	,count(*)
from project
group by extract (month from start_date)
order by 1
;

-- Table - Client Contract Summary
-- Query: Write an SQL query to retrieve contract details from the `CONTRACT` and `CLIENT` tables, 
--showing client names, contract dates, and total contract amounts.
-- Columns: Client Name, Contract Date, Total Amount.
select 
	client_name
	,contract_date
	,sum(amount)
from contract
inner join client using(client_id)
group by client_name, contract_date
;


