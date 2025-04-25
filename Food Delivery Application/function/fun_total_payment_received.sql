-- Function to Calculate Total Payments Received for a Restaurant
-- Write a function that returns the total payments received by a restaurant based on all orders.
-- select * from Restaurant

create or replace function fun_total_payment_received(iparam_restaurant_id int)
returns table(
	payment_id int
	,payment_date timestamp
	,amount numeric(10,2)
	,discount_amount numeric(10,2)
	,payment_method varchar
	,order_id int
)
AS $$

BEGIN
	return query

	select 
		a.payment_id 
		,a.payment_date 
		,a.amount 
		,a.discount_amount 
		,a.payment_method
		,b.order_id 
	from payment a
	inner join "ORDER" b using(order_id)
	inner join order_item c ON b.order_id = c.order_id
	inner join menu_item d using(menu_item_id)
	inner join restaurant e using(restaurant_id)
	where restaurant_id = iparam_restaurant_id
	;

END;
$$ language plpgsql;

-- select * from fun_total_payment_received(1);