-- View for Order Overview
-- Design a view to retrieve order details, including Order ID, Order Date, Customer Name, Amount, Order Status, 
--Delivery Status, and Delivery Agent's Phone Number.

create or replace view view_order_overview AS
select 
	a.order_id
	,a.order_date
	,b.first_name||' '||b.last_name as customer_name
	,c.amount
	,a.status as order_status
	,d.status as delivery_status
	,e.phone_number
from "ORDER" a
inner join customer b using(customer_id)
inner join payment c using(order_id)
inner join delivery d ON a.order_id = d.order_id
inner join delivery_agent e using(agent_id)
;

-- select * from view_order_overview;