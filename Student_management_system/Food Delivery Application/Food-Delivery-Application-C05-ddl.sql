Question 1: Create the CUSTOMER Table
Write a DDL SQL statement to create a CUSTOMER table with the following requirements:

customer_id as a primary key with auto-increment functionality.
first_name as a string of maximum length 255 characters, not null.
last_name as a string of maximum length 255 characters, not null.
email as a unique string, not null.
phone_number as a string, not null.
gender as a string, not null.
address as a string of maximum length 500 characters, not null.
created_at as a datetime field, default it to system timestamp, not null.


Question 2: Create the RESTAURANT Table with Constraints
Create a RESTAURANT table with the following specifications:

restaurant_id as a primary key with auto-increment functionality.
restaurant_name as a string with a maximum length of 255 characters, not null.
location as a string with a maximum length of 255 characters, null.
contact_number as a string, null.
created_at as a datetime field, default it to system timestamp, not null.



Question 3: Create the MENU_ITEM Table
Define a MENU_ITEM table with the following details:

menu_item_id as a primary key with auto-increment functionality.
item_name as a string of maximum length 255 characters, not null.
item_category as a string of maximum length 255 characters, not null.
price as a decimal with precision (10, 2), not null.
restaurant_id as a foreign key referencing the RESTAURANT table, not null.
created_at as a datetime field, default it to system timestamp, not null.
Add a CHECK constraint to ensure that the item_category is in (Desserts, Soup, Drinks, Main Course, Starter).



Question 4: Create the COUPON Table
Write a DDL SQL statement to create a COUPON table:

coupon_id as the primary key with auto-increment functionality.
coupon_code as a string, unique and not null.
coupon_name as a string, unique and not null.
discount_percentage as a decimal (5, 2), not null.
start_date as a date, not null.
end_date as a date, not null.
active_flag as a boolean, default to true, not null.
created_at as a datetime field, default it to system timestamp, not null.
Add a CHECK constraint to ensure that the discount_percentage is between 0 and 100.



Question 5: Create the ORDER Table with a Foreign Key
Define an ORDER table:

order_id as a primary key with auto-increment functionality.
order_date as a timestamp with the default value of the current timestamp.
total_price as a decimal (10, 2), not null.
status as a string (e.g., "Pending", "Delivered", "Cancelled"), not null.
customer_id as a foreign key referencing the CUSTOMER table, not null.



Question 6: Define the ORDER_ITEM Table
Write the SQL statement to create a many-to-many relationship between orders and menu items. This will require the ORDER_ITEM table, which includes:

order_id as a foreign key referencing the ORDER table.
menu_item_id as a foreign key referencing the MENU_ITEM table, not null.
quantity as an integer, not null.
created_at as a datetime field, default it to system timestamp, not null.
Set up a composite primary key using order_id and menu_item_id.



Question 7: Define the ORDER_COUPON Table
Write the SQL statement to create a many-to-many relationship between orders and menu items. This will require the ORDER_COUPON table, which includes:

order_id as a foreign key referencing the ORDER table.
coupon_id as a foreign key referencing the COUPON table.
created_at as a datetime field, default it to system timestamp, not null.



Question 8: Create the PAYMENT Table
Write a DDL SQL statement to create a PAYMENT table with the following details:

payment_id as the primary key with auto-increment functionality.
payment_date as a timestamp, defaulting to the current timestamp.
amount as a decimal (10, 2), not null.
discount_amount as a decimal (10, 2), null.
payment_method as a string (e.g., "Credit Card", "Cash", "Online"), not null.
order_id as a foreign key referencing the ORDER table, not null.



Question 9: Create the REFUND Table with Constraints
Write a DDL SQL statement to create a REFUND table:

refund_id as a primary key with auto-increment functionality.
refund_amount as a decimal (10, 2), not null.
refund_date as a date field, not null.
order_id as a number, not null.
created_at as a datetime field, default it to system timestamp, not null.
Add a CHECK constraint to ensure the refund_amount is greater than 0.



Question 10: Create the DELIVERY_AGENT Table
Create a DELIVERY_AGENT table:

agent_id as a primary key with auto-increment functionality.
first_name as a string with a maximum length of 255 characters, not null.
last_name as a string with a maximum length of 255 characters, not null.
phone_number as a string, not null.
email as a string, not null.
vehicle_number as a string with a maximum length of 50 characters, not null.
created_at as a datetime field, default it to system timestamp, not null.



Question 11: Define the DELIVERY Table with Relationships
Write the SQL statement to create a DELIVERY table that includes:

delivery_id as a primary key with auto-increment functionality.
delivery_date as a timestamp with the default value as the current date.
pickup_time as a time, null.
delivered_time as a time, null.
status as a string (e.g., "In Transit", "Delivered"), not null.
agent_id as a foreign key referencing the DELIVERY_AGENT table, not null.
order_id as a foreign key referencing the ORDER table.
created_at as a datetime field, not null.



Question 12: Create the REVIEW Table
Define a REVIEW table with the following specifications:

review_id as a primary key with auto-increment functionality.
rating as an integer, not null.
review_text as a string of maximum length 500 characters, nullable.
customer_id as a foreign key referencing the CUSTOMER table, not null.
restaurant_id as a foreign key referencing the RESTAURANT table, not null.
created_at as a datetime field, default it to system timestamp, not null.



Question 13: Create the AUDIT_LOG Table
Define an AUDIT_LOG table to track changes in the food delivery system:

log_id as a primary key with auto-increment functionality.
log_date as a date field, not null.
action as a string to describe the action performed.
user_id as a foreign key referencing the CUSTOMER table.



Question 14: Create the CUSTOMER_LOGIN Table
Write a DDL SQL statement to create an CUSTOMER_LOGIN table (one-to-one relationship with employee table):

customer_id as a foreign key referencing the CUSTOMER table.
login_id can use alpha numeric login id or email as login id, not null.
password must encrypt the password before storing it in the database table, not null.
active_flag use numeric, 0 or 1, you can lock the customer login when required, not null.
last_login_datetime as a timestamp, last successfull login date for a given employee.



Question 15: Add a Column to the CUSTOMER Table
Write a SQL statement to add a loyalty_points column of type INT to the CUSTOMER table.

Question 16: Alter a Column in the COUPON Table
Write a SQL statement to alter the coupon_code column in the COUPON table, increasing its length to 50 characters.

Question 17: Drop a Column from the DELIVERY_AGENT Table
Write a SQL statement to drop the email column from the DELIVERY_AGENT table.

Question 18: Rename the AUDIT_LOG Table
Write a SQL statement to rename the AUDIT_LOGS table to FOOD_OUTLET.

Question 19: Drop the CUSTOMER_LOGIN Table
Write a SQL statement to drop the CUSTOMER_LOGIN table.

Question 20: Add a Primary Key on the ORDER_COUPON Table
Set up a composite primary key using order_id and coupon_id.
Question 21: Add a Foreign Key column to the ORDER Table
Add a foreign key in the ORDER table to reference the COUPON table.

Question 22: Alter the REFUND Table to Add a Foreign Key
Write a SQL statement to add a order_id foreign key referencing the ORDER table.

Question 23: Alter the CUSTOMER_LOGIN Table to drop a Foreign Key
Write a SQL statement to add a order_id foreign key referencing the CUSTOMER table.

Question 24: Add a CHECK Constraint on the CUSTOMER Table
Write a SQL statement to add a CHECK constraint to the CUSTOMER table ensuring that the gender is either M or F.

Question 25: Add a CHECK Constraint on the REVIEW Table
Write a SQL statement to add a CHECK constraint to the REVIEW table ensuring that the rating is between 1 and 5.

Question 26: Add a CHECK Constraint on the COUPON Table
Write a SQL statement to add a UNIQUE constraint to the COUPON table ensuring that the coupon_code is not repeated.

Question 27: Add a default Constraint on the DELIVERY Table
Write a SQL statement to add a current system timestamp DEFAULT constraint to the DELIVERY table on created_at column.

Question 28: Add Indexes to the CUSTOMER and RESTAURANT Tables
Write SQL statements to:

Add an index on the last_name column in the CUSTOMER table.
Add an index on the restaurant_name column in the RESTAURANT table.
Question 29: Drop an Index from the RESTAURANT Table
Write a SQL statement to drop the index on the restaurant_name column in the FOOD_OUTLET table.

Question 30: Enforce UNIQUE constraints on all applicable tables.
Apply UNIQUE constraints to columns across the entire database wherever duplicate data is not permitted.

