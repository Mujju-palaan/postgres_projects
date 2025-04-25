-- Stored Procedure for Menu Creation
-- Create a stored procedure to insert data into the menu_item table.
-- select * from menu_item;

create or replace procedure scrop_insert_menu_item(
	IN iparam_item_name varchar
	,IN iparam_item_category varchar
	,IN iparam_price numeric
	,IN iparam_restaurant_id int
)
AS $$

BEGIN
	---insert
	insert into menu_item(item_name, item_category, price, restaurant_id)
	values(iparam_item_name, iparam_item_category, iparam_price, iparam_restaurant_id)
	;

END;
$$ language plpgsql;

-- call scrop_insert_menu_item('Marag','Starter','5.00', 19);















