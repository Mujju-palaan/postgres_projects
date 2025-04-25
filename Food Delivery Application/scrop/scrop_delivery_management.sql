-- Stored Procedure for Delivery Management
-- Create a stored procedure for Delivery Management to insert delivery agent data and and update the order status.

create or replace procedure scrop_delivery_management(
	---delivery_agent
	IN iparam_first_name varchar
	,IN iparam_last_name varchar
	,IN iparam_phone_number varchar
	,IN iparam_email varchar
	,IN iparam_vehicle_number varchar
	---order
	,IN iparam_status varchar		--('Pending','Delivered','Cancelled')
)
AS $$
DECLARE 
	d_agent_id int;
	d_order_id int;
BEGIN
	---insert delivery agent data (select * from delivery_agent)
	insert into delivery_agent(first_name, last_name, phone_number, email, vehicle_number)
	values(iparam_first_name, iparam_last_name, iparam_phone_number, iparam_email, iparam_vehicle_number)
	returning agent_id into d_agent_id
	;

	----
	select order_id 
	into d_order_id
	from delivery_agent a
	inner join delivery using(agent_id)
	inner join "ORDER" using(order_id)
	where agent_id = d_agent_id
	;
	
	---update the order status (select * from "ORDER")
	update "ORDER"
	set status = iparam_status
	where order_id = d_order_id
	;
	
END;
$$ language plpgsql;


-- CALL public.scrop_delivery_management(
-- 	'John'					-- <IN iparam_first_name character varying>,
-- 	,'Cena'					-- <IN iparam_last_name  character varying>,
-- 	,'+9102743232445'		-- <IN iparam_phone_number  character varying>,
-- 	,'john@gmail.com'		-- <IN iparam_email  character varying>,
-- 	,'JHONCENA'				-- <IN iparam_vehicle_number  character varying>,
-- 	,'Pending'				-- <IN iparam_status  character varying>
-- );