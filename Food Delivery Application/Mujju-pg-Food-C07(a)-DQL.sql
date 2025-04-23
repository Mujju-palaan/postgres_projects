Chapter 7 - DQL (Data Query Language)
DQL ASSIGNMENT2 - Food Delivery System

1. SELECT Command
Select all columns from the CUSTOMER table.
Select the first_name, last_name, and email from the CUSTOMER table.
Select the restaurant_name and location from the RESTAURANT table.
Select the item_name, price, and restaurant_id from the MENU_ITEM table.
2. WHERE Command
Select all customers where loyalty_points are greater than 100.
Select all menu items where price is less than 20.
Select all orders where the status is 'Delivered'.
Select all reviews where rating is equal to 5.
3. ORDER BY Command
Select all restaurants and order them by restaurant_name in ascending order.
Select all customers and order them by last_name in descending order.
Select all orders and order them by order_date in ascending order.
Select all menu items and order them by price in descending order.
4. TOP Command
Select the top 5 customers from the CUSTOMER table based on loyalty_points.
Select the top 10 most expensive items from the MENU_ITEM table.
Select the top 3 latest orders from the ORDER table.
Select the top 5 restaurants from the RESTAURANT table based on location.
5. DISTINCT Command
Select distinct status from the ORDER table.
Select distinct rating from the REVIEW table.
Select distinct restaurant_name from the RESTAURANT table.
Select distinct payment_method from the PAYMENT table.
6. GROUP BY Command
Group by restaurant_name from the RESTAURANT table and count the number of menu items per restaurant.
Group by customer_id from the ORDER table and calculate the total orders per customer.
Group by status from the DELIVERY table and count the number of deliveries per status.
Group by rating from the REVIEW table and calculate the average rating per restaurant.
7. HAVING Command
Group by restaurant_name from the MENU_ITEM table and filter the results where the average price is greater than 15.
Group by customer_id from the ORDER table and having total orders greater than 5.
Group by status from the DELIVERY table, having more than 10 deliveries in transit.
Group by rating from the REVIEW table, having an average rating greater than 4 for restaurants.
8. INNER JOIN Command
Select all orders along with customer details using INNER JOIN between the ORDER and CUSTOMER tables.
Select all menu items and their corresponding restaurants using INNER JOIN between MENU_ITEM and RESTAURANT.
Select all deliveries and the corresponding agent details using INNER JOIN between DELIVERY and DELIVERY_AGENT.
Select all reviews and their corresponding restaurant details using INNER JOIN between REVIEW and RESTAURANT.
9. LEFT JOIN Command
Select all customers and their orders using LEFT JOIN, including customers without orders.
Select all restaurants and their menu items using LEFT JOIN, including restaurants without any menu items.
Select all orders and their corresponding deliveries using LEFT JOIN, including orders without deliveries.
Select all customers and their reviews using LEFT JOIN, including customers without reviews.
10. COUNT, SUM, AVG Command
Count the total number of customers in the CUSTOMER table.
Count the number of distinct restaurant_name in the RESTAURANT table.
Calculate the sum of total_price from the ORDER table.
Calculate the average rating from the REVIEW table.
11. CASE Command
Select all menu items and use a CASE statement to categorize them as 'Expensive' if price is greater than 50, otherwise 'Affordable'.
Select all orders and use a CASE statement to show 'High Value' if total_price is greater than 100, otherwise 'Standard'.
Use a CASE statement in the REVIEW table to label ratings as 'Excellent' if rating is 5, otherwise 'Average'.
Use a CASE statement in the DELIVERY table to show 'On Time' if status is 'Delivered' and delivery_date is less than 1 hour from the order_date.
12. EXISTS and NOT EXISTS Command
Select all customers where an order exists in the ORDER table using EXISTS.
Select all customers where no order exists in the ORDER table using NOT EXISTS.
Select all restaurants where a menu item exists in the MENU_ITEM table using EXISTS.
Select all deliveries where no agents exist in the DELIVERY_AGENT table using NOT EXISTS.
13. SUBQUERY Command
Select all customers whose customer_id is in the result of a subquery selecting customer_id from the ORDER table where total_price is greater than 50.
Select all menu items where the menu_item_id is in the result of a subquery selecting menu_item_id from the ORDER_ITEM table.
Select all orders where the order_id is in the result of a subquery selecting order_id from the PAYMENT table where amount is greater than 100.
Select all restaurants where the restaurant_id is in the result of a subquery selecting restaurant_id from the REVIEW table where rating is 5.
14. RANK and DENSE_RANK Command
Rank customers based on the number of orders they have placed using RANK().
Use DENSE_RANK() to rank menu items based on their price.
Rank restaurants based on their average rating using RANK().
Use DENSE_RANK() to rank customers based on the total amount of their orders.
15. PIVOT and UNPIVOT
Pivot the REVIEW data by restaurant_id and rating.
Unpivot the restaurant details to show the restaurant_name, location, and contact_number for each restaurant.
Pivot the menu item data by restaurant_id and item_name.
Unpivot order details by order_id, total_price, and status.
16. UNION and UNION ALL Command
Select all customers from the CUSTOMER and DELIVERY tables using UNION.
Select all menu items from different categories using UNION ALL.
Use UNION to combine pending and delivered orders.
Use UNION ALL to select all deliveries from two different time periods.
17. COALESCE, ISNULL, NULLIF Command
Select all customers and use COALESCE to replace null loyalty_points with 0.
Use ISNULL to replace null phone_number in the DELIVERY_AGENT table with 'No Phone'.
Use NULLIF to compare total_price and discount in the ORDER table and return NULL if they are the same.
Select all menu items and use COALESCE to replace null price with 0.
18. STRING Functions
Select all customers' first_name in uppercase using the UPPER() function.
Select all menu items' item_name in lowercase using the LOWER() function.
Use CONCAT() to combine the first_name and last_name of customers.
Select all restaurants' restaurant_name and find the length of the string using LEN().
19. DATE Functions
Select all orders and show their order_date formatted as 'YYYY-MM-DD' using FORMAT().
Add 1 year to all delivery_date values in the DELIVERY table using DATEADD().
Subtract 1 month from all order_date values using DATEADD().
Select all customers and extract the year from their registration_date using YEAR().
20. NUMERIC Functions
Select the total_price from the ORDER table and round it to the nearest integer using ROUND().
Select all menu items' price and use CEILING() to round up their values.
Use FLOOR() to round down the prices in the MENU_ITEM table.
Select the maximum total_price from the ORDER table using MAX().
21. CAST and CONVERT Command
Select all customers and cast the customer_id as a string using CAST().
Convert the order_date in the ORDER table to VARCHAR using CONVERT().
Cast the price in the MENU_ITEM table to INT.
Convert the payment_date from the PAYMENT table to DATETIME.
22. CONCAT and CONCAT_WS Functions
Use CONCAT() to join first_name and last_name with a space in between in the CUSTOMER table.
Use CONCAT_WS() to combine the restaurant_name and location with a comma in the RESTAURANT table.
Use CONCAT() to combine the item_name and price from the MENU_ITEM table.
Use CONCAT_WS() to combine first_name, last_name, and phone_number from the DELIVERY_AGENT table.
23. LIKE and NOT LIKE
Select customers where the email contains 'gmail.com' using LIKE.
Select restaurants where restaurant_name starts with 'S' using LIKE.
Select menu items where item_name contains 'Pizza' using LIKE.
Select customers where phone_number does not contain '123' using NOT LIKE.
24. EXISTS and NOT EXISTS
Select all customers where orders exist in the ORDER table using EXISTS.
Select all menu items where reviews exist using EXISTS.
Select all deliveries where agents exist using EXISTS.
Select all reviews where no customers exist using NOT EXISTS.
25. JOIN Commands
Select all customers and their corresponding orders using INNER JOIN between CUSTOMER and ORDER.
Select all menu items and their corresponding orders using INNER JOIN between MENU_ITEM and ORDER_ITEM.
Select all deliveries and their corresponding agents using INNER JOIN between DELIVERY and DELIVERY_AGENT.
Select all restaurants and their reviews using INNER JOIN between RESTAURANT and REVIEW.
26. BETWEEN Command
Select all orders where the total_price is between 50 and 100.
Select all reviews where the rating is between 4 and 5.
Select all customers where the registration_date is between '2020-01-01' and '2022-01-01'.
Select all payments where the amount is between 20 and 500.
27. IN and NOT IN Command
Select all customers where the customer_id is in (101, 202, 303).
Select all restaurants where the restaurant_name is in ('Pizza Palace', 'Burger Barn', 'Sushi Spot').
Select all orders where the status is not in ('Cancelled', 'Pending').
Select all deliveries where the status is in ('In Transit', 'Delivered').
28. UNION Command
Select all customers from the CUSTOMER and REVIEW tables using UNION.
Select all menu items from different categories using UNION ALL.
Use UNION to combine orders from two different time periods.
Use UNION ALL to select all reviews from two different rating ranges.
29. ARRAY Command
Select all item_name and convert it into an array using STRING_AGG().
Use UNSTRING() to expand arrays from the ORDER_ITEM table.
Convert restaurant names into an array using STRING_AGG() in the RESTAURANT table.
Use ARRAY functions to select and manipulate data from the REVIEW table.
GOOD LUCK WITH YOUR ASSIGNMENT!!!