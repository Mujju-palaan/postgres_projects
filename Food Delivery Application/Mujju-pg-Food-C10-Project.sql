Chapter 10 - Projects
Final Capstone Project 2: Food Delivery System in MS SQL Server

Assignment Tasks:
Stored Procedure Tasks:

Stored Procedure for Restuarant Information
Create a stored procedure to fetch details of all restaurants.



Stored Procedure for Menu Creation
Create a stored procedure to insert data into the menu_item table.



Stored Procedure for Delivery Management

Create a stored procedure to update the order and delivery statuses.




Stored Procedure for Orders Management

Create a stored procedure to manage order data by inserting information into the order, order items, payment, and order coupon tables (Order coupon insert if applicable, as not all orders use coupons).




Stored Procedure for Delivery Management

Create a stored procedure for Delivery Management to insert delivery agent data and update the order status.



Stored Procedure for Review Analysis

Create a stored procedure for Review Analysis to retrieve the Month, Restaurant, Rating, and Review Count. Use a temporary table and date dimension table. Ensure that order months are displayed even if there are no reviews for a given month (LEFT JOIN).



Stored Procedure for Collection Analysis

Create a stored procedure for Collection Analysis to retrieve data for the collections data grid, including Date, Weekday Name, Order Count, Customer Count, Total Amount, Discount Amount, and Discount Percent.



View Tasks:
View for Customer Informationw

Create a view to display customer information from customer table.



View for Order Overview

Design a view to retrieve order details, including Order ID, Order Date, Customer Name, Amount, Order Status, Delivery Status, and Delivery Agent's Phone Number.



View for Delivery Details

Create a view to fetch delivery information, including Delivery Date, Order ID, Delivery Agent, Order Duration, Delivery Duration, and Delivery Status.



View for Coupon Analysis

Create a view to retrieve coupon analysis, including Coupon Name, Calendar Date, Redeem Count, and Redeem Amount. Display Redeem Amount as zero for calendar dates with no redeems. Use a JOIN with the date dimension table.



Function Tasks:
Function to Calculate Total Orders by Customer

Write a function to calculate the total number of orders placed by a specific customer.




Function to Calculate Total Payments Received for a Restaurant

Write a function that returns the total payments received by a restaurant based on all orders.



Trigger Task:

Trigger on Order Status Change
Create a trigger on the ORDER table that logs any changes to the status field into the AUDIT_LOG table. Capture the order_id, old_status, new_status, and log_date.
