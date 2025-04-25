Chapter 7 - DQL (Data Query Language)
DQL ASSIGNMENT3 - SQL Logic for Dashboard Reporting in a Company Management System

1. Department Overview
Task: Write SQL queries to generate the following metrics:
Number of Departments: Write a query to count the total number of departments in the company.
Department Names and Locations: Write a query to list all departments along with their respective locations.
Employees per Department: Write a query to retrieve the number of employees in each department.


2. Employee Overview
Task: Write SQL queries to pull employee-related insights:
Number of Employees: Write a query to count the total number of employees in the system.
Employee Salaries: Write a query to retrieve the average, minimum, and maximum salary for employees, grouped by department (for a stacked bar chart).
Employee Hire Dates: Write a query to retrieve the number of employees hired over time, grouped by month.


3. Project Overview
Task: Use SQL to pull project-related insights:
Total Number of Projects: Write a query to count how many projects are currently active in the system.
Projects by Employee: Write a query that retrieves the list of employees and the number of projects they are assigned to.
Projects with End Date Violations: Write a query to identify projects where the end_date is before the start_date (CHECK constraint violation).


4. Client Overview
Task: Write SQL queries to manage client-related data:
List of Clients: Write a query to list all clients along with their emails and ensure no duplicate clients exist (use the unique constraint on client_name).
Client Contracts: Write a query to retrieve the total amount of contracts for each client.
Recently Registered Clients: Write a query that lists all clients who have registered in the last 6 months.


5. Contract and Invoice Overview
Task: Use SQL queries to manage contract and invoice data:
Total Contract Value: Write a query that retrieves the total value of all contracts.
Outstanding Invoices: Write a query that lists all invoices where the amount_due is greater than 0.
Invoices by Project: Write a query that retrieves the total value of invoices for each project.


Key Visuals and Corresponding SQL Queries:
Note: All dashboard queries must work against current month or current year filters


Stacked Bar Chart - Employee Salaries by Department (Max, Min, Avg)
Query: Write an SQL query to retrieve the maximum, minimum, and average salaries for employees, grouped by department, from the `EMPLOYEE` and `DEPARTMENT` tables.
X-Axis: Department names.
Y-Axis: Salary values.



Bars: Three stacked bars for each department representing maximum, minimum, and average salary values.
Pie Chart - Employee Birthdates by Month
Query: Write a query to count the number of employees born in each month (using the birthdate field in the `EMPLOYEE` table), grouped by month.
Sections: Months with the count of employees born in each month as values.



Line Graph - Projects Count by Month
Query: Write a query to retrieve the number of projects started per month from the `PROJECTS` table.
X-Axis: Project Start date (grouped by month).
Y-Axis: Number of projects.


Table - Client Contract Summary
Query: Write an SQL query to retrieve contract details from the `CONTRACT` and `CLIENT` tables, showing client names, contract dates, and total contract amounts.
Columns: Client Name, Contract Date, Total Amount.