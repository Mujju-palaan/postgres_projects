-- Chapter 10 - Projects
-- Final Capstone Project 1: Store Management System in MS SQL Server

-- Assignment Tasks:
-- Stored Procedure Tasks:
---------------------------------------------------------------------------------------------------------------------------------------
-- 1)Stored Procedure for Product Management Data Grid
-- Write a stored procedure to retrieve all product details for the Product Management screen,
-- including product_name, price, and quantity_in_stock.
-----select product_name, price, quantity_in_stock from product;

create or replace procedure scrop_get_product_details(
	in iparam_product_id int
)
language plpgsql
as $$

declare product_rec record;

Begin
	for product_rec in
	select product_name, price, quantity_in_stock from product
	where product_id = iparam_product_id

	loop
		RAISE NOTICE 'Product Name: %, Price: %, Stock: %', product_rec.product_name,product_rec.price,product_rec.quantity_in_stock;
 	end loop;

END;
$$;

--call scrop_get_product_details(1);

---------------------------------------------------------------------------------------------------------------------------------------
-- 2)Stored Procedure for Customer Management
-- Create a stored procedure to insert customer information for the Customer Management screen.
--select * from customer

create or replace procedure scrop_dml_insert_customer(
	In iparam_first_name varchar,
	IN iparam_last_name varchar,
	IN iparam_gender char,
	IN iparam_id_type varchar,
	IN iparam_id_number varchar,
	IN iparam_email varchar,
	IN iparam_phone_number varchar,
	IN iparam_address varchar,
	In iparam_city_id int
)
language plpgsql
AS $$

BEGIN
	--insert customer
	insert into customer(first_name, last_name, gender, id_type, id_number, email, phone_number, address, city_id)
	values(iparam_first_name, iparam_last_name, iparam_gender, iparam_id_type, iparam_id_number, iparam_email,
		iparam_phone_number, iparam_address, iparam_city_id);

END;
$$;

--call scrop_dml_insert_customer('DR','Kefaya','F','passport','Q34554','dr.kef@tansycloud.com','234545645', 'kompally', 1)

---------------------------------------------------------------------------------------------------------------------------------------
-- 3)Stored Procedure for Product Management
-- Create a stored procedure to update product information for the Product Management screen.
--select * from product;

create or replace procedure scrop_dml_update_product(
	IN iparam_product_id int,
	IN iparam_product_price numeric(10,2)
)
language plpgsql
AS $$

BEGIN
	update product set price = iparam_product_price
	where product_id = iparam_product_id;

END;
$$;

--call scrop_dml_update_product(17,6.99);

---------------------------------------------------------------------------------------------------------------------------------------
-- 4)Stored Procedure for Order Management
-- Write a stored procedure to create a new order. This procedure should insert data into 
-- the ORDER and ORDER_PRODUCT tables while updating the INVENTORY table to deduct the available stock accordingly.
select * from orders;
select * from order_product;





---------------------------------------------------------------------------------------------------------------------------------------
-- 5)Stored Procedure for Payment Insertion
-- Write a stored procedure to insert new payment information for an order in the Payment Management screen. 
--Alos update order sattus as piad in order table.






---------------------------------------------------------------------------------------------------------------------------------------
-- 6)Stored Procedure for Customer Analysis
-- Develop a stored procedure to analyze customer revenue. This procedure should generate a report 
--displaying the month name, customer name, the number of orders for each specified month, 
--and the total revenue for that month. The output must include all months of the current year, 
--even if no orders were placed in certain months. Use the dim dimension table as the primary data source 
--and apply left joins with related tables to retrieve the necessary details. Incorporate the temporary table 
--technique within the stored procedure for efficient data processing.






-- 7) Stored Procedure for Analyzing Sales by Store
-- Create a stored procedure to analyze store sales performance. The procedure should display the 
--store name, location, total sales, the number of transactions, and the average transaction value for a given date range. 
--It should also include comparisons to the previous period's sales and highlight stores with significant performance changes. 
--Use a temporary table to store intermediate calculations for efficient data processing and join data from relevant 
--tables such as stores, sales, and transactions.






























