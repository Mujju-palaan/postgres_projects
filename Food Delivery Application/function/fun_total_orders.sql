-- Function to Calculate Total Orders by Customer
-- Write a function to calculate the total number of orders placed by a specific customer.
create or replace function fun_total_orders(iparam_customer_id int)
returns int

AS $$

DECLARE d_order_count int;
BEGIN
	select
		count(order_id)
		into d_order_count
	from "ORDER"
	where customer_id = iparam_customer_id
	;

	return d_order_count;

END;
$$ language plpgsql;


-- select * from fun_total_orders(1);