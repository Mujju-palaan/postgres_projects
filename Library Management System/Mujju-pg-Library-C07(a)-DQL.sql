1. SELECT Command
Select all columns from the BOOK table.
Select the title, author, and isbn of all books.
Select the first_name and email from the MEMBER table.
Select the loan_date and due_date from the LOAN table.


2. WHERE Command
Select all members where membership_date is after '2020-01-01'.
Select all books where publication_year is before 2000.
Select all loans where due_date is before '2023-01-01'.
Select all books where isbn starts with '978'.


3. ORDER BY Command
Select all books and order them by title in ascending order.
Select all members and order them by last_name in descending order.
Select all loans and order them by loan_date in ascending order.
Select all employees and order them by hire_date in descending order.


4. LIMIT and ROWNUM Command
Select the first 10 books from the BOOK table using ROWNUM.
Select the first 5 loans from the LOAN table.
Select the top 3 members who joined the most recently.
Select the first 5 overdue loans, ordered by due_date.


5. DISTINCT Command
Select distinct author from the BOOK table.
Select distinct category_name from the CATEGORY table.
Select distinct last_name from the MEMBER table.
Select distinct branch_name from the LIBRARY_BRANCH table.


6. GROUP BY Command
Group by author from the BOOK table and count the number of books per author.
Group by category_name from the CATEGORY table and count the number of books per category.
Group by branch_name from the LIBRARY_BRANCH table and calculate the total number of books per branch.
Group by loan_date from the LOAN table and count the number of loans per day.



7. HAVING Command
Select category_name from the CATEGORY table and group by it, having more than 3 books per category.
Group by branch_name and calculate the total number of employees per branch, having more than 5 employees.
Group by loan_date from the LOAN table, having more than 3 loans on a particular day.
Group by author and filter the groups having more than 5 books written by that author.


8. INNER JOIN Command
Select all loans along with the corresponding member details using INNER JOIN between the LOAN and MEMBER tables.
Select all books and their corresponding category using INNER JOIN between the BOOK and CATEGORY tables.
Select all loans and the corresponding book titles using INNER JOIN between the LOAN and BOOK tables.
Select all employees and the branches they are assigned to using INNER JOIN between EMPLOYEE and LIBRARY_BRANCH.


9. LEFT JOIN Command
Select all members and their loans using LEFT JOIN, including members without any loans.
Select all books and their categories using LEFT JOIN, including books without categories.
Select all loans and their books using LEFT JOIN, including loans that don’t reference a specific book.
Select all branches and their employees using LEFT JOIN, including branches without any employees.


10. COUNT, SUM, AVG Command
Count the total number of books in the BOOK table.
Count the number of distinct category_name in the CATEGORY table.
Calculate the sum of fine_amount for all fines in the FINE table.
Calculate the average salary for all employees in the EMPLOYEE table.


11. CASE Command
Select all loans and use a CASE statement to show 'Overdue' if due_date is past the current date, and 'On Time' otherwise.
Select all members and categorize them as 'New Member' if their membership_date is after '2022-01-01', otherwise 'Old Member'.
Use a CASE statement to label loans as 'Completed' if the return_date is not null, otherwise 'Pending'.
Use a CASE statement in the FINE table to categorize fines as 'Low', 'Medium', or 'High' based on the fine_amount.


12. EXISTS and NOT EXISTS Command
Select all books where a loan exists in the LOAN table using EXISTS.
Select all members where no loans exist in the LOAN table using NOT EXISTS.
Select all categories where books exist in the BOOK table using EXISTS.
Select all employees where no loans were issued using NOT EXISTS.


13. SUBQUERY Command
Select all books whose book_id is in the result of a subquery selecting book_id from the LOAN table where due_date is past.
Select all employees who issued loans, using a subquery to get employee_id from the LOAN table.
Select all books that have not been loaned using a subquery.
Select all members who have not been fined using a subquery in the FINE table.


14. RANK and DENSE_RANK Command
Rank members based on the number of loans using RANK().
Use DENSE_RANK() to rank books by the number of times they were borrowed.
Rank loans by loan_date using RANK().
Use DENSE_RANK() to rank employees based on their hire_date.



15. PIVOT and UNPIVOT
Pivot the LOAN data by loan_date and book_id.
Unpivot the fine data to show fine_amount and fine_date in one row for each member.
Pivot the book inventory by branch_name and quantity.
Unpivot employee salaries by salary and branch_id.


16. UNION and UNION ALL Command
Select all books from the BOOK and BOOK_INVENTORY tables using UNION.
Select all members from different branches using UNION ALL.
Use UNION to combine completed and pending loans.
Use UNION ALL to select all categories from two different departments.


17. COALESCE, NVL, NULLIF Command
Select all books and use COALESCE to replace null publication_year with 'Unknown'.
Use NVL to replace null phone_number values in the MEMBER table.
Use NULLIF to compare due_date and return_date in the LOAN table and return NULL if they are the same.
Select all employees and use COALESCE to replace null email values with 'Not Provided'.


18. STRING Functions
Select all books' title in uppercase using the UPPER() function.
Select all members' first_name in lowercase using the LOWER() function.
Use CONCAT() to combine the first_name and last_name of members.
Select all books' isbn and find the length of the string using LENGTH().


19. DATE Functions
Select all members and show their membership_date formatted as 'YYYY-MM-DD' using TO_CHAR().
Add 1 year to all due_date values in the LOAN table using ADD_MONTHS().
Subtract 1 month from all hire_date values using MONTHS_BETWEEN().
Select all employees and extract the year from their hire_date using EXTRACT().


20. NUMERIC Functions
Select the fine_amount from the FINE table and round it to the nearest integer using ROUND().
Select all employees' salary and use CEIL() to round up.
Use FLOOR() to round down the fine_amount in the FINE table.
Select the highest fine_amount from the FINE table using MAX().


21. CAST and CONVERT Command
Select all members and cast the member_id as a string using CAST().
Convert fine_amount in the FINE table to DECIMAL using CONVERT().
Cast loan_id in the LOAN table to NUMBER.
Convert the loan_date from the LOAN table into VARCHAR.


22. CONCAT and CONCAT_WS Functions
Use CONCAT() to join first_name and last_name with a space in between in the MEMBER table.
Use CONCAT_WS() to combine the branch_name and location with a comma in the LIBRARY_BRANCH table.
Use CONCAT() to combine the title and author from the BOOK table.
Use CONCAT_WS() to combine first_name, last_name, and email from the EMPLOYEE table.


23. LIKE and NOT LIKE
Select books whose title contains 'History' using LIKE.
Select members whose email ends with 'library.com' using LIKE.
Select books where isbn does not start with '978' using NOT LIKE.
Select branches where location contains 'Downtown' using LIKE.


24. EXISTS and NOT EXISTS
Select books where loans exist in the LOAN table using EXISTS.
Select employees where no loans exist using NOT EXISTS.
Select branches where books exist in the BOOK_INVENTORY table using EXISTS.
Select categories where no books exist using NOT EXISTS.


25. JOIN Commands
Select all members and their corresponding loans using INNER JOIN between MEMBER and LOAN.
Select all books and their corresponding categories using INNER JOIN between BOOK and CATEGORY.
Select all employees and the branches they work at using LEFT JOIN between EMPLOYEE and LIBRARY_BRANCH.
Select all loans and the corresponding books using INNER JOIN between LOAN and BOOK.


26. BETWEEN Command
Select all books where publication_year is between 1990 and 2020.
Select all loans where the loan_date is between '2022-01-01' and '2022-12-31'.
Select all employees where the hire_date is between '2010-01-01' and '2020-01-01'.
Select all fines where fine_amount is between 10 and 100.


27. IN and NOT IN Command
Select all books where book_id is in (1, 2, 3, 5).
Select all members where the member_id is in (101, 202, 303).
Select all loans where the status is not in ('Overdue', 'Completed').
Select all employees where the branch_id is in (1, 2, 5).


28. UNION Command
Select all books from the BOOK and BOOK_INVENTORY using UNION.
Select members from different branches using UNION ALL.
Use UNION to combine loans from two different years.
Use UNION ALL to combine book categories across two different departments.


29. ARRAY Command
Select all category_name and convert it into an array using COLLECT().
Use UNNEST() to expand arrays from the CATEGORY table.
Convert author names into an array using COLLECT() in the BOOK_AUTHOR table.
Use ARRAY functions to select and manipulate data from the FINE table.