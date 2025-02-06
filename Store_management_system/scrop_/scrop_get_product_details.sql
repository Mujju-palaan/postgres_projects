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
























