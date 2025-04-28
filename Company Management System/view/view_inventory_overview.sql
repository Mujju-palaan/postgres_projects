-- View for Inventory Overview
-- Write a view to display the available inventory of each product, showing product name, product_category, quantity in stock and re-order level.

create or replace view view_inventory_overview AS
select 
	product_name
	,product_category
	,current_quantity as quantity_in_stoack
	,order_level as re_order_level
from product
;

-- select * from view_inventory_overview;