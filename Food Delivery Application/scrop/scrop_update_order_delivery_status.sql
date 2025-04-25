-- Stored Procedure for Delivery Management
-- Create a stored procedure to update the order and delivery statuses.

create or replace procedure scrop_update_order_delivery_status(
	IN iparam_order_id int
	,IN iparam_order_status varchar		---('Delivered','Pending','Cancelled')
	,IN iparam_delivery_status varchar		---('Delivered','In Transit')
	-- ,IN iparam_delivery_status
)
AS $$

BEGIN
	----update order ( Select * from "ORDER" )
	update "ORDER"
	set status = iparam_order_status
	where order_id = iparam_order_id
	;

	----update delivery ( Select * from delivery )
	update delivery
	set status = iparam_delivery_status
	where order_id = iparam_order_id
	;

	-- update "ORDER" a
	-- set a.status = iparam_order_status, b.status =  iparam_delivery_status
	-- from delivery b
	-- where a.order_id = b.order_id AND a.order_id = iparam_order_id
	-- ;
	
END;
$$ language plpgsql;

-- call scrop_update_order_delivery_status(1,'Delivered','Delivered');








