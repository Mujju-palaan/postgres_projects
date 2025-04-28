-- Chapter 10 - Projects
-- Final Capstone Project 1: Company Management System in MySQL

-- Assignment Tasks:
-- Stored Procedure Tasks:
-- ------------------------------------------------------------------------------------
-- Stored Procedure for All Contracts Data Grid
-- Write a stored procedure to retrieve project name, client name, start date, end date, total amount, paid amount, balance amount and project status.
----DONE
-- ------------------------------------------------------------------------------------

-- Stored Procedure for Customer Management
-- Create a stored procedure to insert customer information for the Customer Management screen.
----DONE

-- ------------------------------------------------------------------------------------

-- Stored Procedure for Supplier Management
-- Create a stored procedure to update supplier information for the Supplier Management screen.
----DONE

-- ------------------------------------------------------------------------------------

-- Stored Procedure for Contract Management
-- Create a stored procedure to add a new contract and a new project, ensuring the contract is associated with a client. 
--Additionally, generate three invoices by dividing the total amount into three equal parts, with each invoice having a due date spaced one month apart.
----DONE

-- ------------------------------------------------------------------------------------

-- Stored Procedure for Purchase Order
-- Create a stored procedure that creates new purchase order by inserting data into purchase order and purchase order detail tables. 
--Also update current stock quantity in product table.
----DONE

-- ------------------------------------------------------------------------------------

-- Stored Procedure for Receivable Payment Insertion
-- Write a stored procedure to insert new payment information for an invoice into receivable transaction table, 
--also update invoice status in invoice table as paid.
----DONE

-- ------------------------------------------------------------------------------------

-- Stored Procedure for Analysing Project Work Hours
-- Create a stored procedure to analyze the work hours logged by employees for a all calendar dates of a given project. 
--The procedure should list each calendar date within the project’s start and end dates and display the total work hours logged by all employees. 
--If any calendar date has no logged work hours, it should show zero. You would need to use stored procedure's temporary table technique.

-- ------------------------------------------------------------------------------------

-- View Tasks:
-- View for Employee Details
-- Create a view to display employee details.
----DONE

-- ------------------------------------------------------------------------------------

-- View for Contract Details
-- Create a view to display project name, client name, start date, end date, Total amount, balance amount and project status.
----DONE

-- ------------------------------------------------------------------------------------

-- View for Inventory Overview
-- Write a view to display the available inventory of each product, showing product name, product_category, quantity in stock and re-order level.
----DONE

-- ------------------------------------------------------------------------------------

-- View for Client Analysis
-- Create a view to analyze client business deals for a specific year. The view should display the following information: 
-- client name, calendar year, calendar month, project count, contract count, and project amount. 
-- Ensure that all months are displayed, even if there are no business transactions with the client. 
-- To achieve this, use the date dimension table as main table and apply the LEFT JOIN technique on other tables.
----DONE

-- ------------------------------------------------------------------------------------

-- Function Tasks:
-- Function to Calculate Total Contracts for Customer
-- Write a function that calculates the total number of contracts placed by a specific customer.
----DONE

-- ------------------------------------------------------------------------------------

-- Function to Get Available Stock
-- Write a function that retrieves available stock for a given product.
----DONE

-- ------------------------------------------------------------------------------------

-- Function to Calculate Profit for a given Project
-- Write a function that retrieves profit of a given project after considering employee cost, product used cost and contract value.
----DONE

-- ------------------------------------------------------------------------------------

-- Trigger Task:
-- Trigger on Amount Change
-- Create a trigger on the CONTRACT table that logs any changes made to the total_amount field into the AUDIT_LOG table. 
--Ensure it captures the contract_id, old_total, new_total, and log_date.
----DONE
