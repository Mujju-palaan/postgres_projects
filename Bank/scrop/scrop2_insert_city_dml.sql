-- 2)Stored Procedure for City Management
-- Write a stored procedure to insert a new record into the CITY table. The procedure should take country_name 
--and city_name as input parameters.

create or replace procedure scrop_insert_city_dml(
	IN iparam_country_name varchar
	,IN iparam_city_name varchar
)
language plpgsql
as $$

BEGIN
	--insert (select * from city)
	insert into city(country_name, city_name)
	values(iparam_country_name,iparam_city_name)
	;

END;
$$;

--call scrop_insert_city_dml('India','Hyderabad');
