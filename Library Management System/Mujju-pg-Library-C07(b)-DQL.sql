1. Book Overview
Task: Write SQL queries to generate the following metrics:
Total Books in Library: Write a query to count the total number of books across all branches.
Books by Category: Write a query to count how many books exist in each category (for a bar or pie chart).
Available Books per Branch: Write a query that retrieves the quantity of books available at each branch.
Recently Added Books: Write a query that lists books added in the past 30 days.
-----------------------------------------------------------------------------------------------------------------

2. Member Overview
Task: Write SQL queries to pull member-related insights:
Number of Members: Write a query to count the total number of members in the system.
Active Members: Write a query that retrieves members who have borrowed books in the last 6 months.
Member Loan History: Write a query that retrieves all loans made by each member, showing book titles, loan dates, and return dates (for a table).
Member Fine History: Write a query to list members who have outstanding fines, including fine amounts.

-----------------------------------------------------------------------------------------------------------------

3. Loan Overview
Task: Use SQL to pull loan-related insights:
Total Loans by Book: Write a query that retrieves the total number of loans for each book (for a bar chart).
Active vs Returned Loans: Write a query to count active loans (loans where return_date is null) versus returned loans.
Overdue Loans: Write a query that lists all overdue loans where the current date is past the due date and return_date is still null.

-----------------------------------------------------------------------------------------------------------------

4. Employee Overview
Task: Use SQL to manage employee-related data:
Number of Employees per Branch: Write a query to retrieve the number of employees working at each branch.
Employee Loan Activity: Write a query that retrieves the total number of loans issued by each employee.
Employee Salary Report: Write a query to retrieve the salary details for all employees.

-----------------------------------------------------------------------------------------------------------------

5. Branch Overview
Task: Write SQL queries to generate insights about library branches:
List of Branches: Write a query that lists all branches along with their locations.
Branch Inventory: Write a query that retrieves the total number of books available at each branch.
Branch Loan Activity: Write a query to retrieve total loans per branch, grouped by branch.

-----------------------------------------------------------------------------------------------------------------

**Key Visuals and Corresponding SQL Queries: **
Note: All dashboard queries must work against current month or current year filters

Bar Chart - Collections by Month
SQL Query: Retrieve the collection amount for each month.
X-Axis: Month names.
Y-Axis: Collection Amount.

-----------------------------------------------------------------------------------------------------------------

Pie Chart - Books by Category
SQL Query: Retrieve the count of books oer category.
Pie Sections: Book Category and their counts.

-----------------------------------------------------------------------------------------------------------------

Line Graph - User Signups by Month
SQL Query: Retrieve the number of members registered per month.
X-Axis: Registration date grouped by month.
Y-Axis: Number of members.

-----------------------------------------------------------------------------------------------------------------

**Table - Loans Status **
SQL Query: Retrieve Title, Member Name, Pickup Date, Due Date and Fine Amount.
Columns: Title, Member Name, Pickup Date, Due Date, Fine Amount.

-----------------------------------------------------------------------------------------------------------------

Gauge - On-time Return VS Overdue
SQL Query: Count the total number of ontime returns.
Display: Total returns.
