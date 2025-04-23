-- Chapter 7 - DQL (Data Query Language)
-- DQL Assignment 4 - MS SQL Logic for Dashboard Reporting in a Food Delivery System


-- Assignment Tasks:
-- 1. Customer Overview
-- Metrics:
-- Total number of customers.
-- List of customers with email and address.
-- Number of orders per customer.

-- SQL Queries:
-- Count total customers.
select count(*) from customer;

-- Retrieve customer details (name, email, address).
select 
	first_name||' '||last_name as name
	,email
	,address 
from customer;

-- Retrieve the number of orders for each customer (join CUSTOMER and ORDER).
select 
	customer_id
	,count(order_id) as number_of_orders
from CUSTOMER
inner join "ORDER" using(customer_id)
group by customer_id
order by customer_id
;

-- 2. Restaurant Overview
-- Metrics:
-- Total number of restaurants.
-- Restaurants by location.
-- Popular restaurants by total number of orders.

-- SQL Queries:
-- Count total restaurants.
select count(*) from restaurant;

-- Retrieve restaurant names grouped by location.
select 
	location
	,restaurant_name
	,count(restaurant_name)
from restaurant
group by location,restaurant_name
;

-- Retrieve popular restaurants based on the number of orders (join RESTAURANT and ORDER). select * from "ORDER", select * from RESTAURANT
select 
	a.RESTAURANT_name
	,count(c.order_id)
from RESTAURANT a
inner join review aa using(restaurant_id)
inner join customer b using(customer_id)
inner join "ORDER" c ON b.customer_id = c.customer_id
group by a.RESTAURANT_name
order by count(c.order_id) desc
;

-- 3. Order Overview
-- Metrics:
-- Total number of orders.
-- Recent orders (last 3 months).
-- Orders by status (Pending, Delivered, Cancelled).

-- SQL Queries:
-- Count total orders.
select count(*) from "ORDER";

-- Retrieve recent orders.
select * from "ORDER"
where order_date = current_date
;

-- Retrieve orders grouped by status.
select 
	status
	,count(*)
from "ORDER"
group by status
;

-- 4. Menu Item Overview
-- Metrics:
-- Popular menu items by order frequency.
-- Menu items by restaurant.
-- Average price of menu items by restaurant.

-- SQL Queries:
-- Retrieve popular menu items. (select * from "ORDER")
select 
	b.item_name
	,count(c.order_id)
from order_item a
inner join menu_item b using(menu_item_id)
inner join "ORDER" c using(order_id)
group by b.item_name
order by count(c.order_id) desc
;

-- Retrieve menu items grouped by restaurant (join MENU_ITEM and RESTAURANT).
select 
	restaurant_name
	,count(item_name) as menu_item
from MENU_ITEM
inner join RESTAURANT using(RESTAURANT_id)
group by restaurant_name
;

-- Retrieve the average price of menu items for each restaurant. (select * from menu_item)
select 
	restaurant_name
	,avg(price)
from menu_item
inner join RESTAURANT using(RESTAURANT_id)
group by restaurant_name
;

-- 5. Delivery Overview
-- Metrics:
-- Total deliveries per delivery agent.
-- Recent deliveries (last month).
-- Delivery status (In Transit, Delivered).

-- SQL Queries:
-- Retrieve the number of deliveries per delivery agent.
select 
	agent_id
	,count(delivery_id)
from delivery
group by agent_id
order by count(delivery_id) desc, 1 asc
;

-- Retrieve recent deliveries.
select 
	*
from delivery
where delivery_date = current_date
;

-- Retrieve deliveries grouped by status.
select 
	status
	,count(*)
from delivery
group by status
;

-- 6. Audit Log Overview
-- Metrics:
-- Actions performed by customers.
-- System changes related to orders.
-- Number of logs per day.

-- SQL Queries:
-- Retrieve recent actions performed by customers.
select 
	customer_id
	,count(order_id)
from customer
inner join "ORDER" using(customer_id)
group by customer_id
order by 2 desc, 1 asc
;

-- Retrieve system changes related to orders.
select * from "ORDER"
where order_date = current_date
;

-- Count the number of logs per day.
select 
	count(*)
from audit_log
where log_date = current_date
;

-- Key Visuals and Corresponding SQL Queries:
-- Note: All dashboard queries must work against current month or current year filters

-- Bar Chart - Orders by Customer
-- SQL Query: Retrieve the total number of orders per customer.
-- X-Axis: Customer names.
-- Y-Axis: Number of orders.
select 
	first_name||' '||last_name as Customer_names
	,count(order_id) as Number_of_orders
from customer
inner join "ORDER" using(customer_id)
group by first_name||' '||last_name
;

-- Pie Chart - Revenue by Menu Category
-- SQL Query: Retrieve revenue per menu category.
-- Pie Sections: Status and order count.
select 
	status
	,count(order_id) as order_count
from "ORDER"
group by status
;

-- Line Graph - New Customers by Month
-- SQL Query: Retrieve the number of new customers per month.
-- X-Axis: Registration date (grouped by month).
-- Y-Axis: Number of new customers.
select 
	extract(month from created_at) as month
	,count(customer_id) as no_of_new_customer
from customer
group by created_at
;

-- Table - Delivery Status
-- SQL Query: Retrieve order id, order sttus, delivery status, and delivery agent.
select 
	c.order_id
	,c.status as order_status
	,a.status as delivery_status
	,a.agent_id as delivery_agent
	,b.first_name||' '||b.last_name as delivery_agent
from Delivery a
inner join Delivery_agent b using(agent_id)
inner join "ORDER" c using(order_id)
;


-- Gauge - Total Orders
-- SQL Query: Count the total number of orders in the system.
-- Display: Total order count.
select 
	order_id
	,count(*)
from "ORDER"
group by order_id
order by order_id
;