-- 2)View for Account Details
-- Create a database view that displays account details, customer_id, first_name, last_name, account_id, account_type, 
--and balance. Include the city name and country name using appropriate joins.

create or replace view view_customer_account_details as
	select a.customer_id
		,a.first_name
		,a.last_name
		,b.account_id
		,b.account_type
		,b.balance
		,c.city_name
		,c.country_name
	from customer a
	inner join account b using(customer_id)
	inner join city c using(city_id)
;

--select * from view_customer_account_details;
