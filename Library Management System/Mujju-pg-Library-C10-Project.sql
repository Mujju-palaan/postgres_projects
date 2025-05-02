Assignment Tasks:
Stored Procedure Tasks:


Stored Procedure for Book Details

Write a stored procedure to retrieve all book details, including title, author, and isbn, for the Book Management screen’s data grid.

-----------------------------------------------------------------------------------------------------------------

Stored Procedure for Book Inventory

Write a stored procedure to insert new book records into the Book table and update the BOOK_INVENTORY table accordingly.

-----------------------------------------------------------------------------------------------------------------

Stored Procedure for Book Returns

Write a stored procedure to update the book return information.

-----------------------------------------------------------------------------------------------------------------

Stored Procedure for Membership Payments

Write a stored procedure to handle inserts and updates for membership payment management. The procedure should insert a record into the MEMBERSHIP_PAYMENT table and update the membership_expiry_date in the MEMBERSHIP table.


-----------------------------------------------------------------------------------------------------------------

Stored Procedure for Fine Collections

Write a stored procedure to handle fine collections. Compute the fine using the daily fine rate from the Fine Policy table, insert the fine into the FINES table, mark the book as returned in the Loan table, and record the return branch ID.

-----------------------------------------------------------------------------------------------------------------

Stored Procedure to retrieve Membership History

Write a stored procedure to retrieve membership history, including the member's name, current membership status (if any), number of books borrowed, late return count, on-time return count, total fine paid, number of times the membership was renewed, total amount paid to date, and the current membership status (expired or valid for X days)..


-----------------------------------------------------------------------------------------------------------------

Stored Procedure for Book Returns

Write a stored procedure to retrieve a popular book analysis, including branch, book title, author, number of times loaned, female borrower count, male borrower count, inventory count, and the number of idle days the book spent in the library.

-----------------------------------------------------------------------------------------------------------------

Stored Procedure for Daily Operations

Write a stored procedure to retrieve daily operations information by listing all calendar dates for a given month. For each date, include the total number of books borrowed, total books returned, total membership amount collected, total fines paid, new member signups, and the count of new books purchased. Ensure all calendar dates are included, even if no data exists for a given date, by using the Dim Date table with a LEFT JOIN. You will have to use temporary table concept to complete this store procedure.


-----------------------------------------------------------------------------------------------------------------

View Tasks:
View for Member Overview

Create a view to display ALL valid calendar dates for membership type of a given member.


-----------------------------------------------------------------------------------------------------------------

View for Publisher Inventory

Create a view to retrieve publisher inventory, including Publisher, Book Category, Title, and Book Count.


-----------------------------------------------------------------------------------------------------------------

View for Book Inventory

Create a view to fetch book inventory details, including Branch, Title, Category, Available Count, and Loaned Count.


-----------------------------------------------------------------------------------------------------------------

View for Barrowed Books Analysis

Create a view to retrieve information about loaned books, including Customer Name, Book Title, Pickup Date, Due Date, Return Date, Fine, and Status.


-----------------------------------------------------------------------------------------------------------------

Function Tasks:
Function to Calculate Total Fines per Member

Write a function that calculates the total fines owed by a member.


-----------------------------------------------------------------------------------------------------------------

Function to Calculate Available Books in Branch

Write a function to calculate the total number of available copies of a specific book across all branches.


-----------------------------------------------------------------------------------------------------------------
Trigger Task:
Trigger on Loan Return Date Changes
Create a trigger on the LOAN table that logs changes to the return_date field into the AUDIT_LOG table. Include the loan_id, old_return_date, new_return_date, and employee_id.


