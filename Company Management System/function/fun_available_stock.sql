-- Function to Get Available Stock
-- Write a function that retrieves available stock for a given product.

create or replace function fun_available_stock()
returns table(
	product_id int
	,product_name varchar
	,available_stock int
)
AS $$

BEGIN
	return query
	---
	select
		a.product_id
		,a.product_name
		,a.current_quantity
	from product a
	order by 1,2
	;
	
END;
$$ language plpgsql;

-- select * from fun_available_stock();