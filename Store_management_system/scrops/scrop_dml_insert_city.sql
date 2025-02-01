
------------------------insert scrop------------------------------------
create or replace procedure scrop_dml_insert_city(
	IN iparam_country_name varchar,
	IN iparam_city_name varchar
)
language plpgsql
AS $$

BEGIN
	insert into city(country_name, city_name)
	values (iparam_country_name, iparam_city_name);

END;
$$;

--call scrop_dml_insert_city('Canada','Ottawa');
