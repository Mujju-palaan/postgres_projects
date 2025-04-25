-- Stored Procedure for Orders Management
-- Create a stored procedure to manage order data by inserting information into the order, order items, payment, 
--and order coupon tables (Order coupon insert if applicable, as not all orders use coupons).

create or replace procedure scrop_orders_management(
	---order
	-- IN iparam_order_date date
	IN iparam_total_price numeric(10,2)
	,IN iparam_status varchar		---('Pending','Delivered','Cancelled')
	,IN iparam_customer_id int
	,IN iparam_coupon_id int
	---order_item
	,IN iparam_menu_item_id int
	,IN iparam_quantity int
	---payment
	-- ,IN iparam_payment_date
	-- ,IN iparam_amount
	-- ,IN iparam_discount_amount
	,IN iparam_payment_method varchar	---('Credit Card', 'Cash', 'Online')
)AS $$

DECLARE 
	d_order_id int;
	d_total_price numeric;
	d_quantity int;
	d_discount_percentage numeric;
	d_discount_amount numeric;
BEGIN 
	---insert order (select * from "ORDER")
	insert into "ORDER"(order_date, total_price, status, customer_id, coupon_id)
	values(current_timestamp, iparam_total_price, iparam_status, iparam_customer_id, iparam_coupon_id)
	returning order_id,total_price into d_order_id,d_total_price
	;
	
	---insert order items (select * from order_item)
	insert into order_item(order_id, menu_item_id, quantity)
	values(d_order_id, iparam_menu_item_id, iparam_quantity)
	returning quantity into d_quantity
	;

	----declare (select * from coupon)
	select discount_percentage
	into d_discount_percentage
	from coupon
	where coupon_id = iparam_coupon_id
	;

	---declare
	select (d_total_price * d_discount_percentage) / 100
	into d_discount_amount;
	
	---insert payment (select * from payment)
	insert into payment(payment_date, amount, discount_amount, payment_method, order_id)
	values(current_date, ((d_total_price*d_quantity)-d_discount_amount), d_discount_amount, iparam_payment_method, d_order_id)
	;

	---insert order coupon (select * from order_coupon)
	
	insert into order_coupon(order_id, coupon_id)
	values(d_order_id, iparam_coupon_id)
	;

END;
$$ language plpgsql;


-- CALL public.scrop_orders_management(
-- 	5				-- <IN iparam_total_price numeric>,
-- 	,'Delivered'	-- <IN iparam_status  character varying>,
-- 	,1				-- <IN iparam_customer_id  integer>,
-- 	,1				-- <IN iparam_coupon_id  integer>,
-- 	,1				-- <IN iparam_menu_item_id  integer>,
-- 	,5				-- <IN iparam_quantity  integer>,
-- 	,'Online'		-- <IN iparam_payment_method  character varying>
-- );



























