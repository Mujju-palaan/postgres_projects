-- Stored Procedure for Restuarant Information
-- Create a stored procedure to fetch details of all restaurants.
-- select * from Restaurant;
drop function fun_get_restuarant_details

create or replace function fun_get_restuarant_details(iparam_restuarant_id int)
returns table(
	trestaurant_id int
	,trestaurant_name varchar
	,tlocation varchar
	,tcontact_number varchar
)
AS $$

BEGIN
	return query

	----select
	select 
		restaurant_id::int
		,restaurant_name::varchar
		,location::varchar
		,contact_number::varchar
	from restaurant
	where restaurant_id = iparam_restuarant_id
	;
	
END;
$$ language plpgsql;


select * from fun_get_restuarant_details(5);




