-- Stored Procedure for Purchase Order
-- Create a stored procedure that creates new purchase order by inserting data into purchase order and purchase order detail tables. 
--Also update current stock quantity in product table.

create or replace procedure scrop_purchase_order(
	IN iparam_supplier_id int
	,IN iparam_order_date date
	,IN iparam_total_amount numeric(10,2)
	---- purchase_order_detail
	,IN iparam_product_id int
	,IN iparam_quantity int
	,IN iparam_unit_amount numeric(10,2)
)
AS $$
DECLARE d_order_id int;
		d_total_amount numeric(10,2);
		d_quantity int;
		d_product_id int;
BEGIN
	--- inserting data into purchase order tables. (select * from purchase_order)
	insert into purchase_order(order_date, total_amount, supplier_id)
	values(iparam_order_date, iparam_total_amount, iparam_supplier_id)
	returning order_id, total_amount into d_order_id, d_total_amount
	;

	--- inserting data into purchase order detail tables. (select * from purchase_order_detail)
	insert into purchase_order_detail(quantity, unit_amount, total_amount, product_id, order_id)
	values(iparam_quantity, iparam_unit_amount, d_total_amount, iparam_product_id, d_order_id)
	returning quantity, product_id into d_quantity, d_product_id
	;

	--- update current stock quantity in product table. (select * from product) 
	update product
	set current_quantity = current_quantity - d_quantity
	where product_id = d_product_id
	;
	
END;
$$ language plpgsql;


-- CALL public.scrop_purchase_order(
-- 	1					-- <IN iparam_supplier_id integer>,
-- 	,current_date				-- <IN iparam_order_date  date>,
-- 	,20000				-- <IN iparam_total_amount  numeric>,
-- 	,1					-- <IN iparam_product_id  integer>,
-- 	,10					-- <IN iparam_quantity  integer>,
-- 	,2000				-- <IN iparam_unit_amount  numeric>
-- );


