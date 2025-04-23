Chapter 6 - DML (Data Manipulation Language)
DML ASSIGNMENT2 - Food Delivery System

Question 1: Insert Data into all Tables
Write SQL queries to populate each table created in the Chapter 5 assignment with at least 10 rows of data.

Question 2: Insert a New Customer
Write a DML SQL statement to insert a new customer into the CUSTOMER table with the following details:

first_name: 'Sarah'
last_name: 'Johnson'
email: 'sarah.johnson@example.com'
phone_number: '1234567890'
address: '123 Main St, Springfield'
Question 3: Insert a Menu Item
Write a DML SQL statement to insert a new menu item into the MENU_ITEM table:

item_name: 'Margherita Pizza'
price: 12.99
restaurant_id: 1
Question 4: Insert an Order
Write a DML SQL statement to insert a new order into the ORDER table:

order_date: Current timestamp
total_price: 25.99
status: 'Pending'
customer_id: 1
Question 5: Insert into ORDER_ITEM Table
Write a SQL statement to insert a record into the ORDER_ITEM table with the following details:

order_id: 1
menu_item_id: 1
quantity: 2
Question 6: Insert a New Delivery Agent
Write a SQL statement to insert a new delivery agent into the DELIVERY_AGENT table:

first_name: 'John'
last_name: 'Doe'
phone_number: '5551234567'
vehicle_number: 'XYZ-9876'
Question 7: Insert a New Delivery
Write a SQL statement to insert a new delivery into the DELIVERY table:

delivery_date: Current timestamp
status: 'In Transit'
agent_id: 1
order_id: 1
Question 8: Insert Multiple Restaurants with one sql statement
Insert two new restaurants into the RESTAURANT table with the following details:

First restaurant: restaurant_name: 'Pizza Palace', location: 'Downtown', contact_number: '9876543210'
Second restaurant: restaurant_name: 'Sushi World', location: 'Uptown', contact_number: '5678901234'
Question 9: Insert a Record into the CUSTOMER Table with Default Values
Insert a record into the CUSTOMER table using default value for created_at.

Question 10: Insert into PAYMENT Table
Write a SQL statement to insert a payment into the PAYMENT table with the following details:

payment_date: Current timestamp
amount: 25.99
payment_method: 'Credit Card'
order_id: 1
Question 11: Insert into COUPON Table
Write a SQL statement to insert a new coupon into the COUPON table:

coupon_code: 'SAVE20'
discount_percentage: 20.00
Question 12: Insert into REVIEW Table
Write a SQL statement to insert a new review into the REVIEW table:

rating: 5
review_text: 'Great food!'
customer_id: 1
restaurant_id: 1
Question 13: Insert a New Refund
Write a SQL statement to insert a new refund into the REFUND table:

refund_amount: 5.99
refund_date: Current date
order_id: 1
Question 14: Select Into Backup Table
Write a SQL statement to create a backup of all rows in the CUSTOMER table into a new table called CUSTOMER_BACKUP.

Question 15: Insert Data Using Subquery
Write a SQL statement to insert a new order for the customer whose email = 'sarah.johnson@example.com' into the ORDER table. Use a subquery to retrieve the customer_id.

Question 16: Update Customer Information
Write a SQL statement to update the email and phone_number for the customer with customer_id = 1.

Question 17: Update Menu Item Price
Write a SQL statement to update the price of a menu item where menu_item_id = 1.

Question 18: Update with JOIN
Write a SQL statement to update the status of all deliveries to "Delivered" for all orders where the delivery agent has the last name 'Doe'. Use a join between the DELIVERY_AGENT and DELIVERY tables.

Question 19: Update with Subquery
Write a SQL statement to update the total_price of all orders where the customer has the last name 'Johnson'. Use a subquery to find the customer_id.

Question 20: Perform an UPSERT on COUPON Table
Write a SQL statement to insert a new coupon or update the discount_percentage if the coupon_id already exists in the COUPON table.

Question 21: Delete a Review
Write a SQL statement to delete a review where review_id = 3.

Question 22: Delete with JOIN
Write a SQL statement to delete all orders that include menu items from the restaurant 'Pizza Palace' using a JOIN between the RESTAURANT, MENU_ITEM, and ORDER_ITEM tables.

Question 23: Truncate the AUDIT_LOG Table
Write a SQL statement to truncate the AUDIT_LOG table, removing all rows without generating individual delete triggers.

Question 24: Add JSON Column to ORDER Table
Write a SQL statement to add a meta_data column of type JSON to the ORDER table.

Question 25: Insert into JSON Column
Write a SQL statement to insert JSON data into the meta_data column of the ORDER table. The JSON should contain keys like "delivery_estimate", "special_instructions", and "coupon_applied".

Question 26: Update JSON Column
Write a SQL statement to update the meta_data JSON column of the ORDER table by adding or updating the "delivery_estimate" for a specific order.

Question 27: SUPER Complex INSERT.
Create a DATE_DIM table with columns: date_id, calendar_date, year, month, day_of_the_month, week_day_number, week_day_name, yearly_week_number, month_start_date_flag, month_end_date_flag, year_start_date_flag, year_end_date_flag, holiday_flag
The date_id should be populated in the YYYYMM format (e.g., 202401).
Populate the DATE_DIM table with data for current year and the next year.


GOOD LUCK WITH YOUR ASSIGNMENT!!!