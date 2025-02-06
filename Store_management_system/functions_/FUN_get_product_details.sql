-- 1)Stored Procedure for Product Management Data Grid
-- Write a stored procedure to retrieve all product details for the Product Management screen,
-- including product_name, price, and quantity_in_stock.

-----select product_name, price, quantity_in_stock from product;


create or replace function FUN_get_product_details(iparam_product_id int)
returns table(
	iparam_product_name varchar,
	iparam_price numeric,
	iparam_quantity_in_stock varchar
)
as $$
BEGIN
	RETURN QUERY
	select product_name, price, quantity_in_stock 
	from product
	where product_id = iparam_product_id;
	
END;
$$ language plpgsql;

--select * from FUN_get_product_details(1);

